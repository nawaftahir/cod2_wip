extern unsigned int DAT_101da9c8;
extern unsigned int DAT_10678498;
extern unsigned int DAT_1072d9b0;
extern unsigned int DAT_1072d9b4;
extern int FUN_10021040();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10020b50(void)

{
  int iVar1;
  unsigned int *puVar2;
  
  puVar2 = &DAT_10678498;
  for (iVar1 = 0x15; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  _DAT_106784a0 = 0x1000;
  _DAT_106784ac = 0x200;
  _DAT_106784b8 = 0x1000;
  _DAT_106784d0 = 0x4000;
  _DAT_106784e8 = 0x1000;
  DAT_1072d9b0 = (*(void *)RI_Hunk_AllocInternal)(0x200000);
  DAT_1072d9b4 = (*(void *)RI_Hunk_AllocInternal)(0x200000);
  iVar1 = g_101da9c8;
 
	int g_101da9c8 = DAT_101da9c8; if (g_101da9c8 == 0) {
    FUN_10021040();
    return;
  }
  *(unsigned int *)(g_101da9c8 + 0x249d0c) = 0;
  *(unsigned int *)(iVar1 + 0x249d10) = 0;
  *(unsigned int *)(iVar1 + 0x249d14) = 0;
  return;
}


