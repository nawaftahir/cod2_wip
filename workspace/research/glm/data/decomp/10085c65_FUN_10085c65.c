// 10085c65 size=188 FUN_10085c65

undefined4 FUN_10085c65(undefined4 *param_1)

{
  undefined4 uVar1;
  undefined4 *in_ECX;
  
  if (param_1 == (undefined4 *)0x0) {
    uVar1 = 0x80004005;
  }
  else {
    in_ECX[1] = param_1[1];
    in_ECX[2] = param_1[2];
    in_ECX[3] = param_1[3];
    in_ECX[4] = param_1[4];
    in_ECX[5] = param_1[5];
    in_ECX[6] = param_1[6];
    *(undefined8 *)(in_ECX + 8) = *(undefined8 *)(param_1 + 8);
    *(undefined8 *)(in_ECX + 10) = *(undefined8 *)(param_1 + 10);
    *in_ECX = *param_1;
    in_ECX[0xc] = param_1[0xc];
    in_ECX[0xd] = param_1[0xd];
    in_ECX[0xe] = param_1[0xe];
    in_ECX[0x10] = param_1[0x10];
    in_ECX[0xf] = param_1[0xf];
    in_ECX[0x11] = param_1[0x11];
    in_ECX[0x12] = param_1[0x12];
    in_ECX[0x13] = param_1[0x13];
    in_ECX[0x14] = param_1[0x14];
    in_ECX[0x15] = param_1[0x15];
    in_ECX[0x16] = param_1[0x16];
    in_ECX[0x17] = param_1[0x17];
    in_ECX[0x18] = param_1[0x18];
    in_ECX[0x19] = param_1[0x19];
    in_ECX[0x1a] = param_1[0x1a];
    in_ECX[0x1b] = param_1[0x1b];
    in_ECX[0x1c] = param_1[0x1c];
    in_ECX[0x1d] = param_1[0x1d];
    uVar1 = 0;
  }
  return uVar1;
}


