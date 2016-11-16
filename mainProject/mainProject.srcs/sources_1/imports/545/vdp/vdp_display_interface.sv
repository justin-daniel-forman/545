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
  output logic             VRAM_go, screenBusy
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
  logic       validSprite; // Used to let sprites hijack CRAM
  logic [2:0] sprPatRow, sprPatRow_1, sprPatRow_2;
  logic [2:0] sprCnt, sprCnt_1, sprCnt_2, sprCnt_3, sprCnt_4;  

  logic [7:0][255:0] sprPatLatch_out;
  logic [7:0]        validHPOS;
  logic [7:0][2:0]   spriteOffset;
  logic [2:0]        bgPatOffset;

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

  assign pixelRow = row - 9'd48;
  assign pixelCol = col - 10'd64 + 10'd6; // Add 6 to pre-fetch pixel data for the pipeline

  // Each pixel position is 2 bytes, so -------------------|
  assign bgSel_in = (SW[0]) ? {regFile[2][3:1], pixelRow[8:4], pixelCol[8:4], 1'b0} :
                              {regFile[2][3:1], regFile[2][0] & pixelRow[8], pixelRow[7:4], pixelCol[8:4], 1'b0}; 
                              // Either blank screen or iterating

  assign VRAM_VGA_addr[0] = bgSel_out;
  assign VRAM_VGA_addr[1] = bgSel_out + 14'd1;

  // When bit 1 of R1 is set, add 32 for the bottom half - SPRITES ONLY
  assign VRAM_VGA_addr[2] = (col < 10'd57) ? {regFile[6][2], sprPat, sprPatRow, 2'd0} : charPatternAddr;
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

  assign patSelLatch1_in = VRAM_VGA_data_out[1];
  assign patSelLatch2_in = VRAM_VGA_data_out[0]; // Little Endian, MSB goes in first

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
  assign colorLatchIndex = col + 1;
  
  always_comb begin
    if (horizFlip) begin
      CRAM_addr_BG = {
        paletteSel,
        colorLatch_out[0][3'd7-colorLatchIndex[3:1]], 
        colorLatch_out[1][3'd7-colorLatchIndex[3:1]],
        colorLatch_out[2][3'd7-colorLatchIndex[3:1]],
        colorLatch_out[3][3'd7-colorLatchIndex[3:1]]
      };
    end
    else begin
      CRAM_addr_BG = {
        paletteSel,
        colorLatch_out[0][colorLatchIndex[3:1]], 
        colorLatch_out[1][colorLatchIndex[3:1]],
        colorLatch_out[2][colorLatchIndex[3:1]],
        colorLatch_out[3][colorLatchIndex[3:1]]
      };
    end
  end

  /******* RGB Generation *******/

  assign colorToDisplay = (blank) ? 6'd0 : CRAM_VGA_data_out;
  colorGen c1(colorToDisplay[1:0], VGA_R);
  colorGen c2(colorToDisplay[3:2], VGA_G); 
  colorGen c3(colorToDisplay[5:4], VGA_B);

  /******* Disp FSM *******/

  //logic [2:0] disp_state;

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
    .VRAM_sprite_data(VRAM_VGA_data_out[7:2]),
    .VRAM_go(VRAM_go_SPR),
    .sprPat, 
    .validSprite,
    .validHPOS,
    .VRAM_sprite_addr(VRAM_VGA_addr[7:6]),
    .sprPatRow_out(sprPatRow),
    .sprCnt,
    .spriteOffset,
    .regFile
  );

  // Sprite Pattern Latches - *******TODO: Need to enable the right registers at the right time

  // Delay the sprite row index by 2 clock cycles to sync with the result from VRAM
  // Doesn't actually get used anymore (?)
  register #(3) SPR_PAT_ROW_1(.*, .D(sprPatRow),   .Q(sprPatRow_1), .en(1'b1));
  register #(3) SPR_PAT_ROW_2(.*, .D(sprPatRow_1), .Q(sprPatRow_2), .en(1'b1));

  // Delay the sprite count by 3 clock cycles to sync with the result from VRAM
  register #(3) SPR_CNT_1(.*, .D(sprCnt),   .Q(sprCnt_1), .en(1'b1));
  register #(3) SPR_CNT_2(.*, .D(sprCnt_1),   .Q(sprCnt_2), .en(1'b1));
  register #(3) SPR_CNT_3(.*, .D(sprCnt_2),   .Q(sprCnt_3), .en(1'b1));
  register #(3) SPR_CNT_4(.*, .D(sprCnt_3),   .Q(sprCnt_4), .en(1'b1)); // Might not be necessary

  // Sprite Pattern Row Buffer
  generate
    genvar i;
    genvar j;
    for(i = 0; i < 8; i++) begin      // 8 Possible Sprites
      for(j = 0; j < 8; j++) begin    // 8 sets of 4 bytes, for a total of 32 bytes per pattern
        logic [3:0][7:0] B;
        assign sprPatLatch_out[i][(j*4+1)*8-1:(j*4+0)*8] = B[0]; // Might be reversed
        assign sprPatLatch_out[i][(j*4+2)*8-1:(j*4+1)*8] = B[1];
        assign sprPatLatch_out[i][(j*4+3)*8-1:(j*4+2)*8] = B[2];
        assign sprPatLatch_out[i][(j*4+4)*8-1:(j*4+3)*8] = B[3];
        register #(8) SPR_PAT_LATCH [3:0] (
          .clk,
          .rst_L,
          .D(VRAM_VGA_data_out[5:2]),
          .Q(B),
          .en((sprPatRow == j) && (sprCnt_4 == i))
        );
      end
    end
  endgenerate
 
  logic [3:0][7:0]  currSprRow;
  
  spritePartition SPR_PARTITION(
    .sprPatLatch_out,
    .spriteOffset,
    .currSprRow,
    .validHPOS
  );  
  
  logic [3:0] sprColorIndex;

  assign CRAM_addr_SPR = {
    1'b0,
    currSprRow[0][sprColorIndex[3:1]],
    currSprRow[1][sprColorIndex[3:1]],
    currSprRow[2][sprColorIndex[3:1]],
    currSprRow[3][sprColorIndex[3:1]]
  };
  
  // Iterates over the bits in a 4-byte row to generate the palettes
  counter #(4) SPR_COLOR_INDEX(
    .clk,
    .rst_L,
    .en(validSprite),
    .clear(col > 10'd575),
    .count(sprColorIndex)
  );

  always_comb begin
    if (validSprite) begin
      if (CRAM_addr_SPR == 5'd0) begin
        CRAM_VGA_addr = CRAM_addr_BG;
      end
      else CRAM_VGA_addr = CRAM_addr_SPR;
    end
    else CRAM_VGA_addr = CRAM_addr_BG;
  end

  //assign CRAM_VGA_addr = (~validSprite) ? CRAM_addr_BG : CRAM_addr_SPR;
  assign VRAM_go = VRAM_go_BG || VRAM_go_SPR;

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

  enum logic [2:0] {WaitInit, PosFetch, WaitForPos, PatFetch, WaitForPat, RowLoad, Wait} cs, ns; 

  // Next State Logic
  always_comb begin
    case(cs)
      WaitInit:   ns = ((row >= 48 && row < 432) && col < 58) ? PosFetch : WaitInit;
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
