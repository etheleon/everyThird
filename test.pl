#!/usr/bin/env perl

use v5.10;

my $lastColumn  = 912;
my $threshold   = 10;
my $maxElements = (912 / 3)-1;

my $header = <>;
print "status,$header";
#my $header2 = <>;
#print $header2;

my $i = 0;

while(<>){
	$i++;
    chomp;
    my @myValues;
    my @rows = split/,/;

    my $finished = plusThree(1, \@myValues, \@rows);
    my $theLength = scalar map { $_ > $threshold ? $_ : ()} @$finished;
	#say join "\t", $i, @$finished if $theLength == $maxElements;
	say $theLength == $maxElements ? "$i\tpassed\t$_" : "$i\tfailed\t$_";
}


sub plusThree {
    my ($value, $arr, $row) = @_;
    return $arr if $value > $lastColumn;
    $value += 3;
    push @{$arr}, $row->[$value];
    plusThree($value, $arr, $row)
}
