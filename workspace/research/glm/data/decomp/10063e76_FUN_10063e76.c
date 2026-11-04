// 10063e76 size=47 FUN_10063e76

undefined4 FUN_10063e76(undefined4 *param_1,undefined4 *param_2)

{
  int in_ECX;
  
  if (param_1 != (undefined4 *)0x0) {
    *param_1 = *(undefined4 *)(*(int *)(in_ECX + 0x26c) + 0x18);
  }
  if (param_2 != (undefined4 *)0x0) {
    *param_2 = *(undefined4 *)(*(int *)(in_ECX + 0x26c) + 0x1c);
  }
  return 0;
}


