extern unsigned int DAT_1072d9b0;
extern unsigned int DAT_1072d9bc;
extern unsigned int DAT_1072d9c0;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9d4;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_1072debd;
extern int FUN_1002df40();
extern int FUN_1002e020();
extern int FUN_1002e470();
extern int FUN_1003a5f0();
extern int FUN_1003a8d0();


void FUN_1002ee80(int *param_1)

{
  int iVar1;
  int iVar2;
  short sVar3;
  int iVar4;
  
  iVar2 = *param_1;
  if (DAT_1072debd == '\0') {
    FUN_1002e020();
  }
  if ((DAT_1072d9bc != *(int *)(iVar2 + 4)) || (DAT_1072d9c0 != 3)) {
    if ((g_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
 
	int g_1072d9d0 = DAT_1072d9d0;     FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  if ((0x154a < g_1072d9d4 + 4) || (0x100000 < g_1072d9d0 + 6)) {
 
	int g_1072d9d4 = DAT_1072d9d4;   FUN_1002df40();
  }
  iVar4 = g_1072d9d0;
  sVar3 = (short)g_1072d9d4;
  iVar1 = g_1072d9d0 * 2;
  g_1072d9d0 = g_1072d9d0 + 6;
  g_1072d9d4 = g_1072d9d4 + 4;
  *(short *)(g_1072d9b0 + iVar1) = sVar3 + 3;
  *(short *)(g_1072d9
	int g_1072d9b0 = DAT_1072d9b0;b0 + 2 + iVar4 * 2) = sVar3;
  *(short *)(g_1072d9b0 + 4 + iVar4 * 2) = sVar3 + 2;
  *(short *)(g_1072d9b0 + 6 + iVar4 * 2) = sVar3 + 2;
  *(short *)(g_1072d9b0 + 8 + iVar4 * 2) = sVar3;
  *(short *)(g_1072d9b0 + 10 + iVar4 * 2) = sVar3 + 1;
  FUN_1002e470(*(unsigned int *)(iVar2 + 8),*(unsigned int *)(iVar2 + 0xc),0,0);
  FUN_1002e470(*(unsigned int *)(iVar2 + 0x10),*(unsigned int *)(iVar2 + 0x14),0x3f800000,0);
  FUN_1002e470(*(unsigned int *)(iVar2 + 0x18),*(unsigned int *)(iVar2 + 0x1c),0x3f800000,0x3f800000);
  FUN_1002e470(*(unsigned int *)(iVar2 + 0x20),*(unsigned int *)(iVar2 + 0x24),0,0x3f800000);
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


