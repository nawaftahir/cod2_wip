// 100c1d8b size=103 FUN_100c1d8b

undefined4 FUN_100c1d8b(int param_1,int param_2,int *param_3)

{
  int iVar1;
  int in_ECX;
  int iVar2;
  int *piVar3;
  uint uVar4;
  
  if (*(int *)(param_1 + 0xc) != 0) {
    iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(param_1 + 0x10) * 4);
    iVar2 = *(int *)(iVar1 + 0x14);
    if (iVar2 != -1) {
      do {
        uVar4 = 0;
        piVar3 = param_3;
        do {
          if ((iVar2 == *(int *)((param_2 - (int)param_3) + (int)piVar3)) &&
             (*(int *)(iVar1 + 0x18) == *piVar3)) {
            return 1;
          }
          uVar4 = uVar4 + 1;
          piVar3 = piVar3 + 1;
        } while (uVar4 < 4);
        iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4);
        iVar2 = *(int *)(iVar1 + 0x14);
      } while (iVar2 != -1);
    }
  }
  return 0;
}


