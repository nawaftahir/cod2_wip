
void FUN_00477960(void)

{
  char *_Str;
  uint uVar1;
  int iVar2;
  
  _Str = (char *)FUN_00464bb0();
  uVar1 = _atol(_Str);
  iVar2 = 0;
  do {
    SendMessageA((HWND)(&DAT_011299b8)[iVar2],0xf1,(uint)((1 << ((byte)iVar2 & 0x1f) & uVar1) != 0),
                 0);
    iVar2 = iVar2 + 1;
  } while (iVar2 < 0xc);
  return;
}

