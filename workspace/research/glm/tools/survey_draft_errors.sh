for f in /work/src/draft/*.c; do
  b=$(basename $f)
  err=$(cl -c -nologo -W0 -O2 "$f" /Fobuild/objs_red/probe.obj 2>&1 | grep -oE "error C[0-9]+: .*" | head -1)
  [ -n "$err" ] && echo "$b | $err"
done
