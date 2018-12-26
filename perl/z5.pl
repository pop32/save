#!/usr/bin/perl

print "hello";

open(OUT, "> t_ok_sjis_multibyte[user_gaiji].txt");
binmode(OUT);

#n little endian ushort
#print OUT pack("n",(0xfa4 << 4) + 0x0); 
#goto end_proc;

#multi byte shift-jis
for ($u = 0xf04; $u <= 0xf9f; $u++) {
  for ($l = 0x0; $l <= 0xf; $l++) {
    if ($u == 0xf9f && $l >= 0xc) {
      next;
    }
    print OUT pack("n",($u << 4) + $l); 
  }
}

end_proc:
close(OUT);

