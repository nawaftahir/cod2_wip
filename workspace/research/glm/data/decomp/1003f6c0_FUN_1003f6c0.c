// 1003f6c0 size=488 FUN_1003f6c0

void FUN_1003f6c0(void)

{
  float10 fVar1;
  float fVar2;
  float fVar3;
  int in_EAX;
  float *in_EDX;
  float10 fVar4;
  undefined4 local_4c;
  undefined1 local_48 [8];
  undefined1 *local_40;
  float local_3c;
  float local_38;
  float local_34;
  float local_30;
  float local_2c;
  float local_28;
  float local_24;
  undefined4 local_20;
  undefined4 local_1c;
  float local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  local_20 = *(undefined4 *)(in_EAX + 0x3c);
  local_1c = *(undefined4 *)(in_EAX + 0x40);
  local_18 = *(float *)(in_EAX + 0x44);
  if ((*(uint *)(in_EAX + 4) & 0x1000) != 0) {
    local_18 = local_18 + in_EDX[1];
  }
  if (*(float *)(in_EAX + 0x6c) == 0.0) {
    local_24 = *in_EDX;
    local_2c = local_24 * *(float *)(DAT_1072ddc8 + 0x18);
    local_28 = local_24 * *(float *)(DAT_1072ddc8 + 0x1c);
    local_24 = local_24 * *(float *)(DAT_1072ddc8 + 0x20);
    local_30 = in_EDX[1];
    local_38 = local_30 * *(float *)(DAT_1072ddc8 + 0x24);
    local_34 = local_30 * *(float *)(DAT_1072ddc8 + 0x28);
    local_30 = local_30 * *(float *)(DAT_1072ddc8 + 0x2c);
  }
  else {
    local_40 = local_48;
    local_3c = *(float *)(in_EAX + 0x6c) * 0.017453292;
    fVar1 = (float10)fcos((float10)local_3c);
    fVar4 = (float10)fsin((float10)local_3c);
    fVar2 = (float)fVar1 * *in_EDX;
    fVar3 = -((float)fVar4 * *in_EDX);
    local_2c = fVar3 * *(float *)(DAT_1072ddc8 + 0x24) + fVar2 * *(float *)(DAT_1072ddc8 + 0x18);
    local_28 = fVar3 * *(float *)(DAT_1072ddc8 + 0x28) + fVar2 * *(float *)(DAT_1072ddc8 + 0x1c);
    local_24 = fVar3 * *(float *)(DAT_1072ddc8 + 0x2c) + fVar2 * *(float *)(DAT_1072ddc8 + 0x20);
    fVar2 = (float)fVar1 * in_EDX[1];
    fVar3 = (float)fVar4 * in_EDX[1];
    local_38 = fVar3 * *(float *)(DAT_1072ddc8 + 0x18) + fVar2 * *(float *)(DAT_1072ddc8 + 0x24);
    local_34 = fVar3 * *(float *)(DAT_1072ddc8 + 0x1c) + fVar2 * *(float *)(DAT_1072ddc8 + 0x28);
    local_30 = fVar3 * *(float *)(DAT_1072ddc8 + 0x20) + fVar2 * *(float *)(DAT_1072ddc8 + 0x2c);
  }
  local_4c = CONCAT31(CONCAT21(CONCAT11(*(undefined1 *)(in_EAX + 0x5b),
                                        *(undefined1 *)(in_EAX + 0x58)),
                               *(undefined1 *)(in_EAX + 0x59)),*(undefined1 *)(in_EAX + 0x5a));
  FUN_1003f620();
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    FUN_1003f410(local_4c,local_14,local_10,local_c,local_8);
    return;
  }
  FUN_1003f120(local_4c,local_14,local_10,local_c,local_8);
  return;
}


