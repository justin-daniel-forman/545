module vdp_sprite_interface(
  input  logic             clk, rst_L,
  input  logic [8:0]       row,
  input  logic [9:0]       col,
  input  logic             screenBusy,
  input  logic [10:0][7:0] regFile,
  input  logic [5:0][7:0]  VRAM_sprite_data, 
  output logic             VRAM_go,
  output logic [7:0]       sprPat, // Feeds into VRAM addr 2-5
  output logic [1:0][13:0] VRAM_sprite_addr,
  output logic             validSprite,
  output logic [7:0]       validHPOS,
  output logic [2:0]       sprPatRow_out,
  output logic [2:0]       sprCnt,
  output logic [7:0][2:0]  spriteOffset,
  output logic             bottomHalf_latched
);

  logic [8:0] pixelRow;
  logic [9:0] pixelCol;
  assign pixelRow = row - 9'd48;
  assign pixelCol = col - 10'd64; 

  // PosReg logic
  logic [5:0] posReg_in, posReg_out;
  logic       posReg_en, posReg_incr;

  // VRAM addressing logic   
  logic       VPOSorHPOS;

  // VRAM data handling logic
  logic [7:0][7:0] VPOSlatch_out;
  logic [7:0]      VPOSlatch_en;
  logic [7:0][7:0] HPOSlatch_out;
  logic [7:0]      HPOSlatch_en;
  logic            HPOSlatch_set, VPOSlatch_set, sprLatch_en;
  logic [7:0]      sprLatch_in, sprLatch_out;
  logic            bottomHalf, bottomHalf_1, bottomHalf_2, bottomHalf_3;

  // FSM Status Points
  logic doneTable, validVPOS;

  // Sprite Counter logic
  logic       sprCnt_en, sprCnt_clr;
  logic       sprPatRow_en, sprPat_done;
  logic       VRAM_go_RC, VRAM_go_SPR;
  
  /******* Position Register *******/
  // Keeps track of where in the SAT we are

  register #(6) posReg(
    .clk,
    .rst_L,
    .D(posReg_in),
    .Q(posReg_out),
    .en(posReg_en)
  );

  assign posReg_in = (posReg_incr) ? posReg_out + 6'd1 : 6'd0;

  /******* VRAM Addressing *******/

  // VRAM_addr_6
  assign VRAM_sprite_addr[0] = (~VPOSorHPOS) ? 
    {regFile[5][6:1], 2'd0, posReg_out} :
    {regFile[5][6:1], 1'b1, posReg_out, 1'd0};

  assign VRAM_sprite_addr[1] = VRAM_sprite_addr[0] + 14'd1;

  /******* VRAM Data Handling *******/

  assign VPOSlatch_clr = (col > 575);
  assign HPOSlatch_clr = (col > 575);

  comparator #(8) doneTableCheck(
    .A(VRAM_sprite_data[4]),
    .B(8'hD0),
    .AgtB(),
    .AltB(),
    .AeqB(doneTable)
  );

  inRange #(8) validVPOSCheck(
    .IN(pixelRow[8:1]),
    .hi(VRAM_sprite_data[4] + (regFile[1][1] ? 8'd15 : 8'd7)),
    .lo(VRAM_sprite_data[4]),
    .inRange(validVPOS)
  );

  inRange #(8) bottomHalfFlag(
    .IN(pixelRow[8:1]),
    .hi(VRAM_sprite_data[4] + 8'd15),
    .lo(VRAM_sprite_data[4] + 8'd8),
    .inRange(bottomHalf)
  );

  generate
    genvar i; 
    for (i = 0; i < 8; i++) begin
      register_clr #(8) VPOSlatch(
        .clk, .rst_L,
        .D(VRAM_sprite_data[4]),
        .Q(VPOSlatch_out[i]),
        .en(VPOSlatch_en[i]),
        .clr(VPOSlatch_clr)
      );
      register_clr #(8) HPOSlatch(
        .clk, .rst_L,
        .D(VRAM_sprite_data[4]),
        .Q(HPOSlatch_out[i]),
        .en(HPOSlatch_en[i]),
        .clr(HPOSlatch_clr)
      );
      assign spriteOffset[i] = pixelRow[3:1] - VPOSlatch_out[i][2:0];
      assign HPOSlatch_en[i] = (sprCnt == i) && HPOSlatch_set;
      assign VPOSlatch_en[i] = (sprCnt == i) && VPOSlatch_set;
      inRange #(8) validHPOSCheck (
        .IN(pixelCol[8:1]),
        .hi(HPOSlatch_out[i] + 8'd7),
        .lo(HPOSlatch_out[i]),
        .inRange(validHPOS[i])
      );
    end
  endgenerate

  always_comb begin
    validSprite = 0;
    case(sprCnt)
      0: validSprite = 0;
      1: validSprite = |validHPOS[0] & (col >= 64 && col < 576);
      2: validSprite = |validHPOS[1:0] & (col >= 64 && col < 576);
      3: validSprite = |validHPOS[2:0] & (col >= 64 && col < 576);
      4: validSprite = |validHPOS[3:0] & (col >= 64 && col < 576);
      5: validSprite = |validHPOS[4:0] & (col >= 64 && col < 576);
      6: validSprite = |validHPOS[5:0] & (col >= 64 && col < 576);
      7: validSprite = |validHPOS[6:0]  & (col >= 64 && col < 576);
      // 8 valid sprites, may need to make sprCnt 4 bits
      default: validSprite = 0;
    endcase
  end 

  // Register to latch the pattern address of the current sprite
  register #(8) sprLatch(
    .clk, .rst_L,
    .D(sprLatch_in),
    .Q(sprLatch_out),
    .en(sprLatch_en)
  );

  register #(1) BH_DELAY_1(.*, .D(bottomHalf), .Q(bottomHalf_1), .en(1'b1));
  register #(1) BH_DELAY_2(.*, .D(bottomHalf_1), .Q(bottomHalf_2), .en(1'b1));
  register #(1) BH_DELAY_3(.*, .D(bottomHalf_2), .Q(bottomHalf_3), .en(1'b1));

  register #(1) bottomHalfLatch(
    .clk, .rst_L,
    .D(bottomHalf_3),
    .Q(bottomHalf_latched),
    .en(sprLatch_en)
  );

  assign sprLatch_in = VRAM_sprite_data[5];
  assign sprPat = sprLatch_out;

  // FSM to read different pattern rows out of VRAM
  vdp_sprite_pattern_row_control SPR_PAT_DIV_CTRL(
    .clk,
    .rst_L,
    .sprLatch_en,
    .sprPatRow_en,
    .sprPatRow_out,
    .VRAM_go(VRAM_go_RC),
    .sprPat_done
  );

  /******* Various Counters *******/ 

  // Selects the current sprite
  counter #(3) SPRITE_COUNT(
    .clk, .rst_L,
    .clear(sprCnt_clr),
    .en(sprCnt_en),
    .count(sprCnt)
  );

  // Selects the row in the current sprite to read out
  counter #(3) SPRITE_PAT_ROW(
    .clk,
    .rst_L,
    .clear(sprPat_done),
    .en(sprPatRow_en),
    .count(sprPatRow_out)
  );

  /******** FSM *******/

  vdp_sprite_fsm SPRITE_FSM(
    .clk, .rst_L,
    .row,
    .col,
    .doneTable,
    .validVPOS,
    .posReg_en,
    .posReg_incr,
    .VPOSorHPOS,
    .VPOSlatch_set,
    .HPOSlatch_set,
    .VRAM_go(VRAM_go_SPR),
    .sprLatch_en,
    .sprCnt_en,
    .sprCnt_clr,
    .sprPat_done
  );

  assign VRAM_go = VRAM_go_SPR || VRAM_go_RC;

