// 100caf80 size=318 FUN_100caf80

int FUN_100caf80(void)

{
  int *piVar1;
  undefined4 uVar2;
  int iVar3;
  int *in_ECX;
  uint uVar4;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  uint local_14;
  undefined4 local_10;
  uint local_c;
  uint local_8;
  
  uVar4 = *(uint *)in_ECX[0x40] & 0xfffff;
  uVar2 = (**(code **)(*in_ECX + 0x5c))(4);
  iVar3 = FUN_100c98b1(uVar2);
  if ((((-1 < iVar3) &&
       (iVar3 = (**(code **)(*in_ECX + 0x6c))
                          (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4),&local_c
                           ,&local_1c,&local_18), -1 < iVar3)) &&
      (iVar3 = (**(code **)(*in_ECX + 0x70))
                         (*(undefined4 *)(in_ECX[0x40] + 0x10),uVar4,&local_10,local_18), -1 < iVar3
      )) && (iVar3 = (**(code **)(*in_ECX + 100))(local_c,local_10,local_1c), -1 < iVar3)) {
    local_8 = 0;
    do {
      piVar1 = (int *)(((uint *)in_ECX[0x40])[2] + local_8 * uVar4 * 4);
      if ((local_8 == 1) && ((*(uint *)in_ECX[0x40] & 0xfff00000) == 0x70400000)) {
        local_14 = 0x1000000;
      }
      else {
        local_14 = 0;
      }
      iVar3 = (**(code **)(*in_ECX + 0x74))
                        (*(undefined4 *)(in_ECX[5] + *piVar1 * 4),&local_c,&local_20);
      if (iVar3 < 0) {
        return iVar3;
      }
      iVar3 = (**(code **)(*in_ECX + 0x78))(piVar1,uVar4,local_10,&local_24);
      if (iVar3 < 0) {
        return iVar3;
      }
      iVar3 = (**(code **)(*in_ECX + 0x68))(local_14 ^ local_c,local_24,local_20);
      if (iVar3 < 0) {
        return iVar3;
      }
      local_8 = local_8 + 1;
    } while (local_8 < 3);
    iVar3 = (**(code **)(*in_ECX + 0x60))();
    if ((-1 < iVar3) && (iVar3 = FUN_100c4cc4(), -1 < iVar3)) {
      iVar3 = 0;
    }
  }
  return iVar3;
}


