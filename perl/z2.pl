#!/usr/bin/perl

print "hello";

open(OUT, "> t_ok_sjis_multibyte[sjis_only].txt");
binmode(OUT);

#n little endian ushort
#print OUT pack("n",(0x81 << 8) + 0x40); 
#goto end_proc;

#multi byte shift-jis
for ($l = 0x40; $l <= 0xfc; $l++) {
  if ($l == 0x7f) {
    next;
  }
  if ($l >= 0xad && $l <= 0xb7) {
    next;
  }
  if ($l >= 0xc0 && $l <= 0xc7) {
    next;
  }
  if ($l >= 0xcf && $l <= 0xd9) {
    next;
  }
  if ($l >= 0xe9 && $l <= 0xef) {
    next;
  }
  if ($l >= 0xf8 && $l <= 0xfb) {
    next;
  }
  print OUT pack("n",(0x81 << 8) + $l); 
}

for ($l = 0x40; $l <= 0xfc; $l++) {
  if ($l == 0x7f) {
    next;
  }
  if ($l >= 0x40 && $l <= 0x4e) {
    next;
  }
  if ($l >= 0x59 && $l <= 0x5f) {
    next;
  }
  if ($l >= 0x7a && $l <= 0x80) {
    next;
  }
  if ($l >= 0x9b && $l <= 0x9e) {
    next;
  }
  if ($l >= 0xf2 && $l <= 0xfc) {
    next;
  }
  print OUT pack("n",(0x82 << 8) + $l); 
}

for ($l = 0x40; $l <= 0xfc; $l++) {
  if ($l == 0x7f) {
    next;
  }
  if ($l >= 0x97 && $l <= 0x9e) {
    next;
  }
  if ($l >= 0xb7 && $l <= 0xbe) {
    next;
  }
  if ($l >= 0xd7 && $l <= 0xfc) {
    next;
  }
  print OUT pack("n",(0x83 << 8) + $l); 
}

for ($l = 0x40; $l <= 0xfc; $l++) {
  if ($l == 0x7f) {
    next;
  }
  if ($l >= 0x61 && $l <= 0x6f) {
    next;
  }
  if ($l >= 0x92 && $l <= 0x9e) {
    next;
  }
  if ($l >= 0xbf && $l <= 0xfc) {
    next;
  }
  print OUT pack("n",(0x84 << 8) + $l); 
}

for ($l = 0x40; $l <= 0xfc; $l++) {
  if ($l == 0x7f) {
    next;
  }
  if ($l >= 0x40 && $l <= 0x9e) {
    next;
  }
  print OUT pack("n",(0x88 << 8) + $l); 
}

for ($u = 0x89; $u <= 0x9f; $u++) {
  for ($l = 0x40; $l <= 0xfc; $l++) {
    if ($l == 0x7f) {
      next;
    }
    if ($u == 0x98 && $l >= 0x73 && $l <= 0x9e) {
      next;
    }
    print OUT pack("n",($u << 8) + $l); 
  }
}


for ($u = 0xe0; $u <= 0xea; $u++) {
  for ($l = 0x40; $l <= 0xfc; $l++) {
    if ($l == 0x7f) {
      next;
    }
    if ($u == 0xea && $l >= 0xa5 && $l <= 0xfc) {
      next;
    }
    print OUT pack("n",($u << 8) + $l); 
  }
}


end_proc:
close(OUT);

