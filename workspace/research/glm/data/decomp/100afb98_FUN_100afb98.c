// 100afb98 size=337 FUN_100afb98

int FUN_100afb98(void)

{
  int *piVar1;
  int iVar2;
  int *in_ECX;
  uint uVar3;
  undefined4 local_14;
  undefined4 local_10;
  uint local_c;
  undefined4 local_8;
  
  uVar3 = *(uint *)in_ECX[0x40] & 0xfffff;
  local_c = uVar3;
  if ((in_ECX[0x32] & 0xffffU) == 0x104) {
    iVar2 = FUN_100c98b1(0x42);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x6c))
                      (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4),&local_8,0,0
                      );
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 100))(local_8,0xf0000,0);
    if (iVar2 < 0) {
      return iVar2;
    }
    piVar1 = (int *)(*(int *)(in_ECX[0x40] + 8) + uVar3 * 4);
    iVar2 = (**(code **)(*in_ECX + 0x74))
                      (*(undefined4 *)(in_ECX[5] + *piVar1 * 4),&local_8,&local_10);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x78))(piVar1,local_c,0xf0000,&local_14);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x68))(local_8,local_14,local_10);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x60))();
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = FUN_100c4cc4();
  }
  else {
    iVar2 = FUN_100c98b1(0x42);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x6c))
                      (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4),&local_8,0,0
                      );
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 100))(local_8,0xf0000,0);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = (**(code **)(*in_ECX + 0x60))();
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar2 = FUN_100c4cc4();
  }
  if (-1 < iVar2) {
    iVar2 = 0;
  }
  return iVar2;
}


