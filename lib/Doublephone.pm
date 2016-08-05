use v6.c;

use NativeCall;

class Doublephone {
    constant LIB = %?RESOURCES<libraries/double_metaphone>.Str;

    sub DoubleMetaphone(Str $str, CArray[Str] $out is rw) is native(LIB) { * }

    sub double-metaphone(Str $str) is export {
        my $out = CArray[Str].new;
        $out[0] = Str;
        $out[1] = Str;
        DoubleMetaphone($str, $out);
        ($out[0], $out[1]);
    }

}
# vim: expandtab shiftwidth=4 ft=perl6
