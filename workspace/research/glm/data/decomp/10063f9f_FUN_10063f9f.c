// 10063f9f size=57 FUN_10063f9f

undefined4 FUN_10063f9f(undefined4 param_1,int param_2)

{
  int *piVar1;
  int in_ECX;
  
  *(undefined4 *)(*(int *)(in_ECX + 0x26c) + 0x1c) = param_1;
  if (*(int *)(in_ECX + 0x278) != 0xc) {
    piVar1 = (int *)(*(int *)(in_ECX + 0x26c) + 0x1c);
    *piVar1 = *piVar1 + -1;
  }
  if (param_2 != 0) {
    *(int *)(*(int *)(in_ECX + 0x26c) + 0x18) = param_2;
  }
  return 0;
}


