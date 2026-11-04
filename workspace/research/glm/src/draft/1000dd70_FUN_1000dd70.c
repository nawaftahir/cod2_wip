extern unsigned int DAT_101d5d28;
extern unsigned int DAT_101d5d2c;
extern int FUN_1002ca50();
extern int FUN_1002cd00();
extern int FUN_10061c80();


unsigned int * FUN_1000dd70(unsigned int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = g_101d5d28;
 
	int g_101d5d28 = DAT_101d5d28; iVar3 = 0;
  if (0 < g_101d5d28) {
    do {
      iVar2 = FUN_1002ca50();
      if (iVar2 != 0) {
        return &g_101d5d2c + iVar3 * 0x44;
 
	int g_101d5d2c = DAT_101d5d2c;     }
      iVar3 = iVar3 + 1;
    } while (iVar3 < iVar1);
    if (iVar3 == 0x10) {
      FUN_10061c80("^1ERROR: map uses more than %i waterMap textures\n",0x10);
      return (unsigned int *)0x0;
    }
  }
  FUN_1002cd00(param_1,iVar3);
  g_101d5d28 = g_101d5d28 + 1;
  return &g_101d5d2c + iVar3 * 0x44;
}


