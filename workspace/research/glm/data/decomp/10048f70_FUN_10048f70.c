// 10048f70 size=160 FUN_10048f70

void FUN_10048f70(int param_1,int param_2,undefined4 *param_3,int param_4)

{
  int iVar1;
  byte *pbVar2;
  undefined1 *puVar3;
  uint uVar4;
  int iVar5;
  
  iVar1 = *(int *)(param_2 + 0x1c);
  FUN_10048cd0(param_3,*(undefined4 *)(param_1 + 0xe4),*(undefined4 *)(param_1 + 0x24),iVar1 * 0x10)
  ;
  param_1 = 0;
  if (0 < *(int *)(param_2 + 0xc)) {
    param_4 = param_4 - (int)param_3;
    do {
      puVar3 = *(undefined1 **)(param_4 + (int)param_3);
      pbVar2 = (byte *)*param_3;
      uVar4 = 0;
      for (iVar5 = iVar1 << 3; iVar5 != 0; iVar5 = iVar5 + -1) {
        *puVar3 = (char)((int)((uint)*pbVar2 + pbVar2[1] + uVar4) >> 1);
        puVar3 = puVar3 + 1;
        uVar4 = uVar4 ^ 1;
        pbVar2 = pbVar2 + 2;
      }
      param_1 = param_1 + 1;
      param_3 = param_3 + 1;
    } while (param_1 < *(int *)(param_2 + 0xc));
  }
  return;
}


