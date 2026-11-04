#!/bin/bash
# Compile all reconstructed TUs with MSVC 7.1 -> build/objs/
# (.c -> C, .cpp -> C++; cl infers language from extension)
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
rm -rf "$DIR/build/objs"
mkdir -p "$DIR/build/objs"
docker run --rm -v "$DIR":/work -w /work/src/f cod2-msvc71 sh -c \
  "cl /c /O2 \$(ls *.c *.cpp 2>/dev/null) /Fo../../build/objs/ 2>&1 | grep -E 'error|fatal' ; true; echo objs: \$(ls ../../build/objs/*.obj 2>/dev/null | wc -l)"
