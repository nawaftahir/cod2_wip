#!/bin/bash
# c2memscan13.sh MANGLED HEXPATTERN: LTCG relink with a c2.dll that spins when c2 starts compiling MANGLED, then search
# link.exe memory (/proc/PID/mem) for HEXPATTERN (hex bytes, '..' = any byte) and print address + 24 bytes.
# Pass the fn compiled AFTER the one you want, so its code is already in c2's buffers. Heap addresses match winedbg runs.
W=$(cd "$(dirname "$0")/.." && pwd); T=$W/../../client-1.0/tools/oracle
cd "$W"; mkdir -p build/ra
[ -f build/ra/cave_dbg.s ] || { echo "run tools/c2dbg13.sh once first (builds cave_dbg.s)"; exit 1; }
sed 's/^  int3$/  jmp ./' build/ra/cave_dbg.s | sed "s/^name: .ascii .*/name: .ascii \"$1\\\\0\"/" > build/ra/cave_spin.s
as --32 build/ra/cave_spin.s -o build/ra/cave_spin.o && ld -m elf_i386 -Ttext=0x10865d50 build/ra/cave_spin.o -o build/ra/cave_spin.elf &&
  python3 $T/patch_ra.py build/ra/c2.dll build/ra/cave_spin.elf build/ra/c2spin.dll || exit 1
cat > build/ra/scan.pl <<'EOF'
my ($hex) = @ARGV; my $re = join '', map { $_ eq '..' ? '.' : sprintf('\x%s', $_) } ($hex =~ /(..)/g);
for my $c (glob '/proc/[0-9]*/cmdline') {
  my ($pid) = $c =~ m{/proc/(\d+)/}; open my $f, '<', $c or next; my $cmd = do { local $/; <$f> } // ''; close $f;
  next unless $cmd =~ /link\.exe/i && $cmd !~ /^winedbg/; print STDERR "scan pid $pid\n";
  open my $m, '<', "/proc/$pid/maps" or next;
  open my $mem, '<:raw', "/proc/$pid/mem" or next;
  while (<$m>) {
    my ($a, $b, $perm) = /^([0-9a-f]+)-([0-9a-f]+) (\S+)/; next unless $perm =~ /^r/;
    $a = hex $a; $b = hex $b; next if $b - $a > (1 << 28) || $a >= 0xc0000000;
    sysseek($mem, $a, 0) or next; my $d = ''; sysread($mem, $d, $b - $a) or next;
    while ($d =~ /$re/sg) { my $o = $-[0]; printf "%d %08x %s\n", $pid, $a + $o, unpack('H*', substr($d, $o, 24)); }
  }
}
EOF
grep '^wine /opt' build/ra/run.sh | sed 's#ra\\ox#ra\\sx#g; s#build/ra/link.log#build/ra/spin.log#' > build/ra/spinlink.sh
cat > build/ra/runspin.sh <<EOS
cp /w/build/ra/c2spin.dll /opt/msvc710/Vc7/bin/c2.dll
cd /w
sh /w/build/ra/spinlink.sh &
sleep ${WAIT:-40}
perl /w/build/ra/scan.pl '$2'
EOS
timeout 300 docker run --rm --cap-add SYS_PTRACE -v $W:/w -v $W/build/tree:/w/src -v $W/build/tree:/builds/pc_1.3_1_1/pc/cod2src -w /w cod2-msvc71-vs2003 sh /w/build/ra/runspin.sh
