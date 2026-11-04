
void __thiscall FUN_004bbd20(int *param_1,undefined4 *param_2,undefined4 *param_3)

{
  int iVar1;
  char *pcVar2;
  uint uVar3;
  uint uVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  
  uVar4 = param_3[1];
  puVar5 = (undefined4 *)*param_3;
  if (param_1[3] != 0) {
    FUN_004bbb40();
  }
  FUN_004bf2e0(param_2);
  iVar1 = param_1[1];
  param_1[1] = iVar1 + 5;
  if (param_1[2] < iVar1 + 5) {
    FUN_004bf1c0(iVar1);
  }
  *(undefined1 *)(iVar1 + *param_1) = 0;
  iVar1 = param_1[1];
  param_1[3] = iVar1;
  param_1[1] = uVar4 + iVar1;
  if (param_1[2] < (int)(uVar4 + iVar1)) {
    FUN_004bf1c0(iVar1);
  }
  puVar6 = (undefined4 *)(*param_1 + iVar1);
  for (uVar3 = uVar4 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
    *puVar6 = *puVar5;
    puVar5 = puVar5 + 1;
    puVar6 = puVar6 + 1;
  }
  for (uVar4 = uVar4 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
    *(undefined1 *)puVar6 = *(undefined1 *)puVar5;
    puVar5 = (undefined4 *)((int)puVar5 + 1);
    puVar6 = (undefined4 *)((int)puVar6 + 1);
  }
  FUN_004bbb40();
  if (2 < DAT_00598cdc) {
    if ((int)param_3[1] < 0x6e) {
      pcVar2 = (char *)*param_3;
    }
    else {
      pcVar2 = "<big>";
    }
    _printf("RpcSendBuffer %s = %s\n",*param_2,pcVar2);
  }
  return;
}

