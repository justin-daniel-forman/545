#create the raw file
my $fileroot = shift @ARGV;
open (my $fh_b, '<', "$fileroot.b") or die "Couldn't open file: $!";
open (my $fh_r, '>', "DUT.raw") or die "Couldn't open file: $!";

foreach my $line (<$fh_b>) {
  #chop off the address at the beginning and the data section at the end of each line
  my $new_line = substr $line, 9, 54;
  print $fh_r $new_line;
}

close $fh_b;
close $fh_r;
