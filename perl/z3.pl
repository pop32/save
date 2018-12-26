#!/usr/bin/perl

print "hello";

open(OUT, "> t_ok_sjis_multibyte[ibm].txt");
binmode(OUT);

#n little endian ushort
#print OUT pack("n",(0xfa4 << 4) + 0x0); 
#goto end_proc;

#multi byte shift-jis
for ($u = 0xfa4; $u <= 0xfaf; $u++) {
  for ($l = 0x0; $l <= 0xf; $l++) {
    if ($u == 0xfa7 && $l == 0xf) {
      next;
    }
    if ($u == 0xfaf && $l >= 0xd && $l <= 0xf) {
      next;
    }
    print OUT pack("n",($u << 4) + $l); 
  }
}

for ($u = 0xfb4; $u <= 0xfbf; $u++) {
  for ($l = 0x0; $l <= 0xf; $l++) {
    if ($u == 0xfb7 && $l == 0xf) {
      next;
    }
    if ($u == 0xfbf && $l >= 0xc && $l <= 0xf) {
      next;
    }
    print OUT pack("n",($u << 4) + $l); 
  }
}

for ($l = 0x0; $l <= 0xf; $l++) {
  if ($l >= 0xc && $l <= 0xf) {
    next;
  } 
  print OUT pack("n",(0xfc4 << 4) + $l); 
}

end_proc:
close(OUT);

