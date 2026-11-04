
void FUN_00434630(void)

{
  bool bVar1;
  char in_AL;
  int iVar2;
  
  bVar1 = true;
  if (((in_AL == '\0') || (DAT_0112993e != '\0')) || (DAT_0112993f != '\0')) {
    DAT_010c4d84 = 0;
    bVar1 = false;
  }
  DAT_005909f8 = 0xffffffff;
  iVar2 = FUN_00434360();
  if ((iVar2 == 0) && (bVar1)) {
    FUN_00434360();
  }
  return;
}

