// 100ca63f size=521 FUN_100ca63f

int FUN_100ca63f(void)

{
  uint uVar1;
  int *in_ECX;
  int iVar2;
  uint uVar3;
  undefined4 local_18;
  undefined4 local_14;
  uint local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  iVar2 = 0;
  if (in_ECX[0xd] == 0) {
    return -0x7fffbfff;
  }
  uVar1 = *(uint *)in_ECX[0x40] & 0xfff00000;
  uVar3 = *(uint *)in_ECX[0x40] & 0xfffff;
  if (uVar1 != 0x10f00000) {
    if (uVar1 == 0x73500000) {
      iVar2 = 3;
      goto LAB_100ca6a6;
    }
    if (uVar1 == 0x73600000) {
      iVar2 = 4;
      goto LAB_100ca6a6;
    }
    if (uVar1 != 0x73700000) {
      if (uVar1 == 0x73800000) {
        iVar2 = 2;
      }
      goto LAB_100ca6a6;
    }
  }
  iVar2 = 5;
LAB_100ca6a6:
  iVar2 = FUN_100c98b1(iVar2 << 0x10 | 0x5e);
  if (iVar2 < 0) {
    return iVar2;
  }
  iVar2 = (**(code **)(*in_ECX + 0x6c))
                    (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4),&local_8,0,
                     &local_18);
  if (iVar2 < 0) {
    return iVar2;
  }
  iVar2 = (**(code **)(*in_ECX + 0x70))
                    (*(undefined4 *)(in_ECX[0x40] + 0x10),*(undefined4 *)(in_ECX[0x40] + 0xc),
                     &local_14,local_18);
  if (iVar2 < 0) {
    return iVar2;
  }
  iVar2 = (**(code **)(*in_ECX + 100))(local_8,local_14,0);
  if (iVar2 < 0) {
    return iVar2;
  }
  if ((*(uint *)in_ECX[0x40] & 0xfff00000) == 0x10f00000) {
    iVar2 = (**(code **)(*in_ECX + 0x74))();
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x78))
                      (*(undefined4 *)(in_ECX[0x40] + 8),*(undefined4 *)(in_ECX[0x40] + 0xc),
                       local_14,&local_10);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x68))(local_8,local_10,local_c);
    if (iVar2 < 0) {
      return iVar2;
    }
    local_10 = local_10 ^ 0x1000000;
  }
  else {
    iVar2 = (**(code **)(*in_ECX + 0x74))
                      (*(undefined4 *)(in_ECX[5] + *(int *)((uint *)in_ECX[0x40])[2] * 4),&local_8,
                       &local_c);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x78))
                      (*(undefined4 *)(in_ECX[0x40] + 8),uVar3,local_14,&local_10);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x68))(local_8,local_10,local_c);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x74))
                      (*(undefined4 *)
                        (in_ECX[5] + *(int *)(uVar3 * 4 + *(int *)(in_ECX[0x40] + 8)) * 4),&local_8,
                       &local_c);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x78))
                      (*(int *)(in_ECX[0x40] + 8) + uVar3 * 4,uVar3,local_14,&local_10);
    if (iVar2 < 0) {
      return iVar2;
    }
  }
  iVar2 = (**(code **)(*in_ECX + 0x68))(local_8,local_10,local_c);
  if (((-1 < iVar2) && (iVar2 = (**(code **)(*in_ECX + 0x60))(), -1 < iVar2)) &&
     (iVar2 = FUN_100c4cc4(), -1 < iVar2)) {
    iVar2 = 0;
  }
  return iVar2;
}


