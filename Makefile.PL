use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'TheSchwartz::Worker::Plugin::Hook',
    AUTHOR              => 'Masaru Hoshino <masartz__at__gmail.com>',
    VERSION_FROM        => 'lib/TheSchwartz/Worker/Plugin/Hook.pm',
    ABSTRACT_FROM       => 'lib/TheSchwartz/Worker/Plugin/Hook.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'version'    => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'TheSchwartz-Worker-Plugin-Hook-*' },
);
