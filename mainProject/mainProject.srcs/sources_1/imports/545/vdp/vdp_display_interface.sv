/* vdp_disp_interface
 * Description: Interfaces between VRAM and the VGA output on the board.
 *              Specifically controls what pixel we should process and 
 *              outputs the corresponding colors depending on what the 
 *              screen looks like.
 */
module vdp_disp_interface(
  input  logic             clk, rst_L, // 25 MHz clock
  input  logic [7:0][7:0]  VRAM_VGA_data_out,
  input  logic      [5:0]  CRAM_VGA_data_out,
  input  logic [10:0][7:0] regFile, // Used for various things
  input  logic      [9:0]  col,
  input  logic      [8:0]  row,
  input  logic      [7:0]  SW,
  output logic [7:0][13:0] VRAM_VGA_addr,
  output logic      [4:0]  CRAM_VGA_addr,
  output logic      [3:0]  VGA_R, VGA_G, VGA_B,
  output logic             VRAM_go, screenBusy,
  output logic             sprCollision, sprOverflow
);

  logic       patSelLatch_en; // Set in disp_fsm
  logic [7:0] patSelLatch1_in, patSelLatch1_out, patSelLatch2_in, patSelLatch2_out;

  // Determines where the screen should be blank, since 256x192 doesn't divide 640x480 evenly
  logic       blank;
  assign blank = ((col < 10'd64) || (col > 10'd575)) || ((row < 10'd48) || (row > 10'd431));

  // Screen Map Pattern Parsing
  logic [13:0] charPatternAddr;
  logic        paletteSel, horizFlip, vertFlip, patInBg;

  // Background Select Logic
  logic [13:0] bgSel_in, bgSel_out;
  logic        bgSel_en; // Set in disp_fsm

  // Color Latch Logic
  logic [3:0][7:0] colorLatch_out;
  logic            colorLatch_en;

  // Misc stuff
  logic [5:0] colorToDisplay;
  logic [4:0] CRAM_addr_BG, CRAM_addr_SPR;
  logic       VRAM_go_BG, VRAM_go_SPR;
  logic [7:0] sprPat;  
  logic [7:0] validSprite; // Used to let sprites hijack CRAM
  logic [2:0] sprPatRow, sprPatRow_1, sprPatRow_2;
  logic [3:0] sprCnt, sprCnt_1, sprCnt_2, sprCnt_3, sprCnt_4;  

  logic [7:0][255:0] sprPatLatch_out;
  logic [7:0]        validHPOS;
  logic [7:0][2:0]   spriteOffset;
  logic [2:0]        bgPatOffset;
  logic [2:0]        currSprIndex;
  logic [7:0][3:0]   sprColorIndex;
  logic              bottomHalf_latched;
  logic [3:0]        sprCollisionCount;

  /******** Background Select Register ********/
 
  register #(14) bgSelReg(
    .clk, 
    .rst_L,
    .D(bgSel_in),
    .Q(bgSel_out),
    .en(bgSel_en)
  );

  logic [8:0] pixelRow;
  logic [9:0] pixelCol;

  // Offset for 256x192 aspect ratio
  assign pixelRow = (regFile[0][7] & (col > 10'd448)) ?   // 64 + 8*2*24 = 448 
                    row - 9'd48 : 
                    row - 9'd48 + {regFile[9], 1'b0};

  // Offset as above, but added functionality of horizontal scrolling. 8-bit value, multiplied by 2 for doubled aspect ratio.
  // 6 added to pre-fetch pixel data for pipeline
  assign pixelCol = (regFile[0][6] & (row < 9'd80)) ?                // 48 + 32 = 80 
                    col - 10'd64 + 10'd6 :                           // If regFile[0][6] is set, don't scroll for scanlines 0-15 (rows 0-31)
                    col - 10'd64 + {1'b0, regFile[8], 1'b0} + 10'd6; // Otherwise, do as above.

  assign bgSel_in = {regFile[2][3:1], pixelRow[8:4], pixelCol[8:4], 1'b0}; 

  assign VRAM_VGA_addr[0] = bgSel_out;
  assign VRAM_VGA_addr[1] = bgSel_out + 14'd1;

  always_comb begin
    if (col <= 10'd57) begin
      VRAM_VGA_addr[2] = {regFile[6][2], (sprPat + (bottomHalf_latched & regFile[1][1])), sprPatRow, 2'd0}; 
    end
    else VRAM_VGA_addr[2] = charPatternAddr;
  end

  assign VRAM_VGA_addr[3] = VRAM_VGA_addr[2] + 2'd1;  
  assign VRAM_VGA_addr[4] = VRAM_VGA_addr[2] + 2'd2; // Pixel colors are stored across 4 bytes each.
  assign VRAM_VGA_addr[5] = VRAM_VGA_addr[2] + 2'd3;

  /******** Pattern Selection Latches ********/

  register #(8) patSelLatch1(
    .clk,
    .rst_L,
    .D(patSelLatch1_in),
    .Q(patSelLatch1_out),
    .en(patSelLatch_en)
  );

  register #(8) patSelLatch2(
    .clk,
    .rst_L,
    .D(patSelLatch2_in),
    .Q(patSelLatch2_out),
    .en(patSelLatch_en)
  );

  assign patSelLatch1_in = SW[0] ? VRAM_VGA_data_out[1] : VRAM_VGA_data_out[0];
  assign patSelLatch2_in = SW[0] ? VRAM_VGA_data_out[0] : VRAM_VGA_data_out[1]; // Little Endian, MSB goes in first

  /******** patSel Parsing ********/
  
  assign bgPatOffset =     (vertFlip) ? 3'd7 - pixelRow[3:1] : pixelRow[3:1];
  assign charPatternAddr = {patSelLatch1_out[0], patSelLatch2_out, bgPatOffset, 2'd0}; // 14-bit signal to differentiate 512 patterns of 32 bytes each
  assign horizFlip =       patSelLatch1_out[1];
  assign vertFlip =        patSelLatch1_out[2];
  assign paletteSel =      patSelLatch1_out[3];
  assign patInBg =         patSelLatch1_out[4];
  
  /******** Color Latches ********/

  register #(8) colorLatch [3:0] (
    .clk,
    .rst_L,
    .D(VRAM_VGA_data_out[5:2]), // Again, little endian
    .Q(colorLatch_out[3:0]),
    .en(colorLatch_en)
  );  
  
  logic [9:0] colorLatchIndex; 
  assign colorLatchIndex = pixelCol - 10'd5;
  
  always_comb begin
    if (horizFlip) begin
      CRAM_addr_BG = {
        paletteSel,
        colorLatch_out[SW[7] ? 3 : 0][colorLatchIndex[3:1]], 
        colorLatch_out[SW[7] ? 2 : 1][colorLatchIndex[3:1]],
        colorLatch_out[SW[7] ? 1 : 2][colorLatchIndex[3:1]],
        colorLatch_out[SW[7] ? 0 : 3][colorLatchIndex[3:1]]
      };
    end
    else begin
      CRAM_addr_BG = {
        paletteSel,
        colorLatch_out[SW[7] ? 3 : 0][3'd7-colorLatchIndex[3:1]], 
        colorLatch_out[SW[7] ? 2 : 1][3'd7-colorLatchIndex[3:1]],
        colorLatch_out[SW[7] ? 1 : 2][3'd7-colorLatchIndex[3:1]],
        colorLatch_out[SW[7] ? 0 : 3][3'd7-colorLatchIndex[3:1]]
      };
    end
  end

  /******* RGB Generation *******/
  assign colorToDisplay = (blank) /*|| (~regFile[1][6]))*/ ? 6'd0 : CRAM_VGA_data_out;
  //assign colorToDisplay = (blank | regFile[1][6]) ? 6'd0 : CRAM_VGA_data_out;
  colorGen c1(colorToDisplay[1:0], VGA_R);
  colorGen c2(colorToDisplay[3:2], VGA_G); 
  colorGen c3(colorToDisplay[5:4], VGA_B);

  /******* Disp FSM *******/

  disp_fsm DISP_FSM(
    .*,
    .row,
    .col(colorLatchIndex),
    .bgSel_en,
    .patSelLatch_en,
    .colorLatch_en,
    .screenBusy,
    .VRAM_go(VRAM_go_BG)
  );

  /******* Sprite Handling *******/

  vdp_sprite_interface SPRITE_LOGIC(
    .clk, 
    .rst_L,
    .row,
    .col,
    .screenBusy,
    .regFile,
    .VRAM_sprite_data(VRAM_VGA_data_out[7:2]),
    .VRAM_go(VRAM_go_SPR),
    .sprPat, 
    .validSprite,
    .validHPOS,
    .VRAM_sprite_addr(VRAM_VGA_addr[7:6]),
    .sprPatRow_out(sprPatRow),
    .sprCnt,
    .spriteOffset,
    .bottomHalf_latched
  );

  // Sprite Pattern Latches - *******TODO: Need to enable the right registers at the right time

  // Delay the sprite row index by 2 clock cycles to sync with the result from VRAM
  // Doesn't actually get used anymore (?)
  register #(3) SPR_PAT_ROW_1(.*, .D(sprPatRow),   .Q(sprPatRow_1), .en(1'b1));
  register #(3) SPR_PAT_ROW_2(.*, .D(sprPatRow_1), .Q(sprPatRow_2), .en(1'b1));

  // Delay the sprite count by 3 clock cycles to sync with the result from VRAM
  register #(4) SPR_CNT_1(.*, .D(sprCnt),   .Q(sprCnt_1), .en(1'b1));
  register #(4) SPR_CNT_2(.*, .D(sprCnt_1),   .Q(sprCnt_2), .en(1'b1));
  register #(4) SPR_CNT_3(.*, .D(sprCnt_2),   .Q(sprCnt_3), .en(1'b1));
  register #(4) SPR_CNT_4(.*, .D(sprCnt_3),   .Q(sprCnt_4), .en(1'b1));

  // Sprite Pattern Row Buffer
  generate
    genvar i, j;
    for(i = 0; i < 8; i++) begin      // 8 Possible Sprite locations
      for(j = 0; j < 8; j++) begin    // 8 sets of 4 bytes, for a total of 32 bytes per pattern
        logic [3:0][7:0] B;
        assign sprPatLatch_out[i][(j*4+1)*8-1:(j*4+0)*8] = B[0]; 
        assign sprPatLatch_out[i][(j*4+2)*8-1:(j*4+1)*8] = B[1];
        assign sprPatLatch_out[i][(j*4+3)*8-1:(j*4+2)*8] = B[2];
        assign sprPatLatch_out[i][(j*4+4)*8-1:(j*4+3)*8] = B[3];
        register_clr #(8) SPR_PAT_LATCH [3:0] (
          .clk,
          .rst_L,
          .D(VRAM_VGA_data_out[5:2]),
          .Q(B),
          .en((sprPatRow == j) & (sprCnt_4[2:0] == i)),
          .clr((pixelRow > 9'd383) | ((col == 10'd576) & SW[6]))
        ); // Probably need something more here... 
      end
      // Iterates over the bits in a 4-byte row to generate the palettes
      counter #(4) SPR_COLOR_INDEX(
        .clk,
        .rst_L,
        .en(validSprite[i]),
        .clear(col > 10'd575), // Currently useless
        .count(sprColorIndex[i])
      );
    end
  endgenerate 

  logic [3:0][7:0] currSprRow;
  
  spritePartition SPR_PARTITION(
    .sprPatLatch_out,
    .spriteOffset,
    .currSprRow,
    .validHPOS,
    .currSprIndex
  );  

  assign CRAM_addr_SPR = {
    1'b1,
    currSprRow[SW[7] ? 3 : 0][3'd7 - sprColorIndex[currSprIndex][3:1]],
    currSprRow[SW[7] ? 2 : 1][3'd7 - sprColorIndex[currSprIndex][3:1]],
    currSprRow[SW[7] ? 1 : 2][3'd7 - sprColorIndex[currSprIndex][3:1]],
    currSprRow[SW[7] ? 0 : 3][3'd7 - sprColorIndex[currSprIndex][3:1]]
  }; 
   
  always_comb begin
    if (regFile[0][5] & (col + 1 < 16)) CRAM_VGA_addr = {1'b0, regFile[7][3:0]};
    else if (|validSprite) begin
      if (CRAM_addr_SPR == 5'd0) begin
        CRAM_VGA_addr = CRAM_addr_BG;
      end
      else CRAM_VGA_addr = CRAM_addr_SPR;
    end
    else CRAM_VGA_addr = CRAM_addr_BG;
  end

  assign VRAM_go = VRAM_go_BG || VRAM_go_SPR;

  /******* Interrupt Generation *******/

  // E.g: If sprCnt is 4, sprite entries 0-3 are all valid, so count validSprites for 0-3  
  assign sprCollisionCount = (validSprite[0] + 
                             (validSprite[1] & (sprCnt_4 > 4'd1)) + 
                             (validSprite[2] & (sprCnt_4 > 4'd2)) + 
                             (validSprite[3] & (sprCnt_4 > 4'd3)) + 
                             (validSprite[4] & (sprCnt_4 > 4'd4)) + 
                             (validSprite[5] & (sprCnt_4 > 4'd5)) + 
                             (validSprite[6] & (sprCnt_4 > 4'd6)) + 
                             (validSprite[7] & (sprCnt_4 > 4'd7)));

  assign sprCollision = (sprCollisionCount > 4'd1);

  assign sprOverflow = sprCnt[3];

endmodule

// FSM for vdp_disp_interface
module disp_fsm(
  input  logic       clk, rst_L,
  input  logic [9:0] col,
  input  logic [8:0] row,
  output logic       bgSel_en, patSelLatch_en, colorLatch_en,
  output logic       screenBusy,
  output logic       VRAM_go // Read from VRAM signal
);

  enum logic [2:0] {WaitInit, PosFetch, WaitForPos, 
                    PatFetch, WaitForPat, RowLoad, Wait} 
                    cs, ns; 

  // Next State Logic
  always_comb begin
    case(cs)
      WaitInit: begin
        ns = ((row >= 48 && row < 432) && (col > 57)) ? PosFetch : WaitInit;
      end
      PosFetch:   ns = WaitForPos;
      WaitForPos: ns = PatFetch;
      PatFetch:   ns = WaitForPat;
      WaitForPat: ns = RowLoad;
      RowLoad:    ns = Wait;
      Wait: begin
        if (col[3:0] == 10'd10) begin
          ns = (col < 570) ? PosFetch : WaitInit;
        end
        else begin
          ns = Wait;
        end
      end
      default:    ns = Wait;
    endcase
  end

  // Output Logic
  always_comb begin
    VRAM_go = 0;
    colorLatch_en = 0;
    bgSel_en = 0;
    patSelLatch_en = 0;
    screenBusy = 1;
    case(cs)
      WaitInit: begin
        screenBusy = 0;
      end  
      PosFetch: begin
        bgSel_en = 1; 
      end
      WaitForPos: begin
        VRAM_go = 1;
        // No outputs
      end
      PatFetch: begin
        patSelLatch_en = 1; 
      end
      WaitForPat: begin
        VRAM_go = 1;
        // No outputs
      end
      RowLoad: begin
        colorLatch_en = 1;
      end
      Wait: begin

      end
      default: begin
        colorLatch_en = 0;
        bgSel_en = 0;
        patSelLatch_en = 0;
        screenBusy = 1;
      end
    endcase
  end

  always_ff @(posedge clk, negedge rst_L) begin
    if (~rst_L) cs <= WaitInit;
    else        cs <= ns;
  end

endmodule
