extern unsigned int DAT_101da9c8;
extern unsigned int DAT_1042e778;
extern int FUN_10021040();
extern int FUN_10033b20();
extern int FUN_10033d20();


void FUN_10020d50(void)

{
  int *piVar1;
  unsigned short *puVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar3 = *(int *)(g_1042e778 + 0x30000);
  if (0x30000 - iVar3 < 4) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
  }
  else {
    puVar2 = (unsigned short *)(iVar3 + g_1042e778);
    *(int *)(g_1042e778 + 0x30000) = iVar3 + 4;
    piVar1 = (int *)(iVar4 + 0x30004);
    *piVar1 = *piVar1 + 4;
    *(unsigned short **)(iVar4 + 0x30008) = puVar2;
    *puVar2 = 0;
    puVar2[1] = 4;
  }
  iVar3 = g_101da9c8;
  *(unsigne
	int g_101da9c8 = DAT_101da9c8;d int *)(g_101da9c8 + 0x249d0c) = 0;
  *(unsigned int *)(iVar3 + 0x249d10) = 0;
  *(unsigned int *)(iVar3 + 0x249d14) = 0;
  FUN_10033d20(iVar3);
  FUN_10033b20();
  FUN_10021040();
  return;
}


