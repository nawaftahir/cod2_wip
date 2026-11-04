extern unsigned int DAT_101ac974;
extern int FUN_100826bd();


void FUN_10085d76(unsigned int param_1)

{
  if (DAT_101ac974 == 0) {
	int g_101ac974 = DAT_101ac974;
    FUN_100826bd(param_1,0x10);
  }
  else {
    g_101ac974 = *(int *)(g_101ac974 + 0x78);
  }
  return;
}


