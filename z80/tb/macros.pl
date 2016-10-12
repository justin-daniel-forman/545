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

    print $line;

    #case on the specific macro
    my $whitespace = $1;
    my $macro      = $2;

    if($macro eq 'INC_PC') {
      $line  = $whitespace."ld_PCH    = 1;\n";
      $line .= $whitespace."ld_PCL    = 1;\n";
      $line .= $whitespace."drive_PCH = 1;\n";
      $line .= $whitespace."drive_PCL = 1;\n";
      $line .= $whitespace."alu_op    = `INCR_A;\n";
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

      $line = $whitespace."//$state_name\n";
      for($i = 0; $i < $num_states - 1; $i+=1) {
        my $j = $i + 1;
        $line .= $whitespace."$state_name"."_$i: next_state = $state_name"."_$j;\n";
      }
      $line .= $whitespace."$state_name"."_$i: next_state = FETCH_0;\n";

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

    elsif($macro =~ /8_READ (.*)\s*/) {
      my $reg = $1;

      if($reg eq 'A') {
        $line .= $whitespace."drive_A = 1;\n";
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
      }

    }

  }

  #write the line that was either the original or the replaced macro
  print $out_fh $line;

}

close $in_fh;
close $out_fh;
