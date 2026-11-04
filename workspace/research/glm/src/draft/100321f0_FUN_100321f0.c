extern unsigned int DAT_101d4c6c;
extern unsigned int DAT_101d4c70;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_1072ddb4;
extern unsigned int DAT_1072ddb8;
extern unsigned int DAT_1072ddbc;
extern unsigned int DAT_1072ddc4;
extern unsigned int DAT_1072ddc8;
extern unsigned int DAT_1072dde0;
extern unsigned int DAT_1072dde4;
extern unsigned int DAT_1072dde8;
extern unsigned int DAT_1072ddec;
extern unsigned int DAT_1072ddf0;
extern unsigned int DAT_1072de30;
extern unsigned int DAT_1072de34;
extern unsigned int DAT_10766724;
extern int FUN_1002e380();
extern int FUN_10032120();
extern int FUN_1003a8d0();
extern int FUN_1003e690();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_100321f0(int *param_1)

{
  int iVar1;
  unsigned int *puVar2;
  unsigned int *puVar3;
  
  iVar1 = *param_1;
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  _DAT_1072de3c = DAT_101d4c70;
  _DAT_1072de38 = DAT_101d4c6c;
  DAT_1072ddb4 = *(unsigned int *)(iVar1 + 0x2c);
  DAT_1072ddb8 = *(unsigned int *)(iVar1 + 4);
  DAT_1072ddbc = *(unsigned int *)(iVar1 + 8);
  _DAT_1072ddc0 = *(unsigned int *)(iVar1 + 0xc);
  DAT_1072ddc4 = *(unsigned int *)(iVar1 + 0x10);
  g_1072ddc8 = *(int *)(iVar1 + 0x14);
 
	int g_1072ddc8 = DAT_1072ddc8; _DAT_1072ddcc = *(unsigned int *)(iVar1 + 0x18);
  _DAT_1072ddd0 = *(unsigned int *)(iVar1 + 0x1c);
  _DAT_1072ddd4 = *(unsigned int *)(iVar1 + 0x20);
  _DAT_1072ddd8 = *(unsigned int *)(iVar1 + 0x24);
  _DAT_1072dddc = *(unsigned int *)(iVar1 + 0x28);
  DAT_1072dde0 = *(unsigned int *)(g_1072ddc8 + 0x30);
  DAT_1072dde4 = *(unsigned int *)(g_1072ddc8 + 0x34);
  DAT_1072dde8 = *(unsigned int *)(g_1072ddc8 + 0x38);
  DAT_1072ddec = *(unsigned int *)(g_1072ddc8 + 0x3c);
  puVar2 = (unsigned int *)(g_1072ddc8 + 200);
  puVar3 = &DAT_1072ddf0;
  for (iVar1 = 0x10; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = *puVar2;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
  }
  DAT_1072de30 = 0;
  DAT_1072de34 = 1;
  if (DAT_10766724 == 0) {
    FUN_1003e690();
  }
  FUN_10032120();
  FUN_1002e380();
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


