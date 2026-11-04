// 100cb92a size=72 FUN_100cb92a

void FUN_100cb92a(undefined4 param_1,undefined4 param_2,undefined4 param_3,uint param_4)

{
  undefined4 *in_ECX;
  
  if (4 < param_4) {
    param_4 = 4;
  }
  in_ECX[6] = 0xffffffff;
  in_ECX[9] = 0xffffffff;
  *in_ECX = param_1;
  in_ECX[1] = param_2;
  in_ECX[3] = param_4;
  in_ECX[10] = 0xffffffff;
  in_ECX[2] = param_3;
  in_ECX[4] = 0;
  in_ECX[5] = 0;
  in_ECX[7] = 0;
  in_ECX[8] = 0;
  in_ECX[0xb] = 0;
  in_ECX[0xc] = 0;
  return;
}


