// 100a482d size=174 FUN_100a482d

uint FUN_100a482d(undefined4 param_1,undefined4 param_2,undefined4 *param_3)

{
  uint uVar1;
  int iVar2;
  undefined4 *in_ECX;
  
  if (param_3 == (undefined4 *)0x0) {
    uVar1 = 0x8876086c;
  }
  else {
    *param_3 = 0;
    *in_ECX = param_2;
    in_ECX[1] = param_1;
    in_ECX[2] = 0;
    in_ECX[4] = 0;
    in_ECX[5] = 0;
    in_ECX[6] = 0;
    in_ECX[7] = 0;
    in_ECX[0x10] = 0;
    in_ECX[0x11] = 0;
    in_ECX[0x12] = 1;
    in_ECX[0x13] = 0;
    in_ECX[0x14] = 0;
    in_ECX[0x15] = 0;
    in_ECX[0x16] = 0;
    DAT_101ad558 = in_ECX;
    uVar1 = FUN_10063e32(1);
    if (-1 < (int)uVar1) {
      FUN_1009960d(0,0);
      iVar2 = FUN_100a352e();
      if (iVar2 != 0) {
        in_ECX[0x10] = 1;
      }
      uVar1 = FUN_100673e4();
      if (-1 < (int)uVar1) {
        if (in_ECX[0x10] == 0) {
          *param_3 = *(undefined4 *)(in_ECX[2] + 8);
          *(undefined4 *)(in_ECX[2] + 8) = 0;
        }
        uVar1 = -(uint)(in_ECX[0x10] != 0) & 0x80004005;
      }
    }
  }
  return uVar1;
}


