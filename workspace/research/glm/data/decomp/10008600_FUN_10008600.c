// 10008600 size=335 FUN_10008600

int FUN_10008600(int param_1,undefined4 param_2,float *param_3,undefined4 *param_4)

{
  byte bVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  float afStack_18 [4];
  undefined4 uStack_8;
  undefined4 uStack_4;
  
  iVar3 = *(int *)(param_1 + 8);
  while( true ) {
    if (iVar3 != -2) {
      if (-1 < *(int *)(param_1 + 8)) {
        FUN_10008570(*(int *)(param_1 + 8) * 0x3c + *(int *)(DAT_101d1b9c + 0x100));
      }
      return *(int *)(param_1 + 8);
    }
    iVar3 = FUN_1005da30(param_3,param_4,*(undefined4 *)(param_1 + 0xc));
    if (iVar3 == 3) break;
    param_1 = *(int *)(param_1 + 0xc + iVar3 * 4);
    iVar3 = *(int *)(param_1 + 8);
  }
  if (*(byte *)(*(int *)(param_1 + 0xc) + 0x10) < 3) {
    afStack_18[0] = *param_3;
    afStack_18[1] = param_3[1];
    afStack_18[2] = param_3[2];
    uVar2 = *param_4;
    afStack_18[*(byte *)(*(int *)(param_1 + 0xc) + 0x10)] =
         *(float *)(*(int *)(param_1 + 0xc) + 0xc);
    uStack_8 = param_4[1];
    uStack_4 = param_4[2];
    afStack_18[3] = (float)uVar2;
    afStack_18[*(byte *)(*(int *)(param_1 + 0xc) + 0x10) + 3] =
         *(float *)(*(int *)(param_1 + 0xc) + 0xc);
    iVar3 = FUN_10008600(*(undefined4 *)(param_1 + 0x14),param_2,param_3,afStack_18 + 3);
    bVar1 = *(byte *)(*(int *)(param_1 + 0xc) + 0x10);
    if ((float)param_4[bVar1] <= afStack_18[bVar1]) {
      return iVar3;
    }
    iVar4 = FUN_10008600(*(undefined4 *)(param_1 + 0x10),param_2,afStack_18,param_4);
  }
  else {
    iVar4 = FUN_10008600(*(undefined4 *)(param_1 + 0x10),param_2,param_3,param_4);
    iVar3 = FUN_10008600(*(undefined4 *)(param_1 + 0x14),param_2,param_3,param_4);
  }
  if (iVar4 == iVar3) {
    return iVar4;
  }
  return -2;
}


