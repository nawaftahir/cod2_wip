// 100650f1 size=59 FUN_100650f1

int FUN_100650f1(int param_1)

{
  int in_ECX;
  
  if (param_1 == 0) {
    if (*(int *)(in_ECX + 0x44) == 0) {
      FUN_10067c3e(in_ECX + 0x18,in_ECX + 0x278,0,"internal error: production failed");
      *(undefined4 *)(in_ECX + 0x44) = 1;
    }
    param_1 = 0;
  }
  return param_1;
}


