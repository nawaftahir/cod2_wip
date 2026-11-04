// 100cb972 size=101 FUN_100cb972

undefined4 FUN_100cb972(undefined4 *param_1)

{
  undefined4 uVar1;
  undefined4 *in_ECX;
  
  if (param_1 == (undefined4 *)0x0) {
    uVar1 = 0x80004005;
  }
  else {
    *in_ECX = *param_1;
    in_ECX[1] = param_1[1];
    in_ECX[2] = param_1[2];
    in_ECX[3] = param_1[3];
    in_ECX[4] = param_1[4];
    in_ECX[5] = param_1[5];
    in_ECX[6] = param_1[6];
    in_ECX[7] = param_1[7];
    in_ECX[8] = param_1[8];
    in_ECX[9] = param_1[9];
    in_ECX[10] = param_1[10];
    in_ECX[0xb] = param_1[0xb];
    in_ECX[0xc] = param_1[0xc];
    uVar1 = 0;
  }
  return uVar1;
}


