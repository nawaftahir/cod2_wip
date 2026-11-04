// 1005ff30 size=74 FUN_1005ff30

void FUN_1005ff30(void)

{
  int iVar1;
  char *_Str;
  undefined4 *in_ECX;
  
  iVar1 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar1] != '\0') {
    (&DAT_101a6ab4)[iVar1] = 0;
    *in_ECX = *(undefined4 *)(&DAT_101a6ac8 + iVar1);
    *(undefined4 *)(&DAT_101a6ab0 + iVar1) = *(undefined4 *)(&DAT_101a6ac4 + iVar1);
  }
  _Str = (char *)FUN_1005f690();
  _atol(_Str);
  return;
}


