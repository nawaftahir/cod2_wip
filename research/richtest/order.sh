cd /w/scratch/richtest
CL="wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2"
k=1
for n in a b c d; do
  printf 'int %s1(int x){return x*%d+%d;}\nint %s2(int x){return x*%d-%d;}\n' $n $((k+2)) $k $n $((k+7)) $((k*3)) > o_$n.c
  k=$((k+1))
done
printf 'int a1(int);int b1(int);int c1(int);int d1(int);int a2(int);int b2(int);int c2(int);int d2(int);\nint main(){return a1(1)+b1(2)+c1(3)+d1(4)+a2(1)+b2(2)+c2(3)+d2(4);}\n' > o_m.c
$CL o_a.c >/dev/null; $CL /GL o_b.c >/dev/null; $CL o_c.c >/dev/null; $CL /GL o_d.c >/dev/null; $CL o_m.c >/dev/null
wine /opt/msvc710/Vc7/bin/link.exe /nologo /DEBUG /LTCG /MAP:o.map /OUT:o.exe o_a.obj o_b.obj o_c.obj o_d.obj o_m.obj >/dev/null
echo "link order: a(plain) b(/GL) c(plain) d(/GL) main(plain)"
grep -E ' _(a|b|c|d)[12] | _main ' o.map | awk '{print $3, $2, $NF}' | sort
