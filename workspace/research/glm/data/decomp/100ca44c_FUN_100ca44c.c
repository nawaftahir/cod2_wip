// 100ca44c size=341 FUN_100ca44c

int FUN_100ca44c(void)

{
  int iVar1;
  uint uVar2;
  int *in_ECX;
  int *piVar3;
  uint uVar4;
  uint uVar5;
  undefined4 local_10;
  uint local_c;
  uint local_8;
  
  iVar1 = in_ECX[0x40];
  if ((*(byte *)((int)in_ECX + 0x6e) & 0x40) == 0) {
    if (*(int *)(iVar1 + 4) != 4) goto LAB_100ca58e;
  }
  else {
    uVar4 = 0;
    uVar2 = 0;
    if (*(int *)(iVar1 + 4) != 0) {
      piVar3 = *(int **)(iVar1 + 8);
      do {
        if (*(uint *)(*(int *)(in_ECX[5] + *piVar3 * 4) + 0x10) != uVar4) goto LAB_100ca58e;
        uVar2 = *(uint *)(iVar1 + 4);
        uVar4 = uVar4 + 1;
        piVar3 = piVar3 + 1;
      } while (uVar4 < uVar2);
    }
    if (uVar2 != 3) goto LAB_100ca58e;
  }
  iVar1 = *(int *)(in_ECX[5] + **(int **)(iVar1 + 8) * 4);
  if (*(int *)(iVar1 + 4) == in_ECX[0x20]) {
    iVar1 = (**(code **)(*in_ECX + 0x88))(iVar1,&local_c,&local_8);
    if (-1 < iVar1) {
LAB_100ca50f:
      uVar5 = local_8 | 0xfffffff8;
      uVar4 = local_8 & 0x18;
      uVar2 = local_c & 0x7ff;
      iVar1 = FUN_100c98b1(0x41);
      if (iVar1 < 0) {
        return iVar1;
      }
      iVar1 = (**(code **)(*in_ECX + 0x7c))
                        (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4),&local_10)
      ;
      if (iVar1 < 0) {
        return iVar1;
      }
      iVar1 = (**(code **)(*in_ECX + 100))((uVar5 << 0x14 | uVar4) << 8 | uVar2,0xf0000,local_10);
      if (iVar1 < 0) {
        return iVar1;
      }
      iVar1 = (**(code **)(*in_ECX + 0x60))();
      if (iVar1 < 0) {
        return iVar1;
      }
      iVar1 = FUN_100c4cc4();
      if (iVar1 < 0) {
        return iVar1;
      }
      return 0;
    }
  }
  else if (*(int *)(iVar1 + 4) == in_ECX[0x22]) {
    local_8 = 0;
    local_c = *(uint *)(iVar1 + 0xc);
    goto LAB_100ca50f;
  }
LAB_100ca58e:
  FUN_1008b0b5();
  return -0x7fffbffb;
}


