#!/usr/bin/perl

# This script is to see configuration for option that is in interest.
# Usage bigram.pl rewrite.cfg reply_send_chunked

use strict;

my $num_args = $#ARGV + 1;
if ($num_args != 2) {
	print "\n Usage bigram.pl rewrite.cfg refresh_absmax \n";
	exit;
}


my $filename=$ARGV[0];
my $option=$ARGV[1];

open(my $fh, '<:encoding(UTF-8)', $filename)
	or die " Could not open file '$filename' $!";

sub split_words {
	my ( $word, $pre );
	my ( @words, @bigram );
	
	$pre = "";
	while (my $row = <$fh> ) {
		chomp $row;
		@words = split( /\s+/, $row);
		foreach $word ( @words ) {
			if ( $pre eq $option ) {
				push( @bigram, $word );
			}
			$pre = $word;
		}
	}
	return @bigram;
}

MAIN: {
	my $word;
	my @bigram;
	
	@bigram = split_words();

	foreach $word ( @bigram ) {
		print $word . "\n";
	}
}
