// 1000c9d0 size=149 FUN_1000c9d0

void FUN_1000c9d0(int param_1,byte param_2)

{
  int *piVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  uint uVar5;
  
  iVar4 = 0;
  do {
    iVar2 = DAT_101d4c6c;
    if (iVar4 == 1) {
      iVar2 = 0x280;
    }
    uVar3 = iVar2 >> (param_2 & 0x1f);
    uVar5 = 1;
    if ((int)(1 - uVar3) < 0) {
      uVar5 = uVar3;
    }
    iVar2 = FUN_1000f020(3,uVar5 & 0xffff);
    piVar1 = (int *)(param_1 + 0x10 + iVar4 * 4);
    *piVar1 = *piVar1 + iVar2;
    if ((1 < *(byte *)(param_1 + 0xc)) && (*(byte *)(param_1 + 0xc) != 4)) {
      (&DAT_101d0a74)[iVar4] = (&DAT_101d0a74)[iVar4] + iVar2;
    }
    iVar4 = iVar4 + 1;
  } while (iVar4 < 2);
  return;
}


