#!/usr/bin/perl

print "hello";

open(OUT, "> t_ok_sjis_multibyte[nec].txt");
binmode(OUT);

#n little endian ushort
#print OUT pack("n",(0xfa4 << 4) + 0x0); 
#goto end_proc;

#multi byte shift-jis
for ($u = 0x874; $u <= 0x879; $u++) {
  for ($l = 0x0; $l <= 0xf; $l++) {
    if ($u == 0x875 && $l == 0xe) {
      next;
    }
    if ($u == 0x877 && $l >= 0x6 && $l <= 0xd) {
      next;
    }
    if ($u == 0x877 && $l == 0xf) {
      next;
    }
    if ($u == 0x879 && $l >= 0xd && $l <= 0xf) {
      next;
    }
    print OUT pack("n",($u << 4) + $l); 
  }
}

for ($u = 0xed4; $u <= 0xedf; $u++) {
  for ($l = 0x0; $l <= 0xf; $l++) {
    if ($u == 0xeb7 && $l == 0xf) {
      next;
    }
    if ($u == 0xedf && $l >= 0xc && $l <= 0xf) {
      next;
    }
    print OUT pack("n",($u << 4) + $l); 
  }
}

for ($u = 0xee4; $u <= 0xeef; $u++) {
  for ($l = 0x0; $l <= 0xf; $l++) {
    if ($u == 0xee7 && $l == 0xf) {
      next;
    }
    if ($u == 0xeee && $l >= 0xc && $l <= 0xf) {
      next;
    }
    if ($u == 0xeef && $l >= 0xc && $l <= 0xf) {
      next;
    }
    print OUT pack("n",($u << 4) + $l); 
  }
}

end_proc:
close(OUT);

