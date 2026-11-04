
void FUN_00434810(void)

{
  char in_AL;
  int iVar1;
  
  if (in_AL == '\0') {
    DAT_01128d8c = 0;
  }
  DAT_005909f8 = 0xffffffff;
  iVar1 = FUN_00434690();
  if ((iVar1 == 0) && (in_AL != '\0')) {
    FUN_00434690();
  }
  return;
}