endmodule

module vdp_sprite_fsm(
  input  logic clk, rst_L,
  input  logic [8:0] row, 
  input  logic [9:0] col,
  input  logic doneTable, validVPOS, sprPat_done,
  output logic posReg_en, posReg_incr, 
  output logic VPOSorHPOS, // VPOS = 0, HPOS = 1 
  output logic VPOSlatch_set, HPOSlatch_set,
  output logic VRAM_go, sprLatch_en, sprCnt_en, sprCnt_clr
);

  enum logic [3:0] {WaitInit, SetVPOS, WaitVPOS, LoadVPOS, 
                    SetHPOS, WaitHPOS, LoadHPOS, WaitForPattern,
                    WaitDone} 
                    cs, ns;

  // Next State logic
  always_comb begin
    ns = WaitInit;
    case(cs)
      WaitInit: ns = ((row >= 9'd48 && row < 9'd432) && col < 64) ? SetVPOS : WaitInit;
      SetVPOS:  ns = WaitVPOS;
      WaitVPOS: ns = LoadVPOS;
      LoadVPOS: begin
        ns = (doneTable) ?
        WaitDone :  
        ((validVPOS) ? SetHPOS : SetVPOS);
      end
      SetHPOS:  ns = WaitHPOS;
      WaitHPOS: ns = LoadHPOS;
      LoadHPOS: ns = (row < 9'd432) ? WaitForPattern : WaitDone;
      WaitForPattern: ns = (sprPat_done) ? SetVPOS : WaitForPattern;
      WaitDone: ns = (col < 10'd576) ? WaitDone : WaitInit;
      default:  ns = WaitInit;
    endcase
  end

  // Output logic
  always_comb begin
    posReg_en = 0;
    posReg_incr = 0;
    VPOSorHPOS = 0;
    VPOSlatch_set = 0;
    HPOSlatch_set = 0;
    VRAM_go = 0;
    sprLatch_en = 0;
    sprCnt_en = 0;
    sprCnt_clr = 0;
    case(cs)
      WaitInit: begin
        posReg_en = 1;
        sprCnt_clr = 1;
        sprCnt_en = 1;
      end
      SetVPOS: begin
        VRAM_go = 1;
      end
      WaitVPOS: begin
        // No outputs
      end
      LoadVPOS: begin
        VPOSlatch_set = validVPOS && ~doneTable;
        VPOSorHPOS = validVPOS && ~doneTable;
        posReg_en = ~validVPOS && ~doneTable;
        posReg_incr = ~validVPOS && ~doneTable;
      end
      SetHPOS: begin
        VRAM_go = 1;
        VPOSorHPOS = 1;
      end
      WaitHPOS: begin
        VPOSorHPOS = 1;
      end
      LoadHPOS: begin
        VPOSorHPOS = 1;
        posReg_en = 1;
        posReg_incr = (row < 9'd432);
        HPOSlatch_set = 1;
        sprLatch_en = 1;
      end
      WaitForPattern: begin
        sprCnt_en = (sprPat_done);
      end
      WaitDone: begin
        // No outputs
      end
      default: begin
        posReg_en = 0;
        posReg_incr = 0;
        VPOSorHPOS = 0;
        VPOSlatch_set = 0;
        HPOSlatch_set = 0;
        VRAM_go = 0;
        sprLatch_en = 0;
        sprCnt_en = 0;
        sprCnt_clr = 0;
      end
    endcase
  end

  always_ff @(posedge clk, negedge rst_L)
    cs <= (~rst_L) ? WaitInit : ns;

endmodule

// When the sprite pattern address gets latched, 
// read out the 8 different rows of the corresponding pattern.
module vdp_sprite_pattern_row_control(
  input  logic       clk, rst_L,
  input  logic       sprLatch_en,
  input  logic [2:0] sprPatRow_out,
  output logic       sprPatRow_en,
  output logic       VRAM_go, sprPat_done
);

  enum logic [1:0] {Wait, getPat, incRow} cs, ns;

  always_comb begin
    sprPatRow_en = 0;
    sprPat_done = 0;
    VRAM_go = 0;
    
    // NS logic
    case(cs)
      Wait: ns = (sprLatch_en) ? getPat : Wait;
      getPat: ns = incRow; 
      incRow: ns = (sprPatRow_out == 3'd7) ? Wait : getPat;
      default: ns = Wait;
    endcase
 
    // Output logic
    case(cs)
      Wait: begin
        sprPatRow_en = 0;
      end
      getPat: begin
        VRAM_go = 1;
      end
      incRow: begin
        sprPatRow_en = 1;
        sprPat_done = (sprPatRow_out == 3'd7);
      end
      default: begin
        sprPatRow_en = 0;
        VRAM_go = 0;
        sprPat_done = 0;
      end
    endcase
  end

  always_ff @(posedge clk, negedge rst_L) begin
    cs <= (~rst_L) ? Wait : ns;
  end

endmodule

// Combination logic partitioning the 256B sprite read out of VRAM
// into 4-byte pixel rows.
module spritePartition(
  input  logic [7:0]        validHPOS,
  input  logic [7:0][2:0]   spriteOffset,
  input  logic [7:0][255:0] sprPatLatch_out,
  output logic [3:0][7:0]   currSprRow,
  output logic [2:0]        currSprIndex
);
  
  logic [31:0][7:0] currSprPat;

  always_comb
    if(validHPOS[0]) begin
      currSprIndex = 3'd0;
    end 
    else if(validHPOS[1]) begin
      currSprIndex = 3'd1;
    end 
    else if(validHPOS[2]) begin
      currSprIndex = 3'd2;
    end 
    else if(validHPOS[3]) begin
      currSprIndex = 3'd3;
    end 
    else if(validHPOS[4]) begin
      currSprIndex = 3'd4;
    end 
    else if(validHPOS[5]) begin
      currSprIndex = 3'd5;
    end 
    else if(validHPOS[6]) begin
      currSprIndex = 3'd6;
    end 
    else if(validHPOS[7]) begin
      currSprIndex = 3'd7;
    end 
    else begin
      currSprIndex = 3'd0;
    end

  // Sprite Row Buffer output muxing
  generate 
    genvar j;
    for (j = 0; j < 32; j++)
      assign currSprPat[j] = sprPatLatch_out[currSprIndex][(j*8)+8-1:(j*8)];
  endgenerate

  always_comb begin
    case(spriteOffset[currSprIndex])
      0: currSprRow = currSprPat[3:0];
      1: currSprRow = currSprPat[7:4];
      2: currSprRow = currSprPat[11:8];
      3: currSprRow = currSprPat[15:12];
      4: currSprRow = currSprPat[19:16];
      5: currSprRow = currSprPat[23:20];
      6: currSprRow = currSprPat[27:24];
      7: currSprRow = currSprPat[31:28];
      default: currSprRow = 32'd0;
    endcase
  end

endmodule
