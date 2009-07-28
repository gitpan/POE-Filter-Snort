#!/usr/bin/perl
# $Id: Makefile.PL 15 2009-07-28 06:42:22Z rcaputo $

use ExtUtils::MakeMaker;

# Touch CHANGES so it exists.
open(CHANGES, ">>CHANGES") and close CHANGES;

WriteMakefile(
	NAME         => 'POE::Filter::Snort',
	AUTHOR       => 'Rocco Caputo <rcaputo@cpan.org>',
	ABSTRACT     => 'POE stream filter for parsing Snort logs',
	LICENSE      => 'perl',
	VERSION_FROM => 'Snort.pm',
	META_ADD     => {
		resources  => {
			license    => 'http://dev.perl.org/licenses/',
			repository => 'http://thirdlobe.com/svn/pofi-snorit/trunk'
		},
	},
	PM           => { 'Snort.pm' => '$(INST_LIBDIR)/Snort.pm' },
	PREREQ_PM    => {
		'POE'        => 1.007,
		'Test::More' => 0,
	},
	dist         => {
		COMPRESS   => 'gzip -9f',
		SUFFIX     => 'gz',
		PREOP      => (
			'svn-log.perl --repo https://thirdlobe.com/svn/pofi-snort | ' .
			'tee ./$(DISTNAME)-$(VERSION)/CHANGES > ./CHANGES'
		),
	},
);
