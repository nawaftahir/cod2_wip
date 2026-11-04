// 100244b0 size=301 FUN_100244b0

void FUN_100244b0(void)

{
  uint uVar1;
  uint uVar2;
  int in_EAX;
  uint uVar3;
  uint *puVar4;
  uint *puVar5;
  uint *in_ECX;
  uint *puVar6;
  uint *puVar8;
  int local_f4;
  undefined4 auStack_f0 [30];
  undefined4 auStack_78 [30];
  uint *puVar7;
  
  if (in_EAX < 2) {
    return;
  }
  local_f4 = 0;
  puVar8 = in_ECX + in_EAX * 2 + -2;
LAB_100244d1:
  uVar3 = ((uint)((int)puVar8 - (int)in_ECX >> 3) >> 3) + 1;
  if (8 < uVar3) {
    uVar3 = uVar3 / 2;
    uVar1 = in_ECX[uVar3 * 2];
    uVar2 = in_ECX[uVar3 * 2 + 1];
    in_ECX[uVar3 * 2] = *in_ECX;
    (in_ECX + uVar3 * 2)[1] = in_ECX[1];
    *in_ECX = uVar1;
    in_ECX[1] = uVar2;
    puVar4 = puVar8 + 2;
    puVar6 = in_ECX;
LAB_10024523:
    puVar7 = puVar6;
    puVar6 = puVar7 + 2;
    if (puVar6 <= puVar8) goto code_r0x1002452a;
    goto LAB_10024530;
  }
  FUN_10024460();
  goto LAB_100244e8;
code_r0x1002452a:
  if (*puVar6 <= *in_ECX) goto LAB_10024523;
LAB_10024530:
  do {
    puVar5 = puVar4;
    puVar4 = puVar5 + -2;
    if (puVar4 <= in_ECX) break;
  } while (*in_ECX <= *puVar4);
  if (puVar6 <= puVar4) {
    uVar3 = *puVar6;
    uVar1 = puVar7[3];
    *puVar6 = *puVar4;
    puVar7[3] = puVar5[-1];
    *puVar4 = uVar3;
    puVar5[-1] = uVar1;
    goto LAB_10024523;
  }
  uVar3 = *in_ECX;
  uVar1 = in_ECX[1];
  *in_ECX = *puVar4;
  in_ECX[1] = puVar5[-1];
  *puVar4 = uVar3;
  puVar5[-1] = uVar1;
  if ((int)((int)puVar4 + (-8 - (int)in_ECX) & 0xfffffff8U) <
      (int)((int)puVar8 - (int)puVar6 & 0xfffffff8U)) {
    if (puVar6 < puVar8) {
      auStack_f0[local_f4] = puVar6;
      auStack_78[local_f4] = puVar8;
      local_f4 = local_f4 + 1;
    }
    if (in_ECX < puVar5 + -4) {
      puVar8 = puVar5 + -4;
      goto LAB_100244d1;
    }
  }
  else {
    if (in_ECX < puVar5 + -4) {
      auStack_f0[local_f4] = in_ECX;
      auStack_78[local_f4] = puVar5 + -4;
      local_f4 = local_f4 + 1;
    }
    in_ECX = puVar6;
    if (puVar6 < puVar8) goto LAB_100244d1;
  }
LAB_100244e8:
  local_f4 = local_f4 + -1;
  if (local_f4 < 0) {
    return;
  }
  puVar8 = (uint *)auStack_78[local_f4];
  in_ECX = (uint *)auStack_f0[local_f4];
  goto LAB_100244d1;
}


