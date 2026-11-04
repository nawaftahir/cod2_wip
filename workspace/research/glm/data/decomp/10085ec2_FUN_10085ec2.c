// 10085ec2 size=356 FUN_10085ec2

int FUN_10085ec2(uint *param_1)

{
  undefined4 *puVar1;
  int in_ECX;
  uint uVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  float10 extraout_ST0;
  int local_8;
  
  local_8 = *(int *)(in_ECX + 0x20);
  if (*(int *)(in_ECX + 8) == local_8) {
    if (local_8 == 0) {
      local_8 = 0x400;
    }
    else {
      local_8 = local_8 * 2;
    }
    puVar1 = operator_new(local_8 << 2);
    if (puVar1 == (undefined4 *)0x0) {
      if (param_1 != (uint *)0x0) {
        FUN_1006db35(1);
      }
      return -1;
    }
    puVar4 = *(undefined4 **)(in_ECX + 0x14);
    puVar5 = puVar1;
    for (uVar2 = *(uint *)(in_ECX + 8) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
      puVar5 = (undefined4 *)((int)puVar5 + 1);
    }
    puVar4 = puVar1 + *(int *)(in_ECX + 8);
    for (uVar2 = local_8 - *(int *)(in_ECX + 8) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar4 = 0;
      puVar4 = puVar4 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar4 = 0;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
    }
    _free(*(void **)(in_ECX + 0x14));
    *(undefined4 **)(in_ECX + 0x14) = puVar1;
    *(int *)(in_ECX + 0x20) = local_8;
  }
  if (((param_1 != (uint *)0x0) &&
      ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + param_1[1] * 4) + 5) & 1) != 0)) &&
     (param_1[2] == 0xffffffff)) {
    *(byte *)param_1 = (byte)*param_1 | 0x80;
    if ((*(double *)(param_1 + 8) == 0.0) || (*(double *)(param_1 + 8) == 1.0)) {
      *param_1 = *param_1 | 1;
    }
    iVar3 = __ftol();
    if (ABS(*(double *)(param_1 + 8) - (double)iVar3) < 1e-06) {
      *param_1 = *param_1 | 2;
    }
    if (extraout_ST0 < (float10)*(double *)(param_1 + 8) !=
        (extraout_ST0 == (float10)*(double *)(param_1 + 8))) {
      *param_1 = *param_1 | 4;
    }
    if ((float10)*(double *)(param_1 + 8) <= extraout_ST0) {
      *param_1 = *param_1 | 8;
    }
    if (ABS(*(double *)(param_1 + 8)) < 1.0 != (ABS(*(double *)(param_1 + 8)) == 1.0)) {
      *param_1 = *param_1 | 0x10;
    }
  }
  *(uint **)(*(int *)(in_ECX + 0x14) + *(int *)(in_ECX + 8) * 4) = param_1;
  iVar3 = *(int *)(in_ECX + 8);
  *(int *)(in_ECX + 8) = iVar3 + 1;
  return iVar3;
}


