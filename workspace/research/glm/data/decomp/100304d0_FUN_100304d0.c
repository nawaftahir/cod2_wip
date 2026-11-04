// 100304d0 size=173 FUN_100304d0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_100304d0(undefined4 param_1)

{
  int in_EAX;
  
  if (*(int *)(DAT_101d1b9c + 0x20) == 0) {
    _DAT_1072dc10 = 0;
  }
  else {
    _DAT_1072dc10 = *(undefined4 *)((&DAT_101ce740)[in_EAX] + 8);
  }
  _DAT_1072dc1c = *(undefined4 *)((&DAT_101ce6e8)[in_EAX] + 8);
  _DAT_1072dc14 = 0;
  _DAT_1072dc18 = 0;
  DAT_1073055c = param_1;
  FUN_1002e850(0,0,(float)DAT_1076671c,(float)DAT_10766720,0,0,0x3f800000,0x3f800000);
  FUN_1003a8d0();
  return;
}


