// 100afce9 size=337 FUN_100afce9

int FUN_100afce9(void)

{
  undefined4 uVar1;
  int *piVar2;
  int iVar3;
  int *in_ECX;
  uint uVar4;
  undefined1 local_18 [4];
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  uVar1 = *(undefined4 *)(in_ECX[5] + *(int *)((uint *)in_ECX[0x40])[4] * 4);
  uVar4 = *(uint *)in_ECX[0x40] & 0xfffff;
  if ((in_ECX[0x32] & 0xffffU) == 0x104) {
    iVar3 = FUN_100c98b1(0x40);
    if (iVar3 < 0) {
      return iVar3;
    }
    iVar3 = (**(code **)(*in_ECX + 0x6c))(uVar1,&local_8,0,&local_c);
    if (iVar3 < 0) {
      return iVar3;
    }
    iVar3 = (**(code **)(*in_ECX + 0x70))
                      (*(undefined4 *)(in_ECX[0x40] + 0x10),uVar4,&local_10,local_c);
    if (iVar3 < 0) {
      return iVar3;
    }
    iVar3 = (**(code **)(*in_ECX + 100))(local_8,0x70000,0);
    if (iVar3 < 0) {
      return iVar3;
    }
    piVar2 = *(int **)(in_ECX[0x40] + 8);
    iVar3 = (**(code **)(*in_ECX + 0x74))
                      (*(undefined4 *)(in_ECX[5] + *piVar2 * 4),&local_8,&local_14);
    if (iVar3 < 0) {
      return iVar3;
    }
    iVar3 = (**(code **)(*in_ECX + 0x78))(piVar2,uVar4,local_10,local_18);
    if (iVar3 < 0) {
      return iVar3;
    }
    iVar3 = (**(code **)(*in_ECX + 0x68))(local_8,0xe40000,local_14);
  }
  else {
    iVar3 = FUN_100c98b1(0x40);
    if (iVar3 < 0) {
      return iVar3;
    }
    iVar3 = (**(code **)(*in_ECX + 0x6c))(uVar1,&local_8,0,&local_c);
    if (iVar3 < 0) {
      return iVar3;
    }
    iVar3 = (**(code **)(*in_ECX + 0x70))
                      (*(undefined4 *)(in_ECX[0x40] + 0x10),uVar4,&local_10,local_c);
    if (iVar3 < 0) {
      return iVar3;
    }
    iVar3 = (**(code **)(*in_ECX + 100))(local_8,0xf0000,0);
  }
  if (((-1 < iVar3) && (iVar3 = (**(code **)(*in_ECX + 0x60))(), -1 < iVar3)) &&
     (iVar3 = FUN_100c4cc4(), -1 < iVar3)) {
    iVar3 = 0;
  }
  return iVar3;
}


