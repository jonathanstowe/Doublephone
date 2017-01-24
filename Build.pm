#!perl6

use v6.c;

use LibraryMake;
use Shell::Command;

class Build {
    method build($workdir) {
         my $srcdir = $workdir.IO.child('src').Str;
         my Str $destdir = "$workdir/lib/../resources/libraries";
         mkpath $destdir;
         my %vars = get-vars($destdir);
         %vars<libdouble_metaphone> = $*VM.platform-library-name('double_metaphone'.IO).Str;
         process-makefile($srcdir, %vars);
         my $goback = $*CWD;
         chdir($srcdir);
         shell(%vars<MAKE>);
         chdir($goback);
    }
    method isa($what) {
        return True if $what.^name eq 'Panda::Builder';
        callsame;
    }
}
# vim: expandtab shiftwidth=4 ft=perl6 ts=4 sts=4
