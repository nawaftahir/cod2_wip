// 10042ae0 size=97 FUN_10042ae0

void FUN_10042ae0(int param_1,undefined4 *param_2,int *param_3,int param_4,int param_5)

{
  uint uVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  undefined1 *puVar5;
  
  uVar1 = *(uint *)(param_1 + 0x24);
  iVar2 = *(int *)(param_1 + 0x2c);
  if (-1 < param_5 + -1) {
    param_4 = param_4 << 2;
    param_1 = param_5;
    do {
      iVar3 = *(int *)(*param_3 + param_4);
      puVar5 = (undefined1 *)*param_2;
      param_2 = param_2 + 1;
      param_4 = param_4 + 4;
      uVar4 = 0;
      if (uVar1 != 0) {
        do {
          *(undefined1 *)(uVar4 + iVar3) = *puVar5;
          puVar5 = puVar5 + iVar2;
          uVar4 = uVar4 + 1;
        } while (uVar4 < uVar1);
      }
      param_1 = param_1 + -1;
    } while (param_1 != 0);
  }
  return;
}


