package Ado::Control::Wiki;
use Mojo::Base 'Ado::Control';
use Ado::Model::WikiPages;

=pod

=encoding utf8

=head1 NAME

Ado::Control::Wiki - The controller for the end-user documentation 

=head2 DESCRIPTION

Dummy

=head1 SYNOPSIS

  #in your browser go to
  http://your-host/wiki

=head1 DESCRIPTION

This is a minimal controller to display and browse wiki pages.

L<Ado::Control::Wiki> inherits all the methods from 
L<Ado::Control> and defines the following ones.

=head1 METHODS

=head2 index

Default page

=cut

sub index {
    my $self = shift;
    $self->render;
}

=head2 read

Read

=cut

sub read {
    my $self = shift;

    my $url = $self->stash('id');
    my $page = Ado::Model::WikiPages->by_url($url);

    return $page->data
        ? $self->render( data => $page->data->{body} )
        : $self->render( status => 302, inline => '<h1>Wiki page not found</h1>' );
}

=head2 save

Save wiki page

=cut

sub save {
    my $self = shift;
    return $self->render( json => { status => 'todo' } );
}


=head1 SEE ALSO

L<Ado::Control>, L<Mojolicious::Controller>, 
L<Mojolicious::Guides::Growing/Model_View_Controller>,
L<Mojolicious::Guides::Growing/Controller_class>

=head1 AUTHOR

Valcho Nedelchev

=cut

1;
