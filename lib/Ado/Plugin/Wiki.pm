package Ado::Plugin::Wiki;

use strict;
use warnings;

our $VERSION = '0.01';

sub register {
    my ($self, $app, $config) = @_;
    $self->app($app);
    $app->log->debug("Ado::Plugin::Wiki has been loaded.");
    $config = $self->{config} = {%{$self->config}, %{$config ? $config : {}}};
    $app->log->debug('Plugin ' . $self->name . ' configuration:' . $app->dumper($config));
    $app->load_routes($config->{routes})
      if (ref($config->{routes}) eq 'ARRAY' && scalar @{$config->{routes}});
    
    return $self;
}

1;

=head1 NAME

Ado::Plugin::Wiki - Ado plugin

=head1 ABSTRACT

This is Ado::Plugin::Wiki module

=head1 SYNOPSIS

Adding Wiki powers to your Ado.

=head1 METHODS

=head2 register

Register plugin

=head1 AUTHOR

Valcho Nedelchev, C<< <weby at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-ado-plugin-wiki at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Ado-Plugin-Wiki>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Ado::Plugin::Wiki

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Ado-Plugin-Wiki>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Ado-Plugin-Wiki>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Ado-Plugin-Wiki>

=item * Search CPAN

L<http://search.cpan.org/dist/Ado-Plugin-Wiki/>

=back

=head1 ACKNOWLEDGEMENTS

=head1 SEE ALSO

=head1 LICENSE AND COPYRIGHT

Copyright 2014 Valcho Nedelchev.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this program.  If not, see
L<http://www.gnu.org/licenses/>.

=cut

