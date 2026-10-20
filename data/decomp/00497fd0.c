
undefined1 * FUN_00497fd0(void)

{
  char cVar1;
  HMODULE hModule;
  DWORD DVar2;
  
  if (DAT_0124a510 == '\0') {
    hModule = GetModuleHandleA((LPCSTR)0x0);
    DVar2 = GetModuleFileNameA(hModule,&DAT_0124a510,0x100);
    if (DVar2 != 0x100) goto joined_r0x00498002;
    DVar2 = 0xff;
    do {
      cVar1 = (&DAT_0124a510)[DVar2];
      if (((cVar1 == '\\') || (cVar1 == '/')) || (cVar1 == ':')) break;
      DVar2 = DVar2 - 1;
joined_r0x00498002:
    } while (DVar2 != 0);
    (&DAT_0124a510)[DVar2] = 0;
  }
  return &DAT_0124a510;
}

