#!/usr/bin/perl

use utf8;
use Encode qw/encode decode/;

open(IN, '<:encoding(cp932)','t_ok_sjis_multibyte[ibm].txt');
$str = <IN>;
print $str;

open(OUT, '>:encoding(UTF-8)','t_ok_utf8_multibyte[ibm].txt');
print OUT $str;
close(OUT);

open(OUT, '>:encoding(UTF-16)','t_ok_utf16bom_multibyte[ibm].txt');
print OUT $str;
close(OUT);

open(OUT, '>:encoding(euc-jp)','t_ok_eucjp_multibyte[ibm].txt');
print OUT $str;
close(OUT);

end_proc:
close(IN);

