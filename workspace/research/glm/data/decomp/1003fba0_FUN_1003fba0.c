// 1003fba0 size=519 FUN_1003fba0

void FUN_1003fba0(void)

{
  float fVar1;
  float fVar2;
  float10 fVar3;
  float fVar4;
  int in_EAX;
  float10 fVar5;
  undefined4 local_44;
  undefined1 local_40 [4];
  undefined1 local_3c [4];
  undefined1 *local_38;
  undefined1 *local_34;
  float local_30;
  float local_2c;
  float local_28;
  float local_24;
  float local_20;
  float local_1c;
  float local_18;
  float local_14;
  float local_10;
  float local_c;
  undefined4 local_8;
  
  fVar1 = *(float *)(in_EAX + 100);
  fVar2 = *(float *)(in_EAX + 0x68);
  if (*(float *)(in_EAX + 0x6c) == 0.0) {
    FUN_100597d0();
    local_20 = local_20 * fVar1;
    local_1c = local_1c * fVar1;
    local_18 = local_18 * fVar1;
    local_2c = local_2c * fVar2;
    local_28 = local_28 * fVar2;
    local_24 = local_24 * fVar2;
  }
  else {
    FUN_100597d0();
    local_30 = *(float *)(in_EAX + 0x6c) * 0.017453292;
    local_34 = local_40;
    local_38 = local_3c;
    fVar3 = (float10)fcos((float10)local_30);
    fVar5 = (float10)fsin((float10)local_30);
    fVar4 = (float)fVar3 * fVar1;
    fVar1 = -((float)fVar5 * fVar1);
    local_20 = fVar1 * local_2c + local_14 * fVar4;
    local_1c = local_28 * fVar1 + local_10 * fVar4;
    local_18 = local_24 * fVar1 + local_c * fVar4;
    fVar1 = (float)fVar3 * fVar2;
    fVar2 = (float)fVar5 * fVar2;
    local_2c = fVar2 * local_14 + local_2c * fVar1;
    local_28 = local_10 * fVar2 + local_28 * fVar1;
    local_24 = local_c * fVar2 + local_24 * fVar1;
  }
  local_44 = CONCAT31(CONCAT21(CONCAT11(*(undefined1 *)(in_EAX + 0x5b),
                                        *(undefined1 *)(in_EAX + 0x58)),
                               *(undefined1 *)(in_EAX + 0x59)),*(undefined1 *)(in_EAX + 0x5a));
  FUN_1003f620();
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    FUN_1003f410(local_44,local_14,local_10,local_c,local_8);
    return;
  }
  FUN_1003f120(local_44,local_14,local_10,local_c,local_8);
  return;
}


