package Kosoku::JP::API;
use 5.008005;
use strict;
use warnings;
use utf8;
use URI;
use LWP::UserAgent;
use XML::Simple;

our $VERSION = "0.01";

use constant URL => 'http://kosoku.jp/api/route.php';

sub new{
 my($class,%opt) = @_;
 my $self = {};
 bless $self,$class;
 $self;
}

sub request{
 my($self,$f,$t,$c) = @_;
 my $url = URI->new(URL);
 $url->query_form(
   f => $f,
   t => $t,
   c => $c,
 );
 my $ua = LWP::UserAgent->new();
 my $res = $ua->get($url);
 my $xml = $res->content;
 my $data = XMLin($xml);
 return $data;
}

sub get_frompoint{
  my ($self,$data) = @_;
  return $data->{From};
}

sub get_topoint{
 my($self,$data) = @_;
 return $data->{To};
}

sub get_cartype{
 my($self,$data) = @_;
 return $data->{CarType};
}

1;


__END__

=encoding utf-8

=head1 NAME

Kosoku::JP::API - It's new $module

=head1 SYNOPSIS

    use Kosoku::JP::API;

=head1 DESCRIPTION

Kosoku::JP::API is ...

=head1 LICENSE

Copyright (C) sue7ga.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

sue7ga E<lt>sue77ga@gmail.comE<gt>

=cut

