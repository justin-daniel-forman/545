#!/usr/bin/perl
#
#testbench.pl
#
#We want to be able to run all of the assembly files in /traces and compare
#the outputs to what we expect them to be.

use strict;
use warnings;

#Interpret cmd line args
my $debug_arg;
my $file_arg;
my $verify_arg;

if(scalar @ARGV >= 3) {
  $debug_arg  = shift @ARGV;
  $file_arg   = shift @ARGV;
  $verify_arg = shift @ARGV;
}
elsif(scalar @ARGV >= 2) {
  $debug_arg  = shift @ARGV;
  $file_arg   = shift @ARGV;
  $verify_arg = undef;
}
elsif(scalar @ARGV >= 1) {
  $debug_arg  = shift @ARGV;
  $file_arg   = undef;
  $verify_arg = undef;
}


#Get all of the names of the .asm files in traces
my $asm_dir  = './traces';
my $root_dir = './..';
my @asm_files;
opendir (DIR, $asm_dir) or die $!;

while(my $file = readdir(DIR)){

  #add the name to the list if we have an asm file
  if($file =~ /\.asm/) {
    #get the rootfile name by removing the .asm exension
    my $asm_file = substr($file, 0, -4);
    push (@asm_files, $asm_file);
  }
}

foreach my $fileroot (@asm_files) {

  if(defined $file_arg and $file_arg ne "NULL") {
    next unless $file_arg eq $fileroot;
  }

  #change the working directory and assemble the file
  #this will give us the raw output we need to run simv
  chdir DIR;
  system "perl assembler.pl $fileroot";

  #now change our working directory back to where it was
  opendir (BACK, $root_dir) or die $!;
  chdir BACK;

  #if we are verifying, do not print verbose output
  if(defined $verify_arg and $verify_arg eq "VERIFY") {
    my $dump = `./simv`;

    my ($A, $BC, $DE, $HL, $IX, $IY, $SP, $PC);
    $dump =~ /A: (.*)\nBC: (.*)\nDE: (.*)\nHL: (.*)\nIX: (.*)\nIY: (.*)\nSP: (.*)\nPC: (.*)/;
    $A  = $1;
    $BC = $2;
    $DE = $3;
    $HL = $4;
    $IX = $5;
    $IY = $6;
    $SP = $7;
    $PC = $8;

    open (my $fh_d, '<', "traces/$fileroot.dmp") or die $!;
    $dump = '';
    while(my $line = <$fh_d>) {$dump .= $line;}

    my ($A_d, $BC_d, $DE_d, $HL_d, $IX_d, $IY_d, $SP_d, $PC_d);
    $dump =~ /A: (.*)\nBC: (.*)\nDE: (.*)\nHL: (.*)\nIX: (.*)\nIY: (.*)\nSP: (.*)\nPC: (.*)/;
    $A_d  = $1;
    $BC_d = $2;
    $DE_d = $3;
    $HL_d = $4;
    $IX_d = $5;
    $IY_d = $6;
    $SP_d = $7;
    $PC_d = $8;
    close ($fh_d);

    if(($A ne $A_d)
        or ($BC ne $BC_d)
        or ($DE ne $DE_d)
        or ($HL ne $HL_d)
        or ($IX ne $IX_d)
        or ($IY ne $IY_d)
        or ($SP ne $SP_d)
        or ($PC ne $PC_d)
    ) {
      print "There was an error in test: $fileroot\n";
      print "Got:\nA: $A\nBC: $BC\nDE: $DE\nHL: $HL\nIX: $IX\nIY: $IY\nSP: $SP\nPC: $PC\n";
      print "Expected:\nA: $A_d\nBC: $BC_d\nDE: $DE_d\nHL: $HL_d\nIX: $IX_d\nIY: $IY_d\nSP: $SP_d\nPC: $PC_d\n";
    }

    else {
      print "Passed: $fileroot\n";
    }
  }

  elsif(defined $debug_arg and $debug_arg eq "DEBUG") {
    system "./simv +$debug_arg";
  }
}
