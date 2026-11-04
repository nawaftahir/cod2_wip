// 1004bca0 size=120 FUN_1004bca0

void FUN_1004bca0(int param_1,int param_2,int param_3,int *param_4,int param_5)

{
  int iVar1;
  int iVar2;
  undefined1 *puVar3;
  undefined1 *puVar4;
  int iVar5;
  int iVar6;
  
  iVar1 = *(int *)(param_1 + 0x2c);
  iVar2 = *(int *)(param_1 + 100);
  if (-1 < param_5 + -1) {
    param_3 = param_3 << 2;
    param_1 = param_5;
    do {
      iVar5 = 0;
      if (0 < iVar1) {
        do {
          puVar4 = *(undefined1 **)(param_3 + *(int *)(param_2 + iVar5 * 4));
          puVar3 = (undefined1 *)(*param_4 + iVar5);
          for (iVar6 = iVar2; iVar6 != 0; iVar6 = iVar6 + -1) {
            *puVar3 = *puVar4;
            puVar4 = puVar4 + 1;
            puVar3 = puVar3 + iVar1;
          }
          iVar5 = iVar5 + 1;
        } while (iVar5 < iVar1);
      }
      param_4 = param_4 + 1;
      param_3 = param_3 + 4;
      param_1 = param_1 + -1;
    } while (param_1 != 0);
  }
  return;
}


