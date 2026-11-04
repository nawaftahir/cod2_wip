// 10026840 size=100 FUN_10026840

void FUN_10026840(undefined4 param_1,undefined4 param_2,undefined4 param_3,int param_4)

{
  undefined1 uVar1;
  uint uVar2;
  ushort uVar3;
  int iVar4;
  int iVar5;
  
  uVar2 = (uint)DAT_101d4928;
  iVar5 = 0;
  uVar3 = DAT_101d4928;
  if (uVar2 != 0) {
    do {
      iVar4 = 0;
      if (uVar2 != 0) {
        do {
          uVar1 = FUN_100265e0(iVar4,iVar5,param_2,param_3);
          *(undefined1 *)(param_4 + (uVar2 * iVar5 + iVar4) * 4 + 0x15) = uVar1;
          uVar2 = (uint)DAT_101d4928;
          iVar4 = iVar4 + 1;
          uVar3 = DAT_101d4928;
        } while (iVar4 < (int)uVar2);
      }
      uVar2 = (uint)uVar3;
      iVar5 = iVar5 + 1;
    } while (iVar5 < (int)uVar2);
  }
  return;
}


