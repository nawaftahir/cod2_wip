// 10083f22 size=213 FUN_10083f22

void FUN_10083f22(undefined4 param_1)

{
  HMODULE pHVar1;
  int iVar2;
  
  if ((DAT_101ac964 == (FARPROC)0x0) && (DAT_101ac960 == (FARPROC)0x0)) {
    pHVar1 = GetModuleHandleA("d3d9.dll");
    if ((pHVar1 != (HMODULE)0x0) && (pHVar1 = LoadLibraryA("d3d9.dll"), pHVar1 != (HMODULE)0x0)) {
      DAT_101ac964 = GetProcAddress(pHVar1,"DebugSetMute");
    }
    pHVar1 = GetModuleHandleA("d3d9d.dll");
    if ((pHVar1 != (HMODULE)0x0) && (pHVar1 = LoadLibraryA("d3d9d.dll"), pHVar1 != (HMODULE)0x0)) {
      DAT_101ac960 = GetProcAddress(pHVar1,"DebugSetMute");
    }
  }
  if (DAT_1019f228 == -1) {
    iVar2 = FUN_10083ec3(4,"D3DXDoNotMute",&DAT_1019f228,4);
    if (iVar2 == 0) {
      DAT_1019f228 = 0;
    }
    if (DAT_1019f228 == 0) goto LAB_10083fd5;
    DAT_1019f228 = 1;
  }
  if (DAT_1019f228 != 0) {
    return;
  }
LAB_10083fd5:
  if (DAT_101ac964 != (FARPROC)0x0) {
    (*DAT_101ac964)(param_1);
  }
  if (DAT_101ac960 != (FARPROC)0x0) {
    (*DAT_101ac960)(param_1);
  }
  return;
}


