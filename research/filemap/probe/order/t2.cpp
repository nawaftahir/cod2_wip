int b01(int *p, int n) { int s = 0; for (int i = 0; i < n; i++) { s += p[i] * (i ^ 7); if (s > 1000) s -= p[i] / 3; else s += p[(i * 7) % n] >> 2; } for (int j = 0; j < n; j++) p[j] = s ^ j; return s + n; }
int b02(int *p, int n) { int s = 0; for (int i = 0; i < n; i++) { s += p[i] * (i ^ 7); if (s > 1000) s -= p[i] / 3; else s += p[(i * 7) % n] >> 2; } for (int j = 0; j < n; j++) p[j] = s ^ j; return s + n; }
int s03(int a) { return a * 3 + 1; }
int b04(int *p, int n) { int s = 0; for (int i = 0; i < n; i++) { s += p[i] * (i ^ 7); if (s > 1000) s -= p[i] / 3; else s += p[(i * 7) % n] >> 2; } for (int j = 0; j < n; j++) p[j] = s ^ j; return s + n; }
int b05(int *p, int n) { int s = 0; for (int i = 0; i < n; i++) { s += p[i] * (i ^ 7); if (s > 1000) s -= p[i] / 3; else s += p[(i * 7) % n] >> 2; } for (int j = 0; j < n; j++) p[j] = s ^ j; return s + n; }
int s06(int a) { return a * 3 + 1; }
int b07(int *p, int n) { int s = 0; for (int i = 0; i < n; i++) { s += p[i] * (i ^ 7); if (s > 1000) s -= p[i] / 3; else s += p[(i * 7) % n] >> 2; } for (int j = 0; j < n; j++) p[j] = s ^ j; return s + n; }
int b08(int *p, int n) { int s = 0; for (int i = 0; i < n; i++) { s += p[i] * (i ^ 7); if (s > 1000) s -= p[i] / 3; else s += p[(i * 7) % n] >> 2; } for (int j = 0; j < n; j++) p[j] = s ^ j; return s + n; }
int s09(int a) { return a * 3 + 1; }
int b10(int *p, int n) { int s = 0; for (int i = 0; i < n; i++) { s += p[i] * (i ^ 7); if (s > 1000) s -= p[i] / 3; else s += p[(i * 7) % n] >> 2; } for (int j = 0; j < n; j++) p[j] = s ^ j; return s + n; }
int caller(int *p) { return s03(1) + s06(2) + s09(3) + b01(p, 3); }
