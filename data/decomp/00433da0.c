
void FUN_00433da0(void)

{
  if (DAT_012334ba != '\0') {
    if (DAT_005909fc < 3) {
      DAT_005909fc = DAT_005909fc + 1;
      FUN_00409690();
      if (DAT_005909fc == 1) {
        DAT_0109c530 = 0;
        DAT_0109c52c = 0;
        DAT_0109c528 = 0;
        DAT_012334bc = 0;
        FUN_00433b90();
        DAT_0123348c = 0xffffffff;
        return;
      }
      if (DAT_005909fc == 2) {
        DAT_00590a05 = 1;
        DAT_0123348c = 0xffffffff;
        return;
      }
    }
    else {
      FUN_00433ad0();
    }
    DAT_0123348c = 0xffffffff;
  }
  return;
}

