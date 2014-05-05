use 5.006;
use strict;
use warnings FATAL => 'all';
use Module::Build;

my $builder = Module::Build->new(
    module_name          => 'Ado::Plugin::Wiki',
    license              => 'lgpl3',
    dist_author          => q{Valcho Nedelchev <weby@cpan.org>},
    dist_version_from    => 'lib/Ado/Plugin/Wiki.pm',
    release_status       => 'unstable',
    configure_requires   => { 'Module::Build' => 0 },
    build_requires       => { 'Test::More' => 0, },
    requires             => { 'Ado' => 0.40 },
    add_to_cleanup       => ['Ado-Plugin-Wiki-*'],
    create_makefile_pl   => 'traditional',
    recursive_test_files => 1,
);

$builder->create_build_script();
