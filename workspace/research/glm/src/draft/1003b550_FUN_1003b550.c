extern unsigned int DAT_101d1b3c;
extern unsigned int DAT_101d481c;
extern unsigned int DAT_1072d9bc;
extern unsigned int DAT_1072d9c0;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_1072ddb0;
extern unsigned int DAT_1072de30;
extern unsigned int DAT_1072de34;
extern unsigned int DAT_1072dee0;
extern unsigned int DAT_1072ebb0;
extern unsigned int DAT_10730550;
extern int FUN_1003a5f0();
extern int FUN_1003a8d0();
extern int FUN_1003b0c0();
extern int FUN_1003b4b0();
extern int FUN_1003e4b0();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003b550(int param_1)

{
  int iVar1;
  int *piVar2;
  float fVar3;
  unsigned int uVar4;
  int iVar5;
  unsigned int *puVar6;
  unsigned int *puVar7;
  unsigned int local_8;
  unsigned int uStack_4;
  
  uVar4 = DAT_1072ddb0 & 0x80000001;
  if ((int)uVar4 < 0) {
    uVar4 = (uVar4 - 1 | 0xfffffffe) + 1;
  }
  iVar1 = uVar4 + g_1072de30 * 2;
 
	int g_1072de30 = DAT_1072de30; if (*(int *)(param_1 + 0x24 + iVar1 * 4) == 0) {
    FUN_1003b4b0();
    return;
  }
  if ((g_1072d9d0 != 0) || (g_1072d9e0 != 0)) {
   
	int g_1072d9e0 = DAT_1072d9e0; F
	int g_1072d9d0 = DAT_1072d9d0;UN_1003a8d0();
  }
  if ((DAT_1072d9bc != DAT_101d1b3c) || (DAT_1072d9c0 != 3)) {
    if ((g_1072d9d0 != 0) || (g_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  puVar6 = (unsigned int *)(&DAT_1072dee0 + g_10730550 * 0xcd0);
 
	int g_10730550 = DAT_10730550; puVar7 = (unsigned int *)(&DAT_1072ebb0 + g_10730550 * 0xcd0);
  for (iVar5 = 0x334; iVar5 != 0; iVar5 = iVar5 + -1) {
    *puVar7 = *puVar6;
    puVar6 = puVar6 + 1;
    puVar7 = puVar7 + 1;
  }
  g_10730550 = g_10730550 + 1;
  FUN_1003b0c0(16.0 / (float)_DAT_1072de38,16.0 / (float)_DAT_1072de3c,0xff000000);
  if (*(char *)(iVar1 + 0x2c + param_1) == '\0') {
    fVar3 = 0.0;
  }
  else {
    local_8 = 0;
    piVar2 = *(int **)(param_1 + 0x24 + iVar1 * 4);
    iVar5 = (**(void **)(*piVar2 + 0x1c))(piVar2,&local_8,4,1);
    while (iVar5 == 1) {
      Sleep(0);
      piVar2 = *(int **)(param_1 + 0x24 + iVar1 * 4);
      iVar5 = (**(void **)(*piVar2 + 0x1c))(piVar2,&local_8,4,1);
    }
    if (iVar5 != 0) {
      *(unsigned char *)(param_1 + 0x10) = 1;
    }
    uVar4 = g_101d481c;
    if (g_101d481c 
	int g_101d481c = DAT_101d481c;< local_8) {
      *(unsigned char *)(param_1 + 0x10) = 1;
    }
    fVar3 = (float)(int)local_8;
    if ((int)local_8 < 0) {
      fVar3 = fVar3 + 4.2949673e+09;
    }
    fVar3 = fVar3 / (float)(int)uVar4;
    uStack_4 = local_8;
  }
  if (g_1072de30 == 0) {
    *(unsigned int *)(param_1 + 0x14) = 0;
  }
  fVar3 = fVar3 + *(float *)(param_1 + 0x14);
  *(float *)(param_1 + 0x14) = fVar3;
  if (g_1072de30 == DAT_1072de34 + -1) {
    if (1.0 < fVar3) {
      *(unsigned int *)(param_1 + 0x14) = 0x3f800000;
    }
    if (*(char *)(param_1 + 0x10) == '\0') {
      *(unsigned int *)(param_1 + 0x18) = *(unsigned int *)(param_1 + 0x14);
    }
    *(unsigned char *)(param_1 + 0x10) = 0;
  }
  piVar2 = *(int **)(param_1 + 0x24 + iVar1 * 4);
  (**(void **)(*piVar2 + 0x18))(piVar2,2);
  FUN_1003a8d0();
  piVar2 = *(int **)(param_1 + 0x24 + iVar1 * 4);
  (**(void **)(*piVar2 + 0x18))(piVar2,1);
  *(unsigned char *)(iVar1 + 0x2c + param_1) = 1;
  FUN_1003e4b0();
  return;
}


