// 10089d4b size=106 FUN_10089d4b

undefined4 FUN_10089d4b(int param_1,int param_2,uint param_3,uint param_4)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  int in_ECX;
  int iVar5;
  
  iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
  uVar2 = *(uint *)(iVar1 + 0x48);
  if (uVar2 == 0xffffffff) {
LAB_10089da9:
    uVar4 = 1;
  }
  else {
    if ((param_3 <= uVar2) && (uVar2 < param_4)) {
      iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(param_2 + 0x10) * 4);
      iVar5 = *(int *)(iVar3 + 0x18);
      iVar3 = *(int *)(iVar3 + 0x14);
      if (iVar3 != -1) {
        do {
          if (iVar3 == *(int *)(iVar1 + 0x14)) break;
          iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
          iVar5 = *(int *)(iVar3 + 0x18);
          iVar3 = *(int *)(iVar3 + 0x14);
        } while (iVar3 != -1);
      }
      if ((iVar3 == *(int *)(iVar1 + 0x14)) && (iVar5 == *(int *)(iVar1 + 0x18))) goto LAB_10089da9;
    }
    uVar4 = 0;
  }
  return uVar4;
}


