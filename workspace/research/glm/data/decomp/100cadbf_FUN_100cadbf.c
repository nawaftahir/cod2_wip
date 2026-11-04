// 100cadbf size=283 FUN_100cadbf

int FUN_100cadbf(void)

{
  undefined4 uVar1;
  int iVar2;
  int *in_ECX;
  uint uVar3;
  int *piVar4;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  uint local_10;
  int local_c;
  undefined4 local_8;
  
  uVar3 = *(uint *)in_ECX[0x40] & 0xfffff;
  uVar1 = (**(code **)(*in_ECX + 0x5c))(0x12);
  iVar2 = FUN_100c98b1(uVar1);
  if ((((-1 < iVar2) &&
       (iVar2 = (**(code **)(*in_ECX + 0x6c))
                          (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4),&local_8
                           ,&local_1c,&local_18), -1 < iVar2)) &&
      (iVar2 = (**(code **)(*in_ECX + 0x70))
                         (*(undefined4 *)(in_ECX[0x40] + 0x10),uVar3,&local_14,local_18), -1 < iVar2
      )) && (iVar2 = (**(code **)(*in_ECX + 100))(local_8,local_14,local_1c), -1 < iVar2)) {
    local_10 = 0;
    local_c = 0;
    do {
      piVar4 = (int *)(*(int *)(in_ECX[0x40] + 8) + local_c);
      iVar2 = (**(code **)(*in_ECX + 0x74))
                        (*(undefined4 *)(in_ECX[5] + *piVar4 * 4),&local_8,&local_20);
      if (iVar2 < 0) {
        return iVar2;
      }
      iVar2 = (**(code **)(*in_ECX + 0x78))(piVar4,uVar3,local_14,&local_24);
      if (iVar2 < 0) {
        return iVar2;
      }
      iVar2 = (**(code **)(*in_ECX + 0x68))(local_8,local_24,local_20);
      if (iVar2 < 0) {
        return iVar2;
      }
      local_10 = local_10 + 1;
      local_c = local_c + uVar3 * 4;
    } while (local_10 < 3);
    iVar2 = (**(code **)(*in_ECX + 0x60))();
    if ((-1 < iVar2) && (iVar2 = FUN_100c4cc4(), -1 < iVar2)) {
      iVar2 = 0;
    }
  }
  return iVar2;
}


