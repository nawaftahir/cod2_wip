cd /w/scratch/richtest
cat > st.cpp <<'EOF'
extern int g;
extern void sink(int);
static int __declspec(noinline) helper(int *p, int n)
{
    if (!p) sink(1);
    return p[n] + g;
}
int api1(int *p) { return helper(p, 1); }
int api2(int *p) { return helper(p, 2) * 3; }
EOF
wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /Oy- /Op /FAs /Fast.asm st.cpp >/dev/null 2>&1
sed -n '/helper/,/ENDP/p' st.asm | head -30
