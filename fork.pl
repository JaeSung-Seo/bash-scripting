#!/usr/bin/perl

use strict;

MAIN: {
	my ( $i, $pid );
	my @number = ( 2, 3, 8, 9, 5 );

	foreach $i ( @number ) {
		$pid = fork();
		if ( $pid == 0 ) {
		#Child
			sleep $i;
			print $i . ",";
			exit 0;
		} else {
		# Parent
			print "forked pid = " . $pid . "\n"
		}
	}


	while ( 1 ) {
		if ( wait() == -1 ) {
			print "Done. \n";
			exit 0;
		}
	}
}
