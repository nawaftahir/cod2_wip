
void FUN_004772c0(void)

{
  HINSTANCE unaff_ESI;
  UINT local_2c;
  code *local_28;
  int local_24;
  int local_20;
  
  local_2c = 0x200;
  local_28 = FUN_00478b40;
  local_24 = 0;
  local_20 = 0;
  LoadCursorA((HINSTANCE)0x0,(LPCSTR)0x7f00);
  GetStockObject(1);
  RegisterClassA((WNDCLASSA *)&local_2c);
  DAT_010bcd60 = CreateWindowExA(0,"QENT","Entity",
                                 (-(uint)(*(int *)(DAT_01233488 + 0x7a0) != 1) & 0xffff0000) +
                                 0x6cf0000,0x14,0x14,100,0x1e0,DAT_010bcd54,(HMENU)0x0,unaff_ESI,
                                 (LPVOID)0x0);
  if (DAT_010bcd60 == (HWND)0x0) {
    FUN_0047a760("Couldn\'t create Entity window");
  }
  return;
}

