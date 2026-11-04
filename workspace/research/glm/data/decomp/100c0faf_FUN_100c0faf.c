// 100c0faf size=246 FUN_100c0faf

int FUN_100c0faf(void)

{
  int iVar1;
  uint uVar2;
  int *in_ECX;
  int iVar3;
  
  if (*(int *)in_ECX[0x40] != 0x50000002) {
    return 1;
  }
  iVar1 = FUN_10085814(0x74);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10085379();
  }
  if (iVar1 == 0) {
    iVar3 = -0x7ff8fff2;
  }
  else {
    iVar3 = FUN_1008585f(0x70800002,6,1,0);
    if ((-1 < iVar3) && (iVar3 = FUN_100853b0(), -1 < iVar3)) {
      **(undefined4 **)(iVar1 + 0x10) = **(undefined4 **)(in_ECX[0x40] + 0x10);
      uVar2 = 0;
      do {
        *(undefined4 *)(uVar2 + *(int *)(iVar1 + 8)) =
             *(undefined4 *)(uVar2 + *(int *)(in_ECX[0x40] + 8));
        uVar2 = uVar2 + 4;
      } while (uVar2 < 0x10);
      iVar3 = FUN_10086139(in_ECX[0x1e],0,0,0);
      if (iVar3 == -1) {
        return -0x7ff8fff2;
      }
      *(int *)(*(int *)(iVar1 + 8) + 0x10) = iVar3;
      *(int *)(*(int *)(iVar1 + 8) + 0x14) = iVar3;
      iVar1 = (**(code **)(*in_ECX + 0x30))();
      if (iVar1 == 0) {
        iVar3 = FUN_10085abe();
      }
      else {
        iVar3 = 1;
      }
    }
    FUN_1006c418();
  }
  return iVar3;
}


