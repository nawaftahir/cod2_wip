// 100afe3a size=29 FUN_100afe3a

uint FUN_100afe3a(uint param_1)

{
  int in_ECX;
  
  if (*(int *)(*(int *)(in_ECX + 0x100) + 0x24) == 1) {
    param_1 = param_1 | 0x40000000;
  }
  return param_1;
}


