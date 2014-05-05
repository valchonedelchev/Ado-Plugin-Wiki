#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Ado::Plugin::Wiki' ) || print "Bail out!\n";
}

diag( "Testing Ado::Plugin::Wiki $Ado::Plugin::Wiki::VERSION, Perl $], $^X" );
