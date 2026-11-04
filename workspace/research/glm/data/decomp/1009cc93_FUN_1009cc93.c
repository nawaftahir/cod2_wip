// 1009cc93 size=120 FUN_1009cc93

int FUN_1009cc93(int param_1)

{
  int iVar1;
  int iVar2;
  int in_ECX;
  
  iVar1 = FUN_1006506e(0x14);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10082872(0,*(undefined4 *)(in_ECX + 0x14),"UsageType");
  }
  if (iVar1 == 0) {
LAB_1009cce5:
    FUN_100995d8(0);
    iVar1 = -0x7ff8fff2;
  }
  else {
    *(int *)(in_ECX + 0x14) = iVar1;
    if (param_1 != 0) {
      iVar2 = FUN_10082816(param_1);
      *(int *)(iVar1 + 8) = iVar2;
      if (iVar2 == 0) goto LAB_1009cce5;
      iVar1 = FUN_1009b5b3(iVar2,*(undefined4 *)(iVar2 + 0x18));
      if (iVar1 < 0) {
        return iVar1;
      }
      *(byte *)(iVar2 + 0x11) = *(byte *)(iVar2 + 0x11) & 0xf1;
    }
    iVar1 = 0;
  }
  return iVar1;
}


