// 100bb0a9 size=107 FUN_100bb0a9

void FUN_100bb0a9(uint *param_1,int param_2)

{
  uint uVar1;
  undefined4 uVar2;
  uint *puVar3;
  undefined4 *puVar4;
  int iVar5;
  
  puVar3 = param_1;
  uVar1 = *param_1;
  param_1 = (uint *)(param_1[1] / (uVar1 & 0xfffff));
  if (param_1 != (uint *)0x0) {
    iVar5 = param_2 << 2;
    do {
      puVar4 = (undefined4 *)(puVar3[2] + iVar5);
      uVar2 = *puVar4;
      *puVar4 = puVar4[1];
      *(undefined4 *)(puVar3[2] + 4 + iVar5) = uVar2;
      iVar5 = iVar5 + (uVar1 & 0xfffff) * 4;
      param_1 = (uint *)((int)param_1 - 1);
    } while (param_1 != (uint *)0x0);
  }
  puVar4 = (undefined4 *)(puVar3[4] + param_2 * 4);
  uVar2 = *puVar4;
  *puVar4 = puVar4[1];
  *(undefined4 *)(puVar3[4] + 4 + param_2 * 4) = uVar2;
  return;
}


