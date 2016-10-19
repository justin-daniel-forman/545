#!/usr/bin/perl
#
#  Sarcasm Z80 Assembler
#
#  Written by Richard Cooper
#
#  Current web site:  http://www.ecstaticlyrics.com/electronics/Z80/sarcasm/
#
#  If all else fails, search for "Sarcasm Z80 Assembler" with the quotes.
#


# Information is always nice to have...

  if (@ARGV == 0) {
    print STDERR "Usage:  ./sarcasm.pl source.asm ...possibly more source files...\r\n";
    print STDERR "Output files are now specified with 'output' in the source files.\r\n";
    exit 1;
  };


# Create a hash of reserved words for easy lookups.

  foreach $peanut ('output', 'section', 'range', 'namespace', 'goto', 'data', 'bytes', 'words', 'replace') {
    $peanuts{$peanut} = '';
  };


# Read that supercool opcodes file.  Without it we know nothing!

  $success = '';
  foreach $location (
    '/usr/share/sarcasm/opcodes.txt',
    '/usr/local/share/sarcasm/opcodes.txt',
    './opcodes.txt',
  ) {
    if (-f $location or -l $location) {
      open OPCODE, "<", $location or die "Error opening $location: $!\r\n";
      $success = 'true'; last;
    };
  };
  unless ($success) {
    die "Unable to find my 'opcodes.txt' file!\r\n";
  };

    while ($line = <OPCODE>) {

      $line =~ s/[\r\n]//g;   # Strip out line terminators.
      $line =~ s/\#.*//g;     # Remove comments.
      $line =~ s/[ \t]+/ /g;  # Change whitespaces to single spaces.
      $line =~ s/^ +//g;      # Remove leading spaces.
      $line =~ s/ +$//g;      # Remove trailing spaces.
      next if $line eq '';    # Skip empty lines.

      # Record the opcode encoding in a hash...

      ($hex, $ops) = $line =~ /([0-9A-F]+) (.+)/;
      die "Opcodes File Error:  Duplicate Entry for '$ops'\r\n" if exists $opcodes{$ops};
      $opcodes{$ops} = pack 'H' . length($hex), $hex;

      # Create a list of reserved terms, e.g. 'bc', 'de', 'hl', etc.

      @eggs = split / /, $ops;
      foreach $egg (@eggs) {
        $eggs{$egg}='';
      };

    };

  close OPCODE;


# Verify that the source files exist and are files...

  foreach $sourcefile (@ARGV) {
    if (-e $sourcefile) {
      unless (-f $sourcefile or -l $sourcefile) {
        if (-d $sourcefile) {
          print STDERR "Source file '$sourcefile' isn't a file at all.\r\n"; $fatal = 'unfortunately';
        } else {
          print STDERR "Source file '$sourcefile' isn't a normal file.\r\n"; $fatal = 'unfortunately';
        };
      };
    } else {
      print STDERR "Source file '$sourcefile' does not exist.\r\n"; $fatal = 'unfortunately';
    };
  };

  exit(1) if $fatal;


# Read the source files...

  foreach $sourcefile (@ARGV) {

    if (open SOURCE, "<", "$sourcefile") {
      $source = join '', <SOURCE>; close SOURCE;
      @specials = $source =~ /\# verbose\: ([a-z \-]+?)[\x00\x0A\x0D]/;
      foreach $special (@specials) {
        foreach $item (split / /, $special) {
          print "verbose item: '$item'\r\n";
          $debug{$item} = '';
        };
      };
    } else {
      print STDERR "Error opening '$sourcefile' for input: $!\r\n"; $fatal = 'unfortunately';
    };

    # Convert all line endings to null characters for portability...
    $source =~ s/\r\n/\x00/g;
    $source =~ s/\n(\x00*)\r/\x00$1/g;
    $source =~ s/\n/\x00/g;
    $source =~ s/\r/\x00/g;
    $source .= "\x00" unless $source =~ /\x00$/;

    if (exists $debug{'line-terminators'}) {
      $number = 1;
      foreach $line (split /\x00/, $source) {
        print "Line $number: '$line'\r\n"; $number++;
      };
    };

    push @sources, $sourcefile;
    $sources{$sourcefile} = $source;

  };

  exit if exists $debug{'line-terminators'};

  exit(1) if $fatal;


