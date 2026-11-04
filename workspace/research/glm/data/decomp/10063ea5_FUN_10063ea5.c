// 10063ea5 size=64 FUN_10063ea5

undefined4 FUN_10063ea5(uint *param_1,int *param_2)

{
  uint *puVar1;
  uint *puVar2;
  int in_ECX;
  
  puVar1 = *(uint **)(in_ECX + 0x268);
  do {
    puVar2 = puVar1;
    puVar1 = (uint *)puVar2[0x1b];
  } while ((uint *)puVar2[0x1b] != (uint *)0x0);
  if (param_1 != (uint *)0x0) {
    *param_1 = *puVar2;
  }
  if (param_2 != (int *)0x0) {
    if (puVar2[1] < *puVar2) {
      *param_2 = 0;
    }
    else {
      *param_2 = puVar2[1] - *puVar2;
    }
  }
  return 0;
}


