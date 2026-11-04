// 100c2985 size=157 FUN_100c2985

undefined4 FUN_100c2985(int param_1,int param_2,int param_3)

{
  uint uVar1;
  int iVar2;
  undefined4 uVar3;
  int in_ECX;
  int *piVar4;
  int iVar5;
  uint uVar6;
  
  if (param_2 == param_3) {
    uVar3 = 0;
  }
  else if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + param_1 * 4) + 5) & 2) == 0) {
    uVar1 = *(uint *)(in_ECX + 8);
    uVar6 = 0;
    if (uVar1 != 0) {
      piVar4 = *(int **)(in_ECX + 0x14);
      do {
        iVar2 = *piVar4;
        if (((*(int *)(iVar2 + 4) == param_1) && (*(int *)(iVar2 + 0x30) != 0)) &&
           ((*(int *)(iVar2 + 0xc) == param_2 || (*(int *)(iVar2 + 0xc) == param_3)))) {
          return 0x80004005;
        }
        uVar6 = uVar6 + 1;
        piVar4 = piVar4 + 1;
      } while (uVar6 < uVar1);
    }
    uVar6 = 0;
    if (uVar1 != 0) {
      do {
        iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + uVar6 * 4);
        if ((*(int *)(iVar2 + 4) == param_1) &&
           ((iVar5 = param_3, *(int *)(iVar2 + 0xc) == param_2 ||
            (iVar5 = param_2, *(int *)(iVar2 + 0xc) == param_3)))) {
          *(int *)(iVar2 + 0xc) = iVar5;
        }
        uVar6 = uVar6 + 1;
      } while (uVar6 < *(uint *)(in_ECX + 8));
    }
    uVar3 = 0;
  }
  else {
    uVar3 = 0x80004005;
  }
  return uVar3;
}


