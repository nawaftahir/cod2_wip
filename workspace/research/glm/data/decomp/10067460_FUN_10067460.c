// 10067460 size=49 FUN_10067460

void FUN_10067460(void)

{
  int iVar1;
  int *in_ECX;
  
  iVar1 = *in_ECX;
  while (iVar1 != 0) {
    iVar1 = *(int *)*in_ECX;
    _free((int *)*in_ECX);
    *in_ECX = iVar1;
  }
  _free((void *)in_ECX[6]);
  _free((void *)in_ECX[7]);
  return;
}


