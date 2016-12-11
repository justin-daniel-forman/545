#!/usr/bin/perl

#This file uses the sarcasm z80 assembler to generate a binary
#dump of assembled z80 code, which is then to be used by our
#test bench for comparisons.

die "No filename" if ((scalar @ARGV) < 1);

my $fileroot = shift @ARGV;

system "./sarcasm.pl $fileroot.asm";
my $bin = `xxd -b $fileroot.rom`;

#write the binary file
system "touch $fileroot.b";
open (my $fh, '>', "$fileroot.b") or die "Couldn't open file: $!";
print $fh $bin;
close $fh;

#create the raw file
my $fileroot2 = shift @ARGV;
open (my $fh_b, '<', "$fileroot.b") or die "Couldn't open file: $!";
open (my $fh_r, '>', "DUT.raw") or die "Couldn't open file: $!";

foreach my $line (<$fh_b>) {
  #chop off the address at the beginning and the data section at the end of each line
  my $new_line = substr $line, 9, 54;
  print $fh_r $new_line;
}

close $fh_b;
close $fh_r;
