// 100af8a6 size=325 FUN_100af8a6

int FUN_100af8a6(uint param_1)

{
  uint *puVar1;
  int *piVar2;
  int *piVar3;
  int iVar4;
  int *in_ECX;
  uint uVar5;
  int *piVar6;
  undefined4 local_c;
  uint local_8;
  
  puVar1 = (uint *)in_ECX[0x40];
  piVar2 = (int *)puVar1[2];
  uVar5 = *puVar1 & 0xfffff;
  piVar6 = (int *)(-(uint)(uVar5 != puVar1[1]) & (uint)(piVar2 + uVar5));
  piVar3 = (int *)(-(uint)(uVar5 * 2 < *(uint *)(in_ECX[0x40] + 4)) & (uint)(piVar2 + uVar5 * 2));
  iVar4 = FUN_100c98b1(param_1);
  if (-1 < iVar4) {
    param_1 = (uint)*(byte *)(*(int *)(in_ECX[5] + *piVar2 * 4) + 0x6d);
    local_8 = param_1 | 0xb0000000;
    iVar4 = (**(code **)(*in_ECX + 100))(local_8,0xf0000,0);
    if (-1 < iVar4) {
      if (piVar6 != (int *)0x0) {
        iVar4 = (**(code **)(*in_ECX + 0x74))
                          (*(undefined4 *)(in_ECX[5] + *piVar6 * 4),&local_8,&param_1);
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = (**(code **)(*in_ECX + 0x78))(piVar6,uVar5,0xf0000,&local_c);
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = (**(code **)(*in_ECX + 0x68))(local_8,local_c,param_1);
        if (iVar4 < 0) {
          return iVar4;
        }
      }
      if (piVar3 != (int *)0x0) {
        iVar4 = (**(code **)(*in_ECX + 0x74))
                          (*(undefined4 *)(in_ECX[5] + *piVar3 * 4),&local_8,&param_1);
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = (**(code **)(*in_ECX + 0x78))(piVar3,uVar5,0xf0000,&local_c);
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = (**(code **)(*in_ECX + 0x68))(local_8,local_c,param_1);
        if (iVar4 < 0) {
          return iVar4;
        }
      }
      iVar4 = (**(code **)(*in_ECX + 0x60))();
      if ((-1 < iVar4) && (iVar4 = FUN_100c4cc4(), -1 < iVar4)) {
        iVar4 = 0;
      }
    }
  }
  return iVar4;
}


