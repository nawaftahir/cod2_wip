// 100872f1 size=258 FUN_100872f1

undefined4 FUN_100872f1(int *param_1,int *param_2,int param_3,int param_4)

{
  int iVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  int iVar4;
  int iVar5;
  uint local_8;
  
  iVar2 = *param_1;
  if ((iVar2 == -1) && (*param_2 == 0)) {
    *param_2 = param_4;
    iVar2 = param_3;
LAB_100873da:
    *param_1 = iVar2;
  }
  else if ((param_3 != -1) || (param_4 != 0)) {
    uVar3 = 0;
    local_8 = 0;
    if (iVar2 != -1) {
      iVar4 = iVar2;
      do {
        iVar4 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x14);
        uVar3 = uVar3 + 1;
      } while (iVar4 != -1);
    }
    if (param_3 != -1) {
      iVar4 = param_3;
      do {
        iVar4 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x14);
        local_8 = local_8 + 1;
      } while (iVar4 != -1);
    }
    iVar4 = *param_2;
    if (local_8 < uVar3) {
      iVar5 = uVar3 - local_8;
      do {
        iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4);
        iVar4 = *(int *)(iVar2 + 0x18);
        iVar2 = *(int *)(iVar2 + 0x14);
        uVar3 = uVar3 - 1;
        iVar5 = iVar5 + -1;
      } while (iVar5 != 0);
    }
    if (uVar3 < local_8) {
      iVar5 = local_8 - uVar3;
      do {
        iVar5 = iVar5 + -1;
        iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + param_3 * 4);
        param_4 = *(int *)(iVar1 + 0x18);
        param_3 = *(int *)(iVar1 + 0x14);
      } while (iVar5 != 0);
    }
    while( true ) {
      if ((iVar4 == param_4) && (iVar2 == param_3)) {
        *param_2 = iVar4;
        goto LAB_100873da;
      }
      if ((iVar2 == -1) || (param_3 == -1)) break;
      iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4);
      iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + param_3 * 4);
      iVar4 = *(int *)(iVar2 + 0x18);
      param_4 = *(int *)(iVar5 + 0x18);
      iVar2 = *(int *)(iVar2 + 0x14);
      param_3 = *(int *)(iVar5 + 0x14);
    }
    *param_2 = 0;
    *param_1 = -1;
  }
  return 0;
}


