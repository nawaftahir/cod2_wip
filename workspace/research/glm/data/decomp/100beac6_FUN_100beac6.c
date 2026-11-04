// 100beac6 size=231 FUN_100beac6

int FUN_100beac6(void)

{
  int iVar1;
  int iVar2;
  int in_ECX;
  int iVar3;
  
  iVar3 = 1;
  if (((((**(uint **)(in_ECX + 0x100) & 0xfffff) == 1) &&
       (iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)((*(uint **)(in_ECX + 0x100))[2] + 4) * 4
                        ),
       (*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + 4) * 4) + 5) & 1) != 0)) &&
      (*(int *)(iVar2 + 8) == -1)) && (*(double *)(iVar2 + 0x20) == 0.0)) {
    iVar2 = FUN_10086139(0,0,0,0);
    if (iVar2 == -1) {
      iVar3 = -0x7ff8fff2;
    }
    else {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4);
      iVar3 = FUN_10085c65();
      if ((-1 < iVar3) && (iVar3 = FUN_10085d21(), -1 < iVar3)) {
        *(uint *)(iVar1 + 0x3c) = *(uint *)(iVar1 + 0x3c) ^ 0x80000;
        if (*(int *)(iVar1 + 0x38) == -1) {
          *(undefined4 *)(iVar1 + 0x38) = **(undefined4 **)(*(int *)(in_ECX + 0x100) + 8);
        }
        *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + 4) = iVar2;
        iVar3 = 0;
      }
    }
  }
  return iVar3;
}