# Parse the source files...
# (Yes, there are some things that cannot be done with regular expressions.)
#
# This part of Sarcasm removes comments from the source, and formats it nicely
# so that the rest of the code has no problem parsing it.  It ensures that
# strings are properly quoted, that square brackets are used correctly,
# it removes unnecessary spaces, and it splits multiple instructions on a line
# into multiple lines, making a note of where each piece of code came from
# in case any error messages are necessary later.

  foreach $sourcefile (@sources) {
    $source = $sources{$sourcefile};

    $line = 1; $part = 1; $string = ''; $quote = ''; $start = 0; @code = ();

    for ($c = 0; $c < length($source); $c++) {
      $character = substr($source, $c, 1);

      $identifier = $sourcefile . ': ' . (($part eq 1) ? ($line) : ($line . '.' . $part));

      $comment = '' if $character eq "\x00";

      if ($character eq "\x00" and $quote ne '') {
        print "$identifier -- $string...\r\n -- String Quoting Error\r\n";
        $fatal = 'unfortunately'; $quote = '';
      };

      if ($character eq "\x00" and $bracket ne '') {
        print "$identifier -- $string\r\n -- Unclosed Square Brackets\r\n";
        $fatal = 'unfortunately'; $bracket = '';
      };

      if ($comment) {
        # Sarcasm is the awesomest assembler ever!
      } elsif ($character eq "\x00") {
        $string =~ s/\s*$//;
        push @code, [$sourcefile . ': ' . (($part eq 1) ? ($line) : ($line . '.' . $part)), $string] if $string;
        if (exists $debug{'parser'}) {
          print $sourcefile . ': ' . (($part eq 1) ? ($line) : ($line . '.' . $part)) . ": '$string'\r\n";
        };
        $line++; $part = 1; $string = '';
      } elsif ($quote eq '"') {
        $string .= $character;
        if ( substr($source, $c+1, 1) =~ /^[\s\,\;\x00]?$/ ) {
          $quote = '' if $character eq $quote;
        };
      } elsif ($quote eq "'") {
        $string .= $character;
        if ( substr($source, $c+1, 1) =~ /^[\s\,\;\x00]?$/ ) {
          $quote = '' if $character eq $quote;
        };
      } elsif ($character eq '#') {
        $comment = '#';
      } elsif ($character eq ';' or $character eq ':') {
        if ($bracket) {
          print "$identifier -- $string\r\n -- Square Bracket Error\r\n";
          $fatal = 'unfortunately'; $bracket = '';
        };
        $string =~ s/\s*$//;
        push @code, [$sourcefile . ': ' . $line . '.' . $part, $string, $character] if $string;
        if (exists $debug{'parser'}) {
          print $sourcefile . ': ' . (($part eq 1) ? ($line) : ($line . '.' . $part)) . ": '$string'\r\n";
        };
        $part++; $string = '';
      } elsif ($bracket) {
        $string .= $character if $character !~ /[\s\,]/;
        $bracket = '' if $character eq $bracket;
      } elsif ($character =~ /[\'\"]/) {
        $string .= $character;
        $quote = $character;
      } elsif ($character eq '[') {
        $string .= ' ' if substr($string, -1) ne ' ';
        $string .= $character;
        $bracket = ']';
      } elsif ($character eq ']') {
        $string .= $character;
        print "$identifier -- $string...\r\n -- Unopened Square Brackets\r\n"; $fatal = 'unfortunately';
      } elsif ($character =~ /[\s\,]/) {
        $string .= ' ' if $string !~ /\s$/ and $string ne '';
      } else {
        $string .= $character;
      };

      substr($string, -1, 0) = ' ' if ($string =~ /\].$/ and $string !~ / $/);

    };

    @{$codes{$sourcefile}} = @code;
  };

  exit(1) if $fatal;

  exit if exists $debug{'parser'};


