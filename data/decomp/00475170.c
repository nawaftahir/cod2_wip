
void FUN_00475170(void)

{
  undefined4 *in_EAX;
  
  *in_EAX = &PTR_LAB_0054f83c;
  if ((void *)in_EAX[1] != (void *)0x0) {
    _free((void *)in_EAX[1]);
  }
  return;
}

