#!/usr/bin/perl
# libreorder.pl <lib>: move the last archive member (mss_auto.obj) in front of the last three
# (null thunk, null descriptor, import descriptor) and rewrite both linker members.
# Retail's Rich header lists (28,9466) before (25,9466); that only happens with this member order.
use strict;
my $p = shift;
open(my $f, '<:raw', $p) or die "$p: $!";
my $d = do { local $/; <$f> };
close $f;
die "not an archive" unless substr($d, 0, 8) eq "!<arch>\n";
my ($o, @m) = (8);
while ($o < length $d) {
    my $h = substr($d, $o, 60);
    my $sz = substr($h, 48, 10) + 0;
    push @m, { off => $o, hdr => $h, data => substr($d, $o + 60, $sz) };
    $o += 60 + $sz + ($sz & 1);
}
my %idx = map { $m[$_]{off} => $_ } 0 .. $#m;
# symbols of each member, from the second linker member (m[1])
my $s = $m[1]{data};
my $n = unpack('V', $s);
my @offs = unpack("V$n", substr($s, 4, 4 * $n));
my $ns = unpack('V', substr($s, 4 + 4 * $n, 4));
my @ix = unpack("v$ns", substr($s, 8 + 4 * $n, 2 * $ns));
my @names = split /\0/, substr($s, 8 + 4 * $n + 2 * $ns);
my %sym;
for my $i (0 .. $ns - 1) { push @{ $sym{ $idx{ $offs[$ix[$i] - 1] } } }, $names[$i]; }
my $lng = ($m[2]{hdr} =~ /^\/\/ /) ? $m[2] : undef;
my @body = grep { $_ != 0 && $_ != 1 && !($lng && $_ == 2) } 0 .. $#m;
@body = (@body[0 .. $#body - 4], $body[-1], @body[$#body - 3 .. $#body - 1]);
my @mem = map { { hdr => $m[$_]{hdr}, data => $m[$_]{data}, syms => $sym{$_} || [] } } @body;
sub pad { my $x = shift; length($x) & 1 ? "$x\n" : $x }
sub hdr { my ($nm, $sz) = @_; sprintf('%-16s%-12s%-6s%-6s%-8s%-10d`' . "\n", $nm, '0', '0', '0', '0', $sz) }
my @all;
for my $i (0 .. $#mem) { push @all, [$_, $i] for @{ $mem[$i]{syms} }; }
my @byname = sort { $a->[0] cmp $b->[0] } @all;
sub linkers {
    my @mo = @_;
    my @byoff = sort { $mo[$a->[1]] <=> $mo[$b->[1]] or $a->[0] cmp $b->[0] } @all;
    my $first = pack('N', scalar @byoff) . join('', map { pack('N', $mo[$_->[1]]) } @byoff)
        . join('', map { "$_->[0]\0" } @byoff);
    my $second = pack('V', scalar @mo) . pack('V*', @mo) . pack('V', scalar @byname)
        . pack('v*', map { $_->[1] + 1 } @byname) . join('', map { "$_->[0]\0" } @byname);
    return ($first, $second);
}
my ($fa, $sa) = linkers(map { 0 } @mem);
my $base = 8 + length(pad(hdr('/', 0) . $fa)) + length(pad(hdr('/', 0) . $sa))
    + ($lng ? length(pad($lng->{hdr} . $lng->{data})) : 0);
my ($pos, @mo) = ($base);
for my $x (@mem) { push @mo, $pos; $pos += 60 + length($x->{data}) + (length($x->{data}) & 1); }
my ($fl, $sl) = linkers(@mo);
my $out = "!<arch>\n" . pad(hdr('/', length $fl) . $fl) . pad(hdr('/', length $sl) . $sl);
$out .= pad($lng->{hdr} . $lng->{data}) if $lng;
$out .= pad($_->{hdr} . $_->{data}) for @mem;
open($f, '>:raw', $p) or die "$p: $!";
print $f $out;
close $f;
print "$p: members reordered\n";
