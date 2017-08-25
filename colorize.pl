#!/usr/bin/env perl
use strict;
use warnings;

sub getcolor {
	my $number = ord(shift) - 48;
	#map 0 to black (7), inside the set
	#9 is blue, outside the set
	print"\x1b[48;5;7m  " and return if ($number == 9);
	printf "\x1b[48;5;%dm  ",$number+1 and return if ($number > 6);
	printf "\x1b[48;5;%dm  ",$number and return if ($number > -1);
	printf "\x1b[m\n";
}

while (<>) {
	map { getcolor $_ } (split //);
}
