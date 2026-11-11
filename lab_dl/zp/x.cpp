// callee stubs, kept out of line
#define NI __declspec(noinline)
int g;
NI char *Parse(const char *a, const char *b, int c) { g += c; return (char *)a; }
NI void SACopy(char **d, const char *s) { *d = (char *)s; g++; }
NI void Free(void *p) { g += (int)p; }
NI void *Alloc(int n) { g += n; return &g; }
NI int Load(const char *u, void *r, const char *f) { return g + (int)u + (int)f; }
NI void Create(char *p) { g += *p; }
NI void Prof(void) { g++; }
NI void Print(const char *f, ...) { g++; }
NI void Unesc(char *p) { g++; }
NI void Timeout(int t) { g += t; }
NI void *NewReq(void) { return &g; }
NI void Init(void *r) { g++; }
NI void Cancel(void) { g++; }
NI void DLInit(void) { g++; }
int probe(char *l, const char *r);
void drive(int x) { probe((char *)x, (const char *)x); }
