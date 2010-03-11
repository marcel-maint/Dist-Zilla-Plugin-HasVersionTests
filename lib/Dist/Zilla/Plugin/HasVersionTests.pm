use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::HasVersionTests;
# ABSTRACT: release tests for version numbers
use Moose;
use Test::HasVersion;
extends 'Dist::Zilla::Plugin::InlineFiles';

__PACKAGE__->meta->make_immutable;
no Moose;
1;

=pod

=for test_synopsis
1;
__END__

=head1 SYNOPSIS

In C<dist.ini>:

    [HasVersionTests]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following files

  xt/release/has-version.t - a standard Test::HasVersion test

=cut

__DATA__
___[ xt/release/has-version.t ]___
#!perl

use Test::More;

eval "use Test::HasVersion";
plan skip_all => "Test::HasVersion required for testing version numbers"
  if $@;
all_pm_version_ok();
