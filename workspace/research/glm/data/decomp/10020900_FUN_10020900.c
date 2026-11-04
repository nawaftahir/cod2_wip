// 10020900 size=78 FUN_10020900

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10020900(float param_1)

{
  undefined1 *in_EAX;
  int iVar1;
  
  iVar1 = (int)ROUND((_DAT_101da9a0 * param_1 + _DAT_101da9b8) - 0.5);
  if (iVar1 < 0) {
    *in_EAX = 0;
    return;
  }
  if (0xff < iVar1) {
    iVar1 = 0xff;
  }
  *in_EAX = (char)iVar1;
  return;
}


