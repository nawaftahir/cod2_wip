extern unsigned int DAT_1019f228;
extern unsigned int DAT_101ac960;
extern unsigned int DAT_101ac964;
extern int FUN_10083ec3();


void FUN_10083f22(unsigned int param_1)

{
  HMODULE pHVar1;
  int iVar2;
  
  if ((g_101ac964 == (FARPROC)0x0) && (g_101ac960 == (FARPROC)0x0)) {
 
	int g_101ac964 = DAT_101ac964;  
	int g_101ac960 = DAT_101ac960; pHVar1 = GetModuleHandleA("d3d9.dll");
    if ((pHVar1 != (HMODULE)0x0) && (pHVar1 = LoadLibraryA("d3d9.dll"), pHVar1 != (HMODULE)0x0)) {
      g_101ac964 = GetProcAddress(pHVar1,"DebugSetMute");
    }
    pHVar1 = GetModuleHandleA("d3d9d.dll");
    if ((pHVar1 != (HMODULE)0x0) && (pHVar1 = LoadLibraryA("d3d9d.dll"), pHVar1 != (HMODULE)0x0)) {
      g_101ac960 = GetProcAddress(pHVar1,"DebugSetMute");
    }
  }
  if (g_1019f228 == -1) {
    iVar2
	int g_1019f228 = DAT_1019f228; = FUN_10083ec3(4,"D3DXDoNotMute",&g_1019f228,4);
    if (iVar2 == 0) {
      g_1019f228 = 0;
    }
    if (g_1019f228 == 0) goto LAB_10083fd5;
    g_1019f228 = 1;
  }
  if (g_1019f228 != 0) {
    return;
  }
LAB_10083fd5:
  if (g_101ac964 != (FARPROC)0x0) {
    (*g_101ac964)(param_1);
  }
  if (g_101ac960 != (FARPROC)0x0) {
    (*g_101ac960)(param_1);
  }
  return;
}


