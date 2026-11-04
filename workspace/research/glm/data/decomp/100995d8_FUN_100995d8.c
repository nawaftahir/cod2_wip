// 100995d8 size=53 FUN_100995d8

int FUN_100995d8(int param_1)

{
  int in_ECX;
  
  if (param_1 == 0) {
    if (*(int *)(in_ECX + 0x40) == 0) {
      FUN_10099580();
    }
    *(undefined4 *)(in_ECX + 0x40) = 1;
    *(undefined4 *)(in_ECX + 0x44) = 1;
  }
  return param_1;
}


