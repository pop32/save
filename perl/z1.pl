#!/usr/bin/perl

print "hello";

open(OUT, "> t_ok_sjis_ascii.txt");
binmode(OUT);

#print OUT pack("C",(0x2 << 4) + 0x1); 
#goto end_proc;

#ascii_1
for ($u = 0x2; $u < 0x7; $u++) {
  for ($l = 0x0; $l <= 0xf; $l++) {
    print OUT pack("C",($u << 4) + $l); 
  }
}

#ascii_2
for ($l = 0x0; $l <= 0xe; $l++) {
  print OUT pack("C",(0x7 << 4) + $l); 
}

#kigou/kana
for ($l = 0x1; $l <= 0xf; $l++) {
  print OUT pack("C",(0xa << 4) + $l); 
}

#kana
for ($u = 0xb; $u < 0xe; $u++) {
  for ($l = 0x0; $l <= 0xf; $l++) {
    print OUT pack("C",($u << 4) + $l); 
  }
}

end_proc:
close(OUT);

