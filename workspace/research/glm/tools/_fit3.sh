set -e
for spec in "10022040 a" "10022220 c" "10021bf0 c"; do
  set -- $spec; a=$1; vk=$2
  n=$(ls src/draft/${a}_*.c | head -1 | xargs basename)
  docker run --rm -v $PWD:/work -w /work/src/draft cod2-msvc71 sh -c \
    "cl /nologo /W0 /O${vk#} /c $n /Fo../../build/objs_red/f_${a}.obj" >/dev/null 2>&1 || true
done
