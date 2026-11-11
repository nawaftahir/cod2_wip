// callee stubs under /GL: opaque via volatile and an escaped pointer
#define NI __declspec(noinline)
volatile int g; char **gpp; char *gbuf[4];
NI char *Parse(const char *a, const char *b, int c) { g += c + (int)b; return (char *)a + g; }
NI void SACopy(char **d, const char *s) { gpp = d; *d = (char *)s + g; }
NI void Free(void *p) { g += (int)p; if (gpp) g += (int)*gpp; }
NI void *Alloc(int n) { g += n; return gbuf + g; }
NI int Load(const char *u, void *r, const char *f) { return g + (int)u + (int)f + (int)r; }
NI void Create(char *p) { g += *p; }
NI void Prof(void) { if (gpp) g += (int)*gpp; }
NI void Print(const char *f, ...) { g += *f; if (gpp) g += (int)*gpp; }
NI void Unesc(char *p) { g += *p; }
NI void Timeout(int t) { g += t; }
NI void *NewReq(void) { return gbuf + g; }
NI void Init(void *r) { g += (int)r; }
NI void Cancel(void) { g++; }
NI void DLInit(void) { g++; }
int probe(char *l, const char *r);
void drive(int x) { probe((char *)x, (const char *)x); }
