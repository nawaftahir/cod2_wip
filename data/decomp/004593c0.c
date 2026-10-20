
void FUN_004593c0(int param_1,undefined4 *param_2)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  
  puVar4 = (undefined4 *)(DAT_01128d94 * 0x1c + 0x24 + param_1);
  for (iVar1 = 7; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar4 = *param_2;
    param_2 = param_2 + 1;
    puVar4 = puVar4 + 1;
  }
  if ((*(int *)(in_EAX + 0x44) != 0) && (iVar1 = 0, 0 < *(int *)(in_EAX + 0x38))) {
    iVar3 = 0;
    do {
      puVar4 = (undefined4 *)(DAT_01128d94 * 0x1c + 0x24 + param_1);
      puVar5 = (undefined4 *)((DAT_01128d94 + iVar3) * 0x1c + 0x24 + *(int *)(in_EAX + 0x3c));
      for (iVar2 = 7; iVar2 != 0; iVar2 = iVar2 + -1) {
        *puVar5 = *puVar4;
        puVar4 = puVar4 + 1;
        puVar5 = puVar5 + 1;
      }
      iVar1 = iVar1 + 1;
      iVar3 = iVar3 + 6;
    } while (iVar1 < *(int *)(in_EAX + 0x38));
  }
  *(short *)(in_EAX + 0x42) = *(short *)(in_EAX + 0x42) + 1;
  return;
}

