while IFS= read -r f; do
  a="${f%%_*}"
  cl -c -nologo -W0 -O2 "src/draft/$f" "/Fobuild/objs_draft/a_${a}.obj" >/dev/null 2>&1
  cl -c -nologo -W0 -O1 "src/draft/$f" "/Fobuild/objs_draft/c_${a}.obj" >/dev/null 2>&1
done < /work/build/polarity_changed.txt
