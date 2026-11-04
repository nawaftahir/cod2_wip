cd /w/scratch/richtest
cat > ns.cpp <<'EOF'
extern int g;
extern void sink(int);
int __declspec(noinline) helper_ext(int *p, int n) { if (!p) sink(1); return p[n] + g; }
inline int __declspec(noinline) helper_inl(int *p, int n) { if (!p) sink(2); return p[n] - g; }
static int __declspec(noinline) helper_st(int *p, int n) { if (!p) sink(3); return p[n] ^ g; }
int api1(int *p) { return helper_ext(p, 1) + helper_inl(p, 1) + helper_st(p, 1); }
int api2(int *p) { return helper_ext(p, 2) * helper_inl(p, 2) * helper_st(p, 2); }
EOF
wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /Oy- /Op /FAs /Fans.asm ns.cpp >/dev/null 2>&1
for f in helper_ext helper_inl helper_st; do echo "== $f"; awk "/PROC NEAR.*$f|PROC NEAR\t+; $f/{p=1} p&&/= e[a-d]x|= e[sd]i|_p\\$ = /{print} /ENDP/{p=0}" ns.asm; done
grep -E '_p\$ = |PROC NEAR' ns.asm
