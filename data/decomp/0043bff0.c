
void FUN_0043bff0(int *param_1,undefined4 *param_2,uint param_3,undefined4 *param_4,uint param_5)

{
  int iVar1;
  uint uVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  
  iVar1 = param_3 + param_5;
  if ((int)(1U - *(int *)(*param_1 + -4) | *(int *)(*param_1 + -8) - iVar1) < 0) {
    FUN_00402d30(iVar1);
  }
  puVar4 = (undefined4 *)*param_1;
  puVar3 = puVar4;
  for (uVar2 = param_3 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
    *puVar3 = *param_2;
    param_2 = param_2 + 1;
    puVar3 = puVar3 + 1;
  }
  for (uVar2 = param_3 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
    *(undefined1 *)puVar3 = *(undefined1 *)param_2;
    param_2 = (undefined4 *)((int)param_2 + 1);
    puVar3 = (undefined4 *)((int)puVar3 + 1);
  }
  puVar4 = (undefined4 *)((int)puVar4 + param_3);
  for (uVar2 = param_5 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
    *puVar4 = *param_4;
    param_4 = param_4 + 1;
    puVar4 = puVar4 + 1;
  }
  for (param_5 = param_5 & 3; param_5 != 0; param_5 = param_5 - 1) {
    *(undefined1 *)puVar4 = *(undefined1 *)param_4;
    param_4 = (undefined4 *)((int)param_4 + 1);
    puVar4 = (undefined4 *)((int)puVar4 + 1);
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

