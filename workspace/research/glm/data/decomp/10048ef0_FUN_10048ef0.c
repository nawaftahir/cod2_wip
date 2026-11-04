// 10048ef0 size=120 FUN_10048ef0

void FUN_10048ef0(int param_1,undefined4 param_2,int param_3,undefined4 *param_4)

{
  uint uVar1;
  uint uVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  
  uVar1 = *(uint *)(param_1 + 0x24);
  iVar3 = *(int *)(param_1 + 0xe4);
  if (0 < iVar3) {
    param_3 = param_3 - (int)param_4;
    do {
      puVar4 = *(undefined4 **)(param_3 + (int)param_4);
      puVar5 = (undefined4 *)*param_4;
      for (uVar2 = uVar1 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
        *puVar5 = *puVar4;
        puVar4 = puVar4 + 1;
        puVar5 = puVar5 + 1;
      }
      param_4 = param_4 + 1;
      iVar3 = iVar3 + -1;
      for (uVar2 = uVar1 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
        *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
        puVar4 = (undefined4 *)((int)puVar4 + 1);
        puVar5 = (undefined4 *)((int)puVar5 + 1);
      }
    } while (iVar3 != 0);
  }
  FUN_10048cd0();
  return;
}


