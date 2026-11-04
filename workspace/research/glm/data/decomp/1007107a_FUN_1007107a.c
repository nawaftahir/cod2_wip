// 1007107a size=270 FUN_1007107a

int FUN_1007107a(int param_1,int *param_2,uint param_3)

{
  int iVar1;
  bool bVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  int *piVar5;
  uint uVar6;
  uint local_8;
  
  bVar2 = true;
  if (param_3 != 0) {
    local_8 = param_3;
    piVar5 = param_2;
    do {
      iVar4 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar5 * 4);
      iVar3 = *(int *)(iVar4 + 0x34);
      while ((iVar3 != -1 && (*(int *)(iVar4 + 8) == -1))) {
        iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *(int *)(iVar4 + 0x34) * 4);
        if (*(int *)(iVar1 + 0x60) == 0) {
          *(undefined4 *)(iVar1 + 0x60) = *(undefined4 *)(iVar4 + 0x60);
          *(undefined4 *)(iVar1 + 100) = *(undefined4 *)(iVar4 + 100);
        }
        *piVar5 = *(int *)(iVar4 + 0x34);
        iVar3 = *(int *)(iVar1 + 0x34);
        iVar4 = iVar1;
      }
      if (((*(byte *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) + *(int *)(iVar4 + 4) * 4) + 5)
           & 1) == 0) || (*(int *)(iVar4 + 8) != -1)) {
        bVar2 = false;
      }
      piVar5 = piVar5 + 1;
      local_8 = local_8 - 1;
    } while (local_8 != 0);
  }
  uVar6 = 0;
  if ((param_1 != 0) && (bVar2)) {
    if (param_3 != 0) {
      do {
        iVar4 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + param_2[uVar6] * 4);
        iVar3 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,
                             *(undefined8 *)(iVar4 + 0x20));
        param_2[uVar6] = iVar3;
        if (iVar3 == -1) {
          return -0x7ff8fff2;
        }
        iVar3 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iVar3 * 4);
        *(undefined4 *)(iVar3 + 0x60) = *(undefined4 *)(iVar4 + 0x60);
        uVar6 = uVar6 + 1;
        *(undefined4 *)(iVar3 + 100) = *(undefined4 *)(iVar4 + 100);
      } while (uVar6 < param_3);
    }
    iVar4 = FUN_10070fa6(param_1,param_2,*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),1,1,0,0);
    if (iVar4 < 0) {
      return iVar4;
    }
  }
  return 0;
}


