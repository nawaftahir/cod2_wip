// 10086add size=47 FUN_10086add

void FUN_10086add(void)

{
  undefined4 *in_ECX;
  
  *in_ECX = &PTR_FUN_10110420;
  _free((void *)in_ECX[0x34]);
  if ((undefined4 *)in_ECX[0x38] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)in_ECX[0x38])(1);
  }
  FUN_10086309();
  return;
}