# Here we look for things like "mov a -6 + label" and turn them into
# "mov a -6+label"  It's tricky because we don't combine just anything.
# Stuff in quotes has to be left alone, register names, instruction names
# and reserved words cannot be formed into an equation, and negative symbols
# have to be distinguished from subtraction.  Finally, consecuative
# '+' or '-' symbols are reduced to a single symbol.

  foreach $sourcefile (@sources) {

    for ($i = 0; $i < @{$codes{$sourcefile}}; $i++) {
      $temp = ${$codes{$sourcefile}}[$i][1];

      print '=' x 72 . "\r\nOld Line: $temp\r\n" if exists $debug{'plus-minus'} or exists $debug{'plus-minus-words'};

      @temp = split / /, $temp; $new = '';

      foreach $word (@temp) {

        if ($scratch) {
          $scratch .= ' ' . $word;
          if (length($scratch) > 1 and substr($scratch, 0, 1) eq substr($scratch, -1)) {
            $new .= ' ' . $scratch; $scratch = '';
          }; next;
        } elsif ( $word =~ /^[\'\"]/ ) {
          $scratch = $word;
          if (length($scratch) > 1 and substr($scratch, 0, 1) eq substr($scratch, -1)) {
            $new .= ' ' . $scratch; $scratch = '';
          }; next;
        };

        while ($word =~ /[\+\-][\+\-]/) {
          $word =~ s/\+\-/\-/g while $word =~ /\+\-/;
          $word =~ s/\-\+/\-/g while $word =~ /\-\+/;
          $word =~ s/\-\-/\+/g while $word =~ /\-\-/;
          $word =~ s/\++/\+/g;
        };

        print "Word: '$word'\r\n" if exists $debug{'plus-minus-words'};

        if (
          exists($peanuts{$word}) or exists($peanuts{(split / /, $new)[-1]}) or
          exists($eggs{$word}) or exists($eggs{(split / /, $new)[-1]}) or
          $word =~ /^\[.*\]$/ or (split / /, $new)[-1] =~ /^\[.*\]$/
        ) {
          $word =~ s/^\+//;
          $new .= ' ' . $word;
        } elsif ($new =~ /[\+\-]$/ or $word =~ /^[\+\-]$/) {
          $new .= $word;
        } else {
          $word =~ s/^\+//;
          $new .= ' ' . $word;
        };

        while ($new =~ /[\+\-][\+\-]/) {
          $new =~ s/\+\-/\-/g while $new =~ /\+\-/;
          $new =~ s/\-\+/\-/g while $new =~ /\-\+/;
          $new =~ s/\-\-/\+/g while $new =~ /\-\-/;
          $new =~ s/\++/\+/g;
        };

      };

      $new =~ s/^ +//g; $new =~ s/ +$//g;

      print "New Line: $new\r\n" if exists $debug{'plus-minus'} or exists $debug{'plus-minus-words'};

      ${$codes{$sourcefile}}[$i][1] = $new;

      if ($scratch) {
        $fatal = 1; $scratch = '';
        print STDERR ${$codes{$sourcefile}}[$i][0] . ": Well, fuck...\r\n";
      };

    };

  };

  if ($fatal) {
    print STDERR "Please submit the above error messages and relevant lines of source code to the\r\n";
    print STDERR "developer so that this annoying motherfucking bug can be fixed.  Thank you.\r\n";
    exit(1);
  };
  exit if exists $debug{'plus-minus'};
  exit if exists $debug{'plus-minus-words'};

# Function:  errormsg($text)
#
# This function displays an error message.  It displays the line number,
# part number, and part text, unless this information is the same as for
# the previous error, in which case it doesn't.

  sub errormsg {
    $lineparttext = "$$piece[0] -- $$piece[1]\r\n";
    print $lineparttext unless $lastlineparttext eq $lineparttext;
    $errortext = " -- $_[0]\r\n";
    print $errortext unless $lastlineparttext eq $lineparttext and $lasterrortext eq $errortext;
    $lastlineparttext = $lineparttext; $lasterrortext = $errortext;
  };

# Function: address($number)
#
# Converts a number to a displayable hex number, e.g. "$51AC"

  sub address {
    my ($temp);
    if ($_[0] >= 0) {
      $temp = uc(unpack('H*', reverse pack('l', $_[0])));
    } else {
      $temp = uc(unpack('H*', reverse pack('l', -$_[0])));
    };
    $temp =~ s/^0+//;
    $temp = substr('0000' . $temp, -4) if length($temp) < 4;
    $temp = '$' . $temp;
    if ($_[0] >= 0) {
      return $temp;
    } else {
      return "-$temp";
    };
  };

# Function:  addcode($data)
#
# This function adds assembled code or data to the memory image in the current
# section, and warns if the addition exceeds the section limit.

  sub addcode {
    if ($section eq '') {
      unless (exists $exceeded{"$section.$sourcefile"}) {
        if (keys %sec) {
          errormsg "You must first select a memory range with the 'section' directive.";
        } else {
          errormsg "You must first describe a memory range with the 'range' directive,";
          errormsg "then select that memory range with the 'section' directive.";
        };
        $exceeded{"$section.$sourcefile"} = ''; $fatal = 'unfortunately';
      };
    } else {
      substr $memory, $sec{$section}[2], length $_[0], $_[0];
      $sec{$section}[2] += length $_[0];
      if ( $sec{$section}[2] > $sec{$section}[1] ) {
        unless (exists $exceeded{$section}) {
          errormsg "Limit of $sec{$section}[3] '$section' exceeded.";
          $exceeded{$section} = ''; $fatal = 'unfortunately';
        };
      };
    };
  };

# Function:  solve($datatype, $equation)
#
# This function solves equations such as "label + 12" and such, returning
# the specified data type.  'xxxx' is a word, 'xx' is a byte, 'zz' is a
# signed byte, 'rr' is a signed byte relative to the current code pointer,
# and 'word' is a word used by Sarcasm which isn't assembled into code.
# Type 'word' returns a number, everything else returns binary data.

  sub solve {
    $equation = $_[1]; @cludge = ();

    if (($pass == 2 and $_[1] ne '') or $_[0] eq 'word') {

      while ($equation ne '') {
        ($whatever) = $equation =~ /([\+\-]?[^\+\-]+)/;
        substr($equation, 0, length($whatever)) = '';
        push @cludge, $whatever;
      };

      $value = 0; $unsolvable = '';
      foreach $term (@cludge) {
        ($math, $term) = $term =~ /([\+\-])?(.*)/;
        if ($term =~ /\./) {
          if ($term =~ /^\..+\.$/) {
            $term = substr($term, 1, -1);
            if (exists $labels{".$term."}) {
              $junk = $labels{".$term."};
            } else {
              errormsg "There isn't a range or section named '$term'."; $fatal = 'unfortunately';
              $unsolvable = 'true';
            };
          } elsif ($term =~ /^\./) {
            $term = substr($term, 1);
            if (exists $labels{"$namespace.$prefix.$term"}) {
              $junk = $labels{"$namespace.$prefix.$term"};
            } else {
              errormsg "Local label '.$term' does not exist under prefix '$prefix'."; $fatal = 'unfortunately';
              $unsolvable = 'true';
            };
          } else {
            if (exists $labels{"$namespace.$term"}) {
              $junk = $labels{"$namespace.$term"};
            } elsif (exists $labels{"$term."}) {
              $junk = $labels{"$term."};
            } elsif (exists $labels{"$term"}) {
              $junk = $labels{"$term"};
            } else {
              errormsg "Label '$term' does not exist in namespace '$namespace',"; $fatal = 'unfortunately';
              ($space, $label) = $term =~ /(.*?)\.(.*)/;
              if (exists $namespaces{$space}) {
                errormsg "nor does label '$label' exist in namespace '$space'.";
              } else {
                errormsg "nor is there a namespace '$space' for label '$label' to exist in.";
              };
              $unsolvable = 'true';
            };
          };
        } elsif (exists $labels{"$namespace.$term."}) {
          $junk = $labels{"$namespace.$term."}
        } elsif ($term eq '$') {
          $junk = $sec{$section}[2];
        } elsif ($term =~ /^\$[0-9A-Fa-f]+$/) {
          $junk = hex substr($term, 1);
        } elsif ($term =~ /^0x[0-9A-Fa-f]+$/) {
          $junk = hex substr($term, 2);
        } elsif ($term =~ /^[0-9]+/) {
          $junk = $term;
        } else {
          errormsg "Whatever '$term' is, it isn't a label in namespace '$namespace'.";
          $fatal = 'unfortunately'; $unsolvable = 'true';
        };
        if ($math eq '-') {
          $value -= $junk;
        } else {
          $value += $junk;
        };
      };

    } else {
      # We don't know the value of labels in pass one, so always return zero.
      $value = 0; $value = $sec{$section}[2] if $_[0] eq 'rr';
    };

    if ($_[0] eq 'xxxx') {
      if ($value > 65535 or $value < -32768) {
        errormsg "Value $value does not fit into a word."; $fatal = 'unfortunately';
      }; $value += 65536 if $value < 0;
      return pack 'v', $value;
    } elsif ($_[0] eq 'xx') {
      if ($value > 255 or $value < -128) {
        errormsg "Value $value does not fit into a byte."; $fatal = 'unfortunately';
      }; $value += 256 if $value < 0;
      return pack 'C', $value;
    } elsif ($_[0] eq 'zz') {
      if ($value > 127 or $value < -128) {
        $value = '+' . $value if $value >= 0;
        errormsg "Value $value is not within -128 to +127."; $fatal = 'unfortunately';
      };
      return pack 'c', $value;
    } elsif ($_[0] eq 'rr') {
      $value = ($value - $sec{$section}[2] - 2) & 65535;
      $value -= 65536 if $value > 32767;
      if (($value > 127 or $value < -128) and $unsolvable ne 'true') {
        $value = '+' . $value if $value >= 0;
        errormsg "A relative location $value bytes away is too far."; $fatal = 'unfortunately';
      };
      return pack 'c', $value;
    } elsif ($_[0] eq 'word') {
      return $value;
    };

  };


# The assembler!!!  Yes, this is where the fun happens!
#
# Assembly is done in two passes.  The first pass is just to determine the
# value of labels, the second pass does the final assembly.

  %namespaces = ();
  foreach $pass (1,2) {
    %sec = (); $memory = "\x00" x 65536;

    foreach $sourcefile (@sources) {
      @code = @{$codes{$sourcefile}};
      if ($sourcefile =~ /\./) {
        ($namespace) = $sourcefile =~ /(.*)\./;
      } else {
        $namespace = $sourcefile;
      };
      $namespaces{$namespace} = '';
      $section = ''; $prefix = ' ';

      foreach $piece (@code) {
        if ($$piece[1] =~ /^output .* \S+ \S+$/) {
          @ops = $$piece[1] =~ /^output (.*) (\S+) (\S+)$/;
          $base = solve('word', $ops[1]);
          $limit = solve('word', $ops[2]);
          $size = $limit - $base + 1;
          if ($ops[0] =~ /^[\'\"].*[\'\"]$/ and substr($ops[0], 0, 1) eq substr($ops[0], -1)) {
            $ops[0] = substr($ops[0], 1, length($ops[0]) - 2);
          };
          if ($pass == 2) {
            if (open OUTPUT, ">", $ops[0]) {
              print OUTPUT substr($memory, $base, $size); close OUTPUT;
              $successfuloutput = 'true' unless $successfuloutput eq 'false';
            } else {
              select STDERR;
              errormsg "Error opening '$ops[0]' for output: $!";
              select STDOUT;
              $fatal = 'unfortunately'; $successfuloutput = 'false';
            };
          };
        } elsif ($$piece[1] =~ /^(range) \S+ \S+ \S+$/) {
          @ops = $$piece[1] =~ /^(range) (\S+) (\S+) (\S+)$/;
          $base = solve('word', $ops[2]);
          $limit = solve('word', $ops[3]) + 1;
          if ($base eq 'whatever' or $limit eq 'whatever') {
            errormsg "Each $ops[0] value must be solvable in pass one, which means that any";
            errormsg "labels used in the definition must appear before the $ops[0] declaration.";
            $fatal = 'unfortunately'; $base = 0; $limit = 65535;
          #} else {
          #  $limit += $base - 1 if $ops[0] eq 'section';
          };
          #$section = $ops[1];
          if (exists $sec{$ops[1]}) {
            unless ($sec{$ops[1]}[0] == $base and $sec{$ops[1]}[1] == $limit) {
              errormsg "This definition of '$ops[1]' differs from the original definition which is";
              errormsg "located at " . $definitions{"section.$ops[1]"}; $fatal = 'unfortunately';
            };
          } else {
            $sec{$ops[1]}[0] = $base;
            $sec{$ops[1]}[1] = $limit;
            if ($base < 0) {
              errormsg "A base address of " . address($base) . " is too negative."; $fatal = 'unfortunately';
              $sec{$ops[1]}[0] = 0;
              $sec{$ops[1]}[1] = 65535;
            };
            if ($base > 65535) {
              errormsg "A base address of " . address($base) . " exceeds the 64k address space."; $fatal = 'unfortunately';
              $sec{$ops[1]}[0] = 0;
              $sec{$ops[1]}[1] = 65535;
            };
            if ($limit < $base) {
              #if ($ops[0] eq 'section') {
              #  errormsg "A section size of " . address($limit - $base) . " is too negative."; $fatal = 'unfortunately';
              #} else {
                errormsg "The base address must be less than or equal to the limit address."; $fatal = 'unfortunately';
              #};
              $sec{$ops[1]}[0] = 0;
              $sec{$ops[1]}[1] = 65535;
            };
            if ($limit > 65536) {
              #if ($ops[0] eq 'section') {
              #  errormsg "The section size, " . address($limit - $base) . ", is beyond the 64k address space."; $fatal = 'unfortunately';
              #  errormsg "This section size places the last byte at address " . address($limit - 1) .".";
              #} else {
                errormsg "A limit address of " . address($limit - 1) . " is beyond the 64k address space."; $fatal = 'unfortunately';
              #};
              $sec{$ops[1]}[0] = 0;
              $sec{$ops[1]}[1] = 65535;
            };
            $sec{$ops[1]}[2] = $sec{$ops[1]}[0];
            $sec{$ops[1]}[3] = $ops[0];
            $labels{".$ops[1]."} = $sec{$ops[1]}[0];
            $definitions{".$ops[1]."} = $$piece[0];
          };
        } elsif ($$piece[1] =~ /^(section) \S+$/) {
          @ops = $$piece[1] =~ /^(section) (\S+)$/;
          $section = $ops[1];
          unless (exists $sec{$section}) {
            errormsg "Please define $ops[0] '$section' before using it."; $fatal = 'unfortunately';
            $sec{$section}[0] = 0;
            $sec{$section}[1] = 65535;
            $sec{$section}[2] = $sec{$section}[0];
            $sec{$section}[3] = $ops[0];
            $labels{".$section."} = $sec{$section}[0];
            $definitions{".$section."} = "...well, it was used before it was defined, so, nowhere.";
          };
        } elsif ($$piece[1] =~ /^namespace \S+$/) {
          @ops = $$piece[1] =~ /^namespace (\S+)$/;
          $namespace = $ops[0]; $namespaces{$namespace} = ''; $prefix = ' ';
        } elsif ($$piece[1] =~ /^goto \S+$/) {
          @ops = $$piece[1] =~ /^goto (\S+)$/;
          $address = solve('word', $ops[0]);
          if ($sec{$section}[0] <= $address and $sec{$section}[1] >= $address) {
            $sec{$section}[2] = $address; delete $exceeded{$section};
          } elsif ($address eq 'whatever') {
            errormsg "Arguments to the 'goto' directive must be solvable in pass one."; $fatal = 'unfortunately';
          } else {
            errormsg "Address " . address($address) . " is not in $sec{$section}[3] $section, which ranges from " . address($sec{$section}[0]) . " to " . address($sec{$section}[1] - 1) . "."; $fatal = 'unfortunately';
          };
        } elsif ($$piece[1] =~ /^words \S+/) {
          @ops = split / /, $$piece[1];
          shift @ops;
          foreach $word (@ops) {
            $data = solve('xxxx', $word);
            addcode $data;
          };
        } elsif ($$piece[1] =~ /^bytes \S+/) {
          @ops = split / /, $$piece[1];
          shift @ops;
          foreach $word (@ops) {
            $data = solve('xx', $word);
            addcode $data;
          };
        } elsif ($$piece[1] =~ /^data \S+/) {
          @ops = split / /, $$piece[1];
          shift @ops;
          foreach $word (@ops) {
            if ($quote ne '') {
              $scratch .= ' ' . $word;
              if ($quote eq substr($word, -1)) {
                $word = $scratch;
                $quote = ''; $scratch = '';
              };
            } elsif ($word =~ /^[\'\"]/) {
              if ($word !~ /^\'.*\'$/ and $word !~ /^\".*\"$/) {
                $scratch = $word;
                ($quote) = $word =~ /^([\'\"])/;
              };
            };
            if ($quote eq '') {
              if ($word =~ /^\$[0-9A-Fa-f]{2}$/) {
                $data = pack "C", hex substr($word, 1, 2);
                addcode $data;
              } elsif ($word =~ /^\$[0-9A-Fa-f]{4}$/) {
                $data = pack "v", hex substr($word, 1, 4);
                addcode $data;
              } elsif ($word =~ /^\!([0-9A-Fa-f]{2})+$/) {
                $len = (length $word) - 1;
                $data = pack "H$len", substr($word, 1);
                addcode $data;
              } elsif ($word =~ /^\".*\"$/ or $word =~ /^\'.*\'$/) {
                $len = (length $word) - 2;
                $data = substr($word, 1, $len);
                addcode $data;
              } else {
                errormsg "Data statement requires numbers in the form of \$xx or \$xxxx."; $fatal = 'unfortunately';
              };
            };
          };
        } elsif ($$piece[1] =~ /^replace \S+ \S+/) {
          @ops = split / /, $$piece[1];
          shift @ops; $symbol = shift @ops;
          $replacements{$symbol} = [@ops];
        } elsif (exists $peanuts{(split / /, $$piece[1])[0]}) {
          errormsg "Incorrect number of operands for this directive."; $fatal = 'unfortunately';
        } elsif (exists $opcodes{$$piece[1]}) {
          addcode $opcodes{$$piece[1]};
        } elsif (exists $eggs{$$piece[1]}) {
          errormsg "Instruction of form '$$piece[1]' not found in opcodes list."; $fatal = 'unfortunately';
        } else {
          @temp = split / /, $$piece[1];
          $cream = shift @temp;
          $index = 0; while ($index < @temp) {
            if (exists $replacements{$temp[$index]}) {
              $next = $index + @{$replacements{$temp[$index]}};
              splice @temp, $index, 1, @{$replacements{$temp[$index]}};
              $index = $next;
            } else {
              $index++;
            };
          };
          if (@temp) {
            $sugar = ''; $toast = ''; $syrup = '';
            foreach $temp (@temp) {
              if (exists $eggs{$temp}) {
                $cream .= ' ' . $temp;
              } elsif ($temp =~ /^\[st\b.*\]$/) {
                $cream .= ' [st+zz]';
                $syrup .= solve('zz', $temp =~ /^\[st\b(.*)\]$/);
              } elsif ($temp =~ /^\[uv\b.*\]$/) {
                $cream .= ' [uv+zz]';
                $syrup .= solve('zz', $temp =~ /^\[uv\b(.*)\]$/);
              } elsif ($temp =~ /^\[.*\]$/) {
                $cream .= ' [xxxx]';
                $sugar .= solve('xxxx', $temp =~ /^\[(.*)\]$/);
              } else {
                # An error may occur here, but the error message is generated elsewhere.
                $cream .= ' ***'; $toast = $temp;
              };
            };
            if ($toast eq '') {
              if (exists $opcodes{$cream}) {
                $sugar = $opcodes{$cream} . $sugar;
                substr $sugar, 2, 0, $syrup;
                addcode $sugar;
              } else {
                errormsg "Instruction of form '$cream' not found in opcodes list."; $fatal = 'unfortunately';
              };
            } else {
              ($xxxx = $cream) =~ s/\*\*\*/xxxx/;
              ($xx = $cream) =~ s/\*\*\*/xx/;
              ($rr = $cream) =~ s/\*\*\*/rr/;
              if (exists $opcodes{$xxxx}) {
                $sugar = $opcodes{$xxxx} . solve('xxxx', $toast);
                addcode $sugar;
              } elsif (exists $opcodes{$xx}) {
                $sugar = $opcodes{$xx} . solve('xx', $toast);
                substr $sugar, 2, 0, $syrup;
                addcode $sugar;
              } elsif (exists $opcodes{$rr}) {
                $sugar = $opcodes{$rr} . solve('rr', $toast);
                addcode $sugar;
              } else {
                errormsg "Instruction of form '$cream' not found in opcodes list."; $fatal = 'unfortunately';
              };
            };
          } else {
            if ($$piece[2] ne ':' and $cream !~ /\./) {
              errormsg "If this is a label, you should put a colon after it."; $fatal = 'unfortunately';
            } else {
              $cream =~ s/\:$//;
              if ($cream !~ /\./) {
                $prefix = $cream; $cream = '';
              } elsif ($cream =~ /^\.[^\.]+$/) {
                $cream = substr($cream, 1);
              } elsif ($cream =~ /^[^\.]+\.[^\.]+$/) {
                ($prefix, $cream) = $cream =~ /([^\.]+)\.([^\.]+)/;
              } elsif ($cream =~ /^[^\.]+\.$/) {
                $prefix = substr($cream, 0, -1); $cream = '';
              } else {
                errormsg "Label names may contain only one period.";
                $cream = "\x00" . $hate++;  $fatal = 'unfortunately';
              };
              if ($pass == 1) {
                if (exists $labels{"$namespace.$prefix.$cream"}) {
                  errormsg "Label '$namespace.$prefix.$cream' is also at " . $definitions{"$namespace.$prefix.$cream"}; $fatal = 'unfortunately';
                } else {
                  if ($prefix ne '') {
                    $labels{"$namespace.$prefix.$cream"} = $sec{$section}[2];
                    $definitions{"$namespace.$prefix.$cream"} = $$piece[0];
                  } else {
                    errormsg "This sub-label does not have a parent label."; $fatal = 'unfortunately';
                  };
                };
              };
            };
          };
        };
      };
    };

    exit(1) if $fatal;  # If pass one fails, skip pass two.
  };

# Well, with any luck...

  unless ($successfuloutput) {
    print STDERR "No errors, but a lack of any 'output' statement means a lack of any output.\r\n";
  };
