#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

use_ok('Ado::Plugin::Wiki');
use_ok('Ado::Control::Wiki');
use_ok('Ado::Model::WikiPages');

done_testing();
