#! /usr/bin/perl

use strict;
use warnings;
use Scalar::Util qw(looks_like_number);

my $numbers = '97419 92425 45424 22860 50690 25188 49846 26422 44857 19374 51598 54896 47302 50629 16484 69869, 90290 46046 22470. 50690 25188 89881 50629, "52079 97825 39434 63729 49700 52242 98947 26422." 65700 32740 90276 55321 56167 90290 27842 92425 45424 40688. 84224 72297 91160 22155 18780 65831 18908 43181 45424, 92425 45424 59720 50690 97004 45838 65907 51435 91160 90290 64424 98103 16484 63751 79139. 33905 50234 50629 59715 65907 91772 22862 90262 90290 64424. 18908 38100 50690 25188 49767 91160 39434 50690 49700? 55376 56167 35694 65901 97444 66123 65004 92425 45424 26422 47079 16484 69869 54896 50690 79139';
my $file = "/etc/dictionaries-common/words";
my @numb = split(/(\s|\,|\.|\?|\")/, $numbers);
my @numb2;
my %hash = ();
my $line = 1;

for (my $i = 0; $i < scalar @numb; $i++) {
  if (looks_like_number($numb[$i])) {
    push @numb2, $numb[$i];
    $hash{$numb[$i]} = 0;
  }
}

open( my $fh, "<", $file ) or die "Couldn't open file: $file, $!";

while( my $w = <$fh> ) {
  chomp $w;

  foreach my $key (keys %hash) {
    if ($key == $line) {
      $hash{$key} = $w;
    }
  }
  $line++;
}

for (my $i = 0; $i < scalar @numb2; $i++) {
  print($hash{$numb[$i]});
  print(" ");
}
print("\n");
