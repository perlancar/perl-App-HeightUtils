package App::HeightUtils;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

$SPEC{calc_child_height_potential} = {
    v => 1.1,
    summary => "Calculate child potential height based on mother's and father's height",
    description => <<'MARKDOWN',


MARKDOWN
    args => {
        gender => {
            schema => ['str*', in=>['M','F']],
            req => 1,
            pos => 0,
            cmdline_aliases => {
                boy  => { is_flag=>1, code=>sub { $_[0]{gender} = 'M' } },
                girl => { is_flag=>1, code=>sub { $_[0]{gender} = 'F' } },
            },
        },
        father_height => {
            summary => "Father's height (in cm)",
            schema => 'posint*',
            req => 1,
            pos => 1,
        },
        mother_height => {
            summary => "Mother's height (in cm)",
            schema => 'posint*',
            req => 1,
            pos => 1,
        },
    },
};
sub calc_child_height_potential {
    my %args = @_;

    my $child_height = ($args{mother_height} + $args{mother_height} + ($args{gender} eq 'M' ? 13 : -13))/2;
    [200, "OK", $child_height];
}

1;
#ABSTRACT: Utilities related to body height

=head1 DESCRIPTION

This distributions provides the following command-line utilities related to body
height:

# INSERT_EXECS_LIST


=head1 SEE ALSO

L<App::WeightUtils>

L<App::WHOGrowthReferenceUtils>

=cut
