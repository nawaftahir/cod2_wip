// 100cb0be size=434 FUN_100cb0be

int FUN_100cb0be(void)

{
  uint uVar1;
  int iVar2;
  int *in_ECX;
  uint uVar3;
  undefined4 uVar4;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  int local_c;
  undefined4 local_8;
  
  uVar1 = *(uint *)in_ECX[0x40];
  uVar3 = uVar1 & 0xfffff;
  if (uVar1 == 0x70500003) {
    uVar4 = 0x18;
  }
  else if (uVar1 == 0x70600003) {
    uVar4 = 0x17;
  }
  else if (uVar1 == 0x70600004) {
    uVar4 = 0x15;
  }
  else if (uVar1 == 0x70700003) {
    uVar4 = 0x16;
  }
  else {
    uVar4 = local_1c;
    if (uVar1 == 0x70700004) {
      uVar4 = 0x14;
    }
  }
  iVar2 = FUN_100c98b1(uVar4);
  if ((((-1 < iVar2) &&
       (iVar2 = (**(code **)(*in_ECX + 0x6c))
                          (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4),&local_8
                           ,&local_1c,&local_18), -1 < iVar2)) &&
      (iVar2 = (**(code **)(*in_ECX + 0x70))
                         (*(undefined4 *)(in_ECX[0x40] + 0x10),*(undefined4 *)(in_ECX[0x40] + 0xc),
                          &local_c,local_18), -1 < iVar2)) &&
     (iVar2 = (**(code **)(*in_ECX + 100))(local_8,local_c,local_1c), -1 < iVar2)) {
    local_c = ((uVar3 != 3) - 1 & 0xfff80000) + 0xf0000;
    iVar2 = (**(code **)(*in_ECX + 0x74))
                      (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 8) * 4),&local_8,
                       &local_10);
    if (((-1 < iVar2) &&
        (iVar2 = (**(code **)(*in_ECX + 0x78))
                           (*(undefined4 *)(in_ECX[0x40] + 8),uVar3,local_c,&local_14), -1 < iVar2))
       && (iVar2 = (**(code **)(*in_ECX + 0x68))(local_8,local_14,local_10), -1 < iVar2)) {
      iVar2 = (**(code **)(*in_ECX + 0x74))
                        (*(undefined4 *)
                          (in_ECX[5] + *(int *)(uVar3 * 4 + *(int *)(in_ECX[0x40] + 8)) * 4),
                         &local_8,&local_10);
      if (((-1 < iVar2) &&
          (iVar2 = (**(code **)(*in_ECX + 0x78))
                             (*(int *)(in_ECX[0x40] + 8) + uVar3 * 4,uVar3,local_c,&local_14),
          -1 < iVar2)) &&
         ((iVar2 = (**(code **)(*in_ECX + 0x68))(local_8,local_14,local_10), -1 < iVar2 &&
          ((iVar2 = (**(code **)(*in_ECX + 0x60))(), -1 < iVar2 &&
           (iVar2 = FUN_100c4cc4(), -1 < iVar2)))))) {
        iVar2 = 0;
      }
    }
  }
  return iVar2;
}


