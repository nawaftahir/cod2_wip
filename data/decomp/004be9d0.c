
void __thiscall FUN_004be9d0(int param_1,int param_2)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 *puVar3;
  
  *(undefined4 *)(param_1 + 0x70) = *(undefined4 *)(param_2 + 0x70);
  *(undefined4 *)(param_1 + 8) = *(undefined4 *)(param_2 + 8);
  *(undefined4 *)(param_1 + 0x5c) = 0;
  FUN_004bf2e0(param_2 + 0x58);
  *(int *)(param_1 + 4) = param_1;
  *(undefined4 *)(param_1 + 0x50) = 0;
  FUN_004bf2e0(param_2 + 0x4c);
  iVar2 = 0;
  *(undefined4 *)(param_1 + 100) = 0;
  if (0 < *(int *)(param_1 + 0x70)) {
    puVar1 = (undefined4 *)(param_1 + 0x74);
    do {
      puVar3 = (undefined4 *)((param_2 - param_1) + (int)puVar1);
      *puVar1 = *puVar3;
      puVar1[1] = puVar3[1];
      puVar1[2] = puVar3[2];
      puVar1[3] = puVar3[3];
      iVar2 = iVar2 + 1;
      puVar1 = puVar1 + 4;
    } while (iVar2 < *(int *)(param_1 + 0x70));
  }
  iVar2 = 0;
  if (0 < *(int *)(param_1 + 8)) {
    puVar1 = (undefined4 *)(param_1 + 0xc);
    do {
      *puVar1 = *(undefined4 *)((int)puVar1 + (param_2 - param_1));
      puVar1[1] = *(undefined4 *)((int)puVar1 + (param_2 - param_1) + 4);
      iVar2 = iVar2 + 1;
      puVar1 = puVar1 + 2;
    } while (iVar2 < *(int *)(param_1 + 8));
  }
  return;
}

