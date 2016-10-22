#!/usr/bin/perl

#define repeatedly used macros here

my $in_filename   = '../z80_control_macro.sv';
my $out_filename  = '../z80_control.sv';

#open a file for read and write
open (my $in_fh, '<', $in_filename) or die $!;
open (my $out_fh, '>', $out_filename) or die $!;

#iterate through each line of the file
while (my $line = <$in_fh>) {

  #check if the line is a macro
  if ($line =~ /(\s*)MACRO_(.*)\s*/) {

    #print $line;

    #case on the specific macro
    my $whitespace = $1;
    my $macro      = $2;

    if($macro eq 'INC_PC') {
      $line  = $whitespace."ld_PCH    = 1;\n";
      $line .= $whitespace."ld_PCL    = 1;\n";
      $line .= $whitespace."drive_PCH = 1;\n";
      $line .= $whitespace."drive_PCL = 1;\n";
      $line .= $whitespace."alu_op    = `INCR_A_16;\n";
      $line .= $whitespace."drive_reg_addr = 1;\n";
      $line .= $whitespace."drive_alu_addr = 1;\n";
    }

    elsif($macro eq 'DEC_PC') {
      $line  = $whitespace."ld_PCH    = 1;\n";
      $line .= $whitespace."ld_PCL    = 1;\n";
      $line .= $whitespace."drive_PCH = 1;\n";
      $line .= $whitespace."drive_PCL = 1;\n";
      $line .= $whitespace."alu_op    = `DECR_A;\n";
      $line .= $whitespace."drive_reg_addr = 1;\n";
      $line .= $whitespace."drive_alu_addr = 1;\n";
    }

    elsif($macro eq 'DRIVE_PC') {
      $line = $whitespace."drive_PCH = 1;\n";
      $line .= $whitespace."drive_PCL = 1;\n";
      $line .= $whitespace."alu_op    = `ALU_NOP;\n";
      $line .= $whitespace."drive_reg_addr = 1;\n";
      $line .= $whitespace."drive_alu_addr = 1;\n";
    }

    elsif($macro =~ /DEFINE_STATES (.*) (.*)\s*/) {
      my $state_name = $1;
      my $num_states = $2;

      $line = '';
      for($i = 0; $i < $num_states; $i+=1) {
        $line .= $whitespace."$state_name"."_$i,\n";
      }
    }

    elsif($macro =~ /ENUM_STATES (.*) (.*)\s*/) {
      my $state_name = $1;
      my $num_states = $2;
      my $bool = $3;

      $line = $whitespace."//$state_name\n";
      for($i = 0; $i < $num_states - 1; $i+=1) {
        my $j = $i + 1;
        $line .= $whitespace."$state_name"."_$i: next_state = $state_name"."_$j;\n";
      }

      $line .= $whitespace."$state_name"."_$i: next_state = FETCH_0;\n";

    }

    elsif($macro =~ /ENUM_STATES_NR (.*) (.*)\s*/) {
      my $state_name = $1;
      my $num_states = $2;
      my $bool = $3;

      $line = $whitespace."//$state_name\n";
      for($i = 0; $i < $num_states - 1; $i+=1) {
        my $j = $i + 1;
        $line .= $whitespace."$state_name"."_$i: next_state = $state_name"."_$j;\n";
      }

    }

    elsif($macro =~ /READ_0\s*/) {
      $line =  $whitespace."MRD_start = 1;\n";
      $line .= $whitespace."MRD_bus   = 1;\n";
    }

    elsif($macro =~ /READ_1\s*/) {
      $line = $whitespace."MRD_bus = 1;\n";
    }

    elsif($macro =~ /WRITE_0\s*/) {
      $line =  $whitespace."MWR_start = 1;\n";
      $line .= $whitespace."MWR_bus   = 1;\n";
    }

    elsif($macro =~ /WRITE_1\s*/) {
      $line = $whitespace."MWR_bus = 1;\n";
    }

    elsif($macro =~ /16_LOAD (.*)\s*/) {
      $line = '';
      my $reg = $1;

      if($reg eq 'BC') {
        $line .= $whitespace."ld_B = 1;\n";
        $line .= $whitespace."ld_C = 1;\n";
      }
      if($reg eq 'DE') {
        $line .= $whitespace."ld_D = 1;\n";
        $line .= $whitespace."ld_E = 1;\n";
      }
      if($reg eq 'HL') {
        $line .= $whitespace."ld_H = 1;\n";
        $line .= $whitespace."ld_L = 1;\n";
      }
      if($reg eq 'SP') {
        $line .= $whitespace."ld_SPL = 1;\n";
        $line .= $whitespace."ld_SPH = 1;\n";
      }
      if($reg eq 'IX') {
        $line .= $whitespace."ld_IXL = 1;\n";
        $line .= $whitespace."ld_IXH = 1;\n";
      }
      if($reg eq 'IY') {
        $line .= $whitespace."ld_IYL = 1;\n";
        $line .= $whitespace."ld_IYH = 1;\n";
      }
      if($reg eq 'STR') {
        $line .= $whitespace."ld_STRL = 1;\n";
        $line .= $whitespace."ld_STRH = 1;\n";
      }
      if($reg eq 'PC') {
        $line .= $whitespace."ld_PCH = 1;\n";
        $line .= $whitespace."ld_PCL = 1;\n";
      }
    }

    elsif($macro =~ /8_DRIVE (.*)\s*/) {
      my $reg = $1;

      $line = '';
      if($reg eq 'A') {
        $line .= $whitespace."drive_A = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'F') {
        $line .= $whitespace."drive_F = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'B') {
        $line .= $whitespace."drive_B = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'B') {
        $line .= $whitespace."drive_B = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'C') {
        $line .= $whitespace."drive_C = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'D') {
        $line .= $whitespace."drive_D = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'E') {
        $line .= $whitespace."drive_E = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'H') {
        $line .= $whitespace."drive_H = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'L') {
        $line .= $whitespace."drive_L = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'IXH') {
        $line .= $whitespace."drive_IXH = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'IXL') {
        $line .= $whitespace."drive_IXL = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'IYH') {
        $line .= $whitespace."drive_IYH = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'IYL') {
        $line .= $whitespace."drive_IYL = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n"
      } elsif( $reg eq 'SPH') {
        $line .= $whitespace."drive_SPH = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'SPL') {
        $line .= $whitespace."drive_SPL = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'STRH') {
        $line .= $whitespace."drive_STRH = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      } elsif( $reg eq 'STRL') {
        $line .= $whitespace."drive_STRL = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }
    }

    elsif($macro =~/16_ADD_SE_B (.*)\s*/) {
      $line = '';
      my $reg = $1;

      $line .= $whitespace."drive_alu_addr = 1;\n";
      $line .= $whitespace."alu_op         = `ADD_SE_B;\n";
      $line .= $whitespace."drive_reg_addr = 1;\n";

      if($reg eq 'BC') {
        $line .= $whitespace."drive_B        = 1;\n";
        $line .= $whitespace."drive_C        = 1;\n";
        $line .= $whitespace."ld_B           = 1;\n";
        $line .= $whitespace."ld_C           = 1;\n";
      }

      if($reg eq 'DE') {
        $line .= $whitespace."drive_D        = 1;\n";
        $line .= $whitespace."drive_E        = 1;\n";
        $line .= $whitespace."ld_D           = 1;\n";
        $line .= $whitespace."ld_E           = 1;\n";
      }

      if($reg eq 'HL') {
        $line .= $whitespace."drive_L        = 1;\n";
        $line .= $whitespace."drive_H        = 1;\n";
        $line .= $whitespace."ld_L           = 1;\n";
        $line .= $whitespace."ld_H           = 1;\n";
      }

      if($reg eq 'SP') {
        $line .= $whitespace."drive_SPL        = 1;\n";
        $line .= $whitespace."drive_SPH        = 1;\n";
        $line .= $whitespace."ld_SPL           = 1;\n";
        $line .= $whitespace."ld_SPH           = 1;\n";
      }

      if($reg eq 'PC') {
        $line .= $whitespace."drive_PCL        = 1;\n";
        $line .= $whitespace."drive_PCH        = 1;\n";
        $line .= $whitespace."ld_PCL           = 1;\n";
        $line .= $whitespace."ld_PCH           = 1;\n";
      }

      if($reg eq 'IX') {
        $line .= $whitespace."drive_IXL        = 1;\n";
        $line .= $whitespace."drive_IXH        = 1;\n";
        $line .= $whitespace."ld_IXL           = 1;\n";
        $line .= $whitespace."ld_IXH           = 1;\n";
      }

      if($reg eq 'IY') {
        $line .= $whitespace."drive_IYL        = 1;\n";
        $line .= $whitespace."drive_IYH        = 1;\n";
        $line .= $whitespace."ld_IYL           = 1;\n";
        $line .= $whitespace."ld_IYH           = 1;\n";
      }
    }

    elsif($macro =~/8_ADD (.*)\s*/) {
      $line = '';
      my $reg = $1;

      $line .= $whitespace."ld_F_data      = 1;\n";
      $line .= $whitespace."drive_alu_data = 1;\n";
      $line .= $whitespace."ld_A           = 1;\n";
      $line .= $whitespace."alu_op         = `ADD;\n";

      if($reg eq 'A') {
        $line .= $whitespace."drive_A        = 1;\n";
      }
      if($reg eq 'B') {
        $line .= $whitespace."drive_B        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }
      if($reg eq 'C') {
        $line .= $whitespace."drive_C        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'D') {
        $line .= $whitespace."drive_D        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'E') {
        $line .= $whitespace."drive_E        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'H') {
        $line .= $whitespace."drive_H        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'L') {
        $line .= $whitespace."drive_L        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }
    }

    elsif($macro =~/8_ADC (.*)\s*/) {
      $line = '';
      my $reg = $1;

      $line .= $whitespace."ld_F_data      = 1;\n";
      $line .= $whitespace."drive_alu_data = 1;\n";
      $line .= $whitespace."ld_A           = 1;\n";
      $line .= $whitespace."alu_op         = `ADC;\n";

      if($reg eq 'A') {
        $line .= $whitespace."drive_A        = 1;\n";
      }
      if($reg eq 'B') {
        $line .= $whitespace."drive_B        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }
      if($reg eq 'C') {
        $line .= $whitespace."drive_C        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'D') {
        $line .= $whitespace."drive_D        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'E') {
        $line .= $whitespace."drive_E        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'H') {
        $line .= $whitespace."drive_H        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'L') {
        $line .= $whitespace."drive_L        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }
    }

    elsif($macro =~/8_AND (.*)\s*/) {
      $line = '';
      my $reg = $1;

      $line .= $whitespace."ld_F_data      = 1;\n";
      $line .= $whitespace."drive_alu_data = 1;\n";
      $line .= $whitespace."ld_A           = 1;\n";
      $line .= $whitespace."alu_op         = `AND;\n";

      if($reg eq 'A') {
        $line .= $whitespace."drive_A        = 1;\n";
      }
      if($reg eq 'B') {
        $line .= $whitespace."drive_B        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }
      if($reg eq 'C') {
        $line .= $whitespace."drive_C        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'D') {
        $line .= $whitespace."drive_D        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'E') {
        $line .= $whitespace."drive_E        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'H') {
        $line .= $whitespace."drive_H        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }

      if($reg eq 'L') {
        $line .= $whitespace."drive_L        = 1;\n";
        $line .= $whitespace."drive_reg_data = 1;\n";
      }
    }


    elsif($macro =~/16_DRIVE (.*)\s*/) {

      $line = '';
      my $reg = $1;
      $line .= $whitespace."drive_alu_addr = 1;\n";
      $line .= $whitespace."alu_op = `ALU_NOP;\n";
      $line .= $whitespace."drive_reg_addr = 1;\n";

      if($reg eq 'BC') {
        $line .= $whitespace."drive_B = 1;\n";
        $line .= $whitespace."drive_C = 1;\n";
      }
      if($reg eq 'DE') {
        $line .= $whitespace."drive_D = 1;\n";
        $line .= $whitespace."drive_E = 1;\n";
      }
      if($reg eq 'HL') {
        $line .= $whitespace."drive_H = 1;\n";
        $line .= $whitespace."drive_L = 1;\n";
      }
      if($reg eq 'SP') {
        $line .= $whitespace."drive_SPL = 1;\n";
        $line .= $whitespace."drive_SPH = 1;\n";
      }
      if($reg eq 'IX') {
        $line .= $whitespace."drive_IXL = 1;\n";
        $line .= $whitespace."drive_IXH = 1;\n";
      }
      if($reg eq 'IY') {
        $line .= $whitespace."drive_IYL = 1;\n";
        $line .= $whitespace."drive_IYH = 1;\n";
      }
      if($reg eq 'STR') {
        $line .= $whitespace."drive_STRH = 1;\n";
        $line .= $whitespace."drive_STRL = 1;\n";
      }
      if($reg eq 'PC') {
        $line .= $whitespace."drive_PCH = 1;\n";
        $line .= $whitespace."drive_PCL = 1;\n";
      }

    }

    elsif($macro =~/8_INC (.*)\s*/) {

      $line = '';
      my $reg = $1;
      $line .= $whitespace."drive_reg_data = 1;\n";
      $line .= $whitespace."drive_alu_data = 1;\n";

      if($reg eq 'A') {
        $line .= $whitespace."drive_A = 1;\n";
        $line .= $whitespace."ld_A    = 1;\n";
        $line .= $whitespace."alu_op  = `INCR_A_8;\n";
      }
      elsif($reg eq 'B') {
        $line .= $whitespace."drive_B = 1;\n";
        $line .= $whitespace."ld_B    = 1;\n";
        $line .= $whitespace."alu_op  = `INCR_B_8;\n";
      }
      elsif($reg eq 'C') {
        $line .= $whitespace."drive_C = 1;\n";
        $line .= $whitespace."ld_C    = 1;\n";
        $line .= $whitespace."alu_op  = `INCR_B_8;\n";
      }
      elsif($reg eq 'D') {
        $line .= $whitespace."drive_D = 1;\n";
        $line .= $whitespace."ld_D    = 1;\n";
        $line .= $whitespace."alu_op  = `INCR_B_8;\n";
      }
      elsif($reg eq 'E') {
        $line .= $whitespace."drive_E = 1;\n";
        $line .= $whitespace."ld_E    = 1;\n";
        $line .= $whitespace."alu_op  = `INCR_B_8;\n";
      }
      elsif($reg eq 'H') {
        $line .= $whitespace."drive_H = 1;\n";
        $line .= $whitespace."ld_H    = 1;\n";
        $line .= $whitespace."alu_op  = `INCR_B_8;\n";
      }
      elsif($reg eq 'L') {
        $line .= $whitespace."drive_L = 1;\n";
        $line .= $whitespace."ld_L    = 1;\n";
        $line .= $whitespace."alu_op  = `INCR_B_8;\n";
      }
      elsif($reg eq 'STRH') {
        $line .= $whitespace."drive_STRH = 1;\n";
        $line .= $whitespace."ld_STRH    = 1;\n";
        $line .= $whitespace."alu_op     = `INCR_B_8;\n";
      }
      elsif($reg eq 'STRL') {
        $line .= $whitespace."drive_STRL = 1;\n";
        $line .= $whitespace."ld_STRL    = 1;\n";
        $line .= $whitespace."alu_op     = `INCR_B_8;\n";
      }
    }


    elsif($macro =~/16_INC (.*)\s*/) {

      $line = '';
      my $reg = $1;
      $line .= $whitespace."drive_alu_addr = 1;\n";
      $line .= $whitespace."alu_op         = `INCR_A_16;\n";
      $line .= $whitespace."drive_reg_addr = 1;\n";

      if($reg eq 'BC') {
        $line .= $whitespace."drive_B = 1;\n";
        $line .= $whitespace."drive_C = 1;\n";
        $line .= $whitespace."ld_B    = 1;\n";
        $line .= $whitespace."ld_C    = 1;\n";
      }
      if($reg eq 'DE') {
        $line .= $whitespace."drive_D = 1;\n";
        $line .= $whitespace."drive_E = 1;\n";
        $line .= $whitespace."ld_D    = 1;\n";
        $line .= $whitespace."ld_E    = 1;\n";
      }
      if($reg eq 'HL') {
        $line .= $whitespace."drive_H = 1;\n";
        $line .= $whitespace."drive_L = 1;\n";
        $line .= $whitespace."ld_H    = 1;\n";
        $line .= $whitespace."ld_L    = 1;\n";
      }
      if($reg eq 'SP') {
        $line .= $whitespace."drive_SPL = 1;\n";
        $line .= $whitespace."drive_SPH = 1;\n";
        $line .= $whitespace."ld_SPH    = 1;\n";
        $line .= $whitespace."ld_SPL    = 1;\n";
      }
      if($reg eq 'IX') {
        $line .= $whitespace."drive_IXL = 1;\n";
        $line .= $whitespace."drive_IXH = 1;\n";
        $line .= $whitespace."ld_IXL    = 1;\n";
        $line .= $whitespace."ld_IXH    = 1;\n";
      }
      if($reg eq 'IY') {
        $line .= $whitespace."drive_IYL = 1;\n";
        $line .= $whitespace."drive_IYH = 1;\n";
        $line .= $whitespace."ld_IYL    = 1;\n";
        $line .= $whitespace."ld_IYH    = 1;\n";
      }
      if($reg eq 'STR') {
        $line .= $whitespace."drive_STRH = 1;\n";
        $line .= $whitespace."drive_STRL = 1;\n";
        $line .= $whitespace."ld_STRH    = 1;\n";
        $line .= $whitespace."ld_STRL    = 1;\n";
      }
      if($reg eq 'PC') {
        $line .= $whitespace."drive_PCH = 1;\n";
        $line .= $whitespace."drive_PCL = 1;\n";
        $line .= $whitespace."ld_PCH    = 1;\n";
        $line .= $whitespace."ld_PCL    = 1;\n";
      }

    }

    elsif($macro =~ /^SET (.*)\s*/) {
      $line = '';
      my $flag = $1;

      if($flag eq 'S') {
        $line .= $whitespace."set_S = 2'b11;\n";
      }
      elsif($flag eq 'Z') {
        $line .= $whitespace."set_Z = 2'b11;\n";
      }
      elsif($flag eq 'H') {
        $line .= $whitespace."set_H = 2'b11;\n";
      }
      elsif($flag eq 'PV') {
        $line .= $whitespace."set_PV = 2'b11;\n";
      }
      elsif($flag eq 'N') {
        $line .= $whitespace."set_N = 2'b11;\n";
      }
      elsif($flag eq 'C') {
        $line .= $whitespace."set_C = 2'b11;\n";
      }
    }

    elsif($macro =~ /RESET (.*)\s*/) {
      $line = '';
      my $flag = $1;

      if($flag eq 'S') {
        $line .= $whitespace."set_S = 2'b10;\n";
      }
      elsif($flag eq 'Z') {
        $line .= $whitespace."set_Z = 2'b10;\n";
      }
      elsif($flag eq 'H') {
        $line .= $whitespace."set_H = 2'b10;\n";
      }
      elsif($flag eq 'PV') {
        $line .= $whitespace."set_PV = 2'b10;\n";
      }
      elsif($flag eq 'N') {
        $line .= $whitespace."set_N = 2'b10;\n";
      }
      elsif($flag eq 'C') {
        $line .= $whitespace."set_C = 2'b10;\n";
      }
    }

  }

  #write the line that was either the original or the replaced macro
  print $out_fh $line;

}

close $in_fh;
close $out_fh;
