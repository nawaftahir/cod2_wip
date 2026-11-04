// 1002bdd0 size=213 FUN_1002bdd0

uint FUN_1002bdd0(void)

{
  int iVar1;
  HMODULE hInstance;
  HWND hWnd;
  int *in_ECX;
  undefined4 **ppuVar2;
  LPVOID lpParam;
  undefined4 *puStack_28;
  undefined *puStack_24;
  undefined4 uStack_20;
  undefined4 local_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  
  uStack_20 = 0;
  puStack_24 = &DAT_101977cc;
  puStack_28 = &local_1c;
  iVar1 = DirectDrawCreateEx();
  if (iVar1 < 0) {
    return 0;
  }
  lpParam = (LPVOID)0x0;
  hInstance = GetModuleHandleA((LPCSTR)0x0);
  hWnd = CreateWindowExA(0,"static","dummy",0,0,0,1,1,(HWND)0x0,(HMENU)0x0,hInstance,lpParam);
  if (hWnd != (HWND)0x0) {
    iVar1 = (**(code **)(*in_ECX + 0x50))(in_ECX,hWnd,0x11);
    if (-1 < iVar1) {
      local_1c = 0;
      uStack_18 = 0;
      ppuVar2 = &puStack_28;
      uStack_14 = 0;
      uStack_20 = 0x4000;
      iVar1 = (**(code **)(*in_ECX + 0x5c))(in_ECX,&uStack_20,ppuVar2,&puStack_24);
      DestroyWindow(hWnd);
      (*(code *)(*ppuVar2)[2])(ppuVar2);
      return (iVar1 < 0) - 1 & (uint)ppuVar2;
    }
    DestroyWindow(hWnd);
  }
  (**(code **)(*in_ECX + 8))(in_ECX);
  return 0;
}


