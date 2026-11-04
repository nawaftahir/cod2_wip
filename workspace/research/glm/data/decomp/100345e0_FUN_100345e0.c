// 100345e0 size=277 FUN_100345e0

void FUN_100345e0(int param_1)

{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  int in_EAX;
  undefined4 local_1c;
  float local_18;
  float local_14;
  float local_10;
  float local_c;
  float local_8;
  float local_4;
  
  if (in_EAX != 0) {
    if (DAT_1072debd != '\0') {
      FUN_1002e380();
    }
    if (0 < in_EAX) {
      param_1 = param_1 + 0x10;
      do {
        if (param_1 == 4) {
          local_1c = 0xffffffff;
        }
        else {
          uVar1 = FUN_1010a8a8();
          uVar2 = FUN_1010a8a8();
          uVar3 = FUN_1010a8a8();
          uVar4 = FUN_1010a8a8();
          local_1c = CONCAT13(uVar4,CONCAT12(uVar3,CONCAT11(uVar2,uVar1)));
        }
        local_10 = -*(float *)(param_1 + 0xc);
        local_c = local_10 * *(float *)(DAT_1072ddc8 + 0x18);
        local_8 = local_10 * *(float *)(DAT_1072ddc8 + 0x1c);
        local_4 = local_10 * *(float *)(DAT_1072ddc8 + 0x20);
        local_18 = local_10 * *(float *)(DAT_1072ddc8 + 0x24);
        local_14 = local_10 * *(float *)(DAT_1072ddc8 + 0x28);
        local_10 = local_10 * *(float *)(DAT_1072ddc8 + 0x2c);
        FUN_10032a50(param_1 + 0x10,DAT_10764558,&local_18,local_1c);
        param_1 = param_1 + 0x80;
        in_EAX = in_EAX + -1;
      } while (in_EAX != 0);
    }
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
  }
  return;
}


