extern unsigned int DAT_101ac96c;
extern int FUN_100826bd();


void FUN_10085814(unsigned int param_1)

{
  if (DAT_101ac96c == 0) {
	int g_101ac96c = DAT_101ac96c;
    FUN_100826bd(param_1,0x10);
  }
  else {
    g_101ac96c = *(int *)(g_101ac96c + 0x70);
  }
  return;
}


