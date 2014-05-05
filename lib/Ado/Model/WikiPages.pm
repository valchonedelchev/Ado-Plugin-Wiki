package Ado::Model::WikiPages;

use 5.010001;
use utf8;
use Carp;
use strict;
use warnings;
use parent qw(Ado::Model);

sub is_base_class { return 0 }

my $TABLE_NAME = 'wiki_pages';
my $COLUMNS    = [ 'id', 'tstamp', 'url', 'body' ];
my $ALIASES    = {};
my $CHECKS     = {};

sub CHECKS      { return $CHECKS }
sub TABLE       { return $TABLE_NAME }
sub PRIMARY_KEY { return 'id' }
sub COLUMNS     { return $COLUMNS }
sub ALIASES     { return $ALIASES }

__PACKAGE__->QUOTE_IDENTIFIERS(0);

__PACKAGE__->SQL( 'DROP_wiki_pages' => 'DROP TABLE IF EXISTS wiki_pages' );

__PACKAGE__->SQL(
    'CREATE_wiki_pages' => '
CREATE TABLE IF NOT EXISTS wiki_pages (
  id CHAR(40) PRIMARY KEY,
  tstamp INT(11) NOT NULL DEFAULT 0,
  url CHAR(255) UNIQUE NOT NULL,
  body BLOB NOT NULL
)'
);

__PACKAGE__->SQL( 'CREATE_INDEX_ON_wiki_pages' =>
        'CREATE INDEX IF NOT EXISTS wiki_pages_url ON wiki_pages(url)' );

sub drop { 
    my ( $self, $group ) = @_;
    $self->dbix->query( __PACKAGE__->SQL('DROP_wiki_pages') );
    return $self;
}

sub create {
    my ( $self, $group ) = @_;

    $self->dbix->query( __PACKAGE__->SQL('CREATE_wiki_pages') );
    $self->dbix->query( __PACKAGE__->SQL('CREATE_INDEX_ON_wiki_pages') );

    return $self;
}

sub by_url {
    state $sql = $_[0]->SQL('SELECT') . ' WHERE url=?';
    return $_[0]->query($sql, shift);
}


=pod

=encoding utf8

=head1 NAME

Ado::Model::WikiPages

=head1 SYNOPSIS

Make happy

=head1 DESCRIPTION

Model for Wiki

=head1 METHODS

=head2 drop

Drop table

=head2 create

Create schema

=head2 by_url

String

=head1 AUTHOR

Valcho Nedelchev

=head1 SEE ALSO

L<Ado::Command::adduser>, L<Email::Address>,
L<Ado::Model>, L<DBIx::Simple::Class>, L<DBIx::Simple::Class::Schema>

=head1 COPYRIGHT AND LICENSE

Copyright 2013 Valcho Nedelchev.

This program is free software, you can redistribute it and/or
modify it under the terms of the 
GNU Lesser General Public License v3 (LGPL-3.0).
You may copy, distribute and modify the software provided that 
modifications are open source. However, software that includes 
the license may release under a different license.

See http://opensource.org/licenses/lgpl-3.0.html for more information.

=cut

1;

