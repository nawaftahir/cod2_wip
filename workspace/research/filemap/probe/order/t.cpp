#include <afxwin.h>
struct Big { int v[8];
  int Sum() { int s = 0; for (int i = 0; i < 8; i++) s += v[i] * v[i] + (s >> 3); for (int i = 0; i < 8; i++) s ^= v[i] << i; return s; }
  virtual ~Big() {}
  virtual int Virt() { return v[0] + v[1]; } };
static int helper(int a);
int fA(Big *b) { CString s("a"); s += "b"; return b->Sum() + s.GetLength(); }
int fB(int a) { return helper(a) + 1; }
int fC(Big *b) { Big c; return b->Sum() + c.Virt(); }
static int helper(int a) { CString t; t.Format("%d", a); return t.GetLength() * a; }
int fD(int a) { return helper(a * 3) - 2; }
