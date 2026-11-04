// 1009aae8 size=151 FUN_1009aae8

int FUN_1009aae8(void)

{
  int iVar1;
  int in_ECX;
  int *piVar2;
  
  iVar1 = *(int *)(in_ECX + 0x10);
  if (iVar1 == 0) {
    FUN_10099580();
    return -0x7fffbffb;
  }
  if (((*(int *)(iVar1 + 0x10) == 4) && (*(int *)(iVar1 + 0x20) != 0)) &&
     (*(int *)(*(int *)(iVar1 + 0x20) + 0x10) != 4)) {
    for (piVar2 = (int *)(iVar1 + 0x18); *piVar2 != 0; piVar2 = (int *)(*piVar2 + 0xc)) {
      *(undefined4 *)(*(int *)(*piVar2 + 8) + 0x2c) = 1;
      iVar1 = FUN_100996af(*(undefined4 *)(*(int *)(in_ECX + 0x10) + 0x20),
                           *(undefined4 *)(*piVar2 + 8));
      if (iVar1 < 0) {
        return iVar1;
      }
    }
    *piVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 0x10) + 0x20) + 0x18);
    *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x10) + 0x20) + 0x18) =
         *(undefined4 *)(*(int *)(in_ECX + 0x10) + 0x18);
    *(undefined4 *)(*(int *)(in_ECX + 0x10) + 0x18) = 0;
  }
  iVar1 = *(int *)(in_ECX + 0x10);
  *(undefined4 *)(in_ECX + 0x10) = *(undefined4 *)(iVar1 + 0x20);
  *(undefined4 *)(iVar1 + 0x20) = 0;
  return 0;
}


