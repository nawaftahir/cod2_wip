extern void sink(char *);
void __declspec(noinline) fr(char *p)
{
    char w[0x44];
    w[0] = p[0];
    sink(w);
}
