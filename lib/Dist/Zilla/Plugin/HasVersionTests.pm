use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::HasVersionTests;
# ABSTRACT: Release tests for version numbers
use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';

__PACKAGE__->meta->make_immutable;
no Moose;
1;

=begin :prelude

=for test_synopsis
1;
__END__

=end :prelude

=head1 SYNOPSIS

In C<dist.ini>:

    [HasVersionTests]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following file:

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
