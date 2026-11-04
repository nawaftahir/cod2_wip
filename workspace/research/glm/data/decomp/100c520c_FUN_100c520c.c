// 100c520c size=88 FUN_100c520c

void FUN_100c520c(void)

{
  int *piVar1;
  undefined4 *in_ECX;
  
  *in_ECX = &PTR_FUN_1011a3b8;
  _free((void *)in_ECX[0x43]);
  _free((void *)in_ECX[0x49]);
  piVar1 = (int *)in_ECX[0x6c];
  if (piVar1 != (int *)0x0) {
    (**(code **)(*piVar1 + 8))(piVar1);
    in_ECX[0x6c] = 0;
  }
  FUN_1006a6ff();
  FUN_1006a6ff();
  FUN_10086add();
  return;
}


