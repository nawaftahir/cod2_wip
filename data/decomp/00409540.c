
void __thiscall FUN_00409540(int *param_1,undefined4 *param_2,uint param_3)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  undefined4 *puVar5;
  
  iVar2 = *param_1;
  uVar3 = *(uint *)(iVar2 + -0xc);
  iVar1 = uVar3 + param_3;
  if ((int)(1U - *(int *)(iVar2 + -4) | *(int *)(iVar2 + -8) - iVar1) < 0) {
    FUN_00402d30(iVar1);
  }
  if ((uint)((int)param_2 - iVar2) <= uVar3) {
    param_2 = (undefined4 *)(*param_1 + ((int)param_2 - iVar2));
  }
  puVar5 = (undefined4 *)(uVar3 + *param_1);
  for (uVar4 = param_3 >> 2; uVar4 != 0; uVar4 = uVar4 - 1) {
    *puVar5 = *param_2;
    param_2 = param_2 + 1;
    puVar5 = puVar5 + 1;
  }
  for (param_3 = param_3 & 3; param_3 != 0; param_3 = param_3 - 1) {
    *(undefined1 *)puVar5 = *(undefined1 *)param_2;
    param_2 = (undefined4 *)((int)param_2 + 1);
    puVar5 = (undefined4 *)((int)puVar5 + 1);
  }
  if (-1 < iVar1) {
    if (iVar1 <= *(int *)(*param_1 + -8)) {
      *(int *)(*param_1 + -0xc) = iVar1;
      *(undefined1 *)(iVar1 + *param_1) = 0;
      return;
    }
  }
                    /* WARNING: Subroutine does not return */
  FUN_00402c90(0x80070057);
}

