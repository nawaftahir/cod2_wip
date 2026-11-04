// 100caa17 size=347 FUN_100caa17

int FUN_100caa17(void)

{
  uint uVar1;
  int *in_ECX;
  int iVar2;
  uint uVar3;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  uVar1 = *(uint *)in_ECX[0x40] & 0xfff00000;
  iVar2 = 0;
  uVar3 = *(uint *)in_ECX[0x40] & 0xfffff;
  if (uVar1 != 0x73000000) {
    if (uVar1 == 0x73900000) {
      iVar2 = 3;
      goto LAB_100caa6d;
    }
    if (uVar1 == 0x73a00000) {
      iVar2 = 4;
      goto LAB_100caa6d;
    }
    if (uVar1 == 0x73b00000) {
      iVar2 = 5;
      goto LAB_100caa6d;
    }
    if (uVar1 != 0x73c00000) goto LAB_100caa6d;
  }
  iVar2 = 2;
LAB_100caa6d:
  iVar2 = FUN_100c98b1(iVar2 << 0x10 | 0x29);
  if ((((-1 < iVar2) &&
       (iVar2 = (**(code **)(*in_ECX + 0x74))
                          (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 8) * 4),&local_10,
                           &local_8), -1 < iVar2)) &&
      (iVar2 = (**(code **)(*in_ECX + 0x78))
                         (*(undefined4 *)(in_ECX[0x40] + 8),uVar3,0xf0000,&local_c), -1 < iVar2)) &&
     (iVar2 = (**(code **)(*in_ECX + 0x68))(local_10,local_c,local_8), -1 < iVar2)) {
    iVar2 = (**(code **)(*in_ECX + 0x74))
                      (*(undefined4 *)
                        (in_ECX[5] + *(int *)(uVar3 * 4 + *(int *)(in_ECX[0x40] + 8)) * 4),&local_10
                       ,&local_8);
    if (((-1 < iVar2) &&
        (iVar2 = (**(code **)(*in_ECX + 0x78))
                           (*(int *)(in_ECX[0x40] + 8) + uVar3 * 4,uVar3,0xf0000,&local_c),
        -1 < iVar2)) &&
       ((iVar2 = (**(code **)(*in_ECX + 0x68))(local_10,local_c,local_8), -1 < iVar2 &&
        ((iVar2 = (**(code **)(*in_ECX + 0x60))(), -1 < iVar2 &&
         (iVar2 = FUN_100c4cc4(), -1 < iVar2)))))) {
      iVar2 = 0;
    }
  }
  return iVar2;
}


