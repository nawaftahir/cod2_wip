// 10068d70 size=58 FUN_10068d70

int FUN_10068d70(int param_1)

{
  undefined4 *in_ECX;
  
  if (param_1 == 0) {
    if (in_ECX[0x13] == 0) {
      FUN_10067c3e(*in_ECX,in_ECX + 4,0,"internal error: production failed");
      in_ECX[0x13] = 1;
    }
    in_ECX[0x14] = 1;
    param_1 = 0;
  }
  return param_1;
}


