// 100129c0 size=248 FUN_100129c0

undefined4 FUN_100129c0(void)

{
  HMODULE hInstance;
  HWND pHVar1;
  DWORD dwStyle;
  undefined4 *unaff_ESI;
  DWORD dwExStyle;
  tagRECT tStack_10;
  
  if (*(char *)(unaff_ESI + 2) == '\0') {
    (*(code *)RI_Printf)
              (0,"Attempting %i x %i window at (%i, %i)\n",unaff_ESI[5],unaff_ESI[6],unaff_ESI[3],
               unaff_ESI[4]);
    dwExStyle = 0;
    dwStyle = 0xc80000;
  }
  else {
    (*(code *)RI_Printf)
              (0,"Attempting %i x %i fullscreen with 32 bpp at %i hz\n",unaff_ESI[5],unaff_ESI[6],
               unaff_ESI[1]);
    dwExStyle = 8;
    dwStyle = 0x80000000;
  }
  tStack_10.right = unaff_ESI[5];
  tStack_10.bottom = unaff_ESI[6];
  tStack_10.left = 0;
  tStack_10.top = 0;
  AdjustWindowRectEx(&tStack_10,dwStyle,0,dwExStyle);
  hInstance = GetModuleHandleA((LPCSTR)0x0);
  pHVar1 = CreateWindowExA(dwExStyle,"CoD2","Call of Duty 2 Multiplayer",dwStyle,unaff_ESI[3],
                           unaff_ESI[4],tStack_10.right - tStack_10.left,
                           tStack_10.bottom - tStack_10.top,(HWND)0x0,(HMENU)0x0,hInstance,
                           (LPVOID)0x0);
  *unaff_ESI = pHVar1;
  if (pHVar1 == (HWND)0x0) {
    (*(code *)RI_Printf)(0,"Couldn\'t create a window.\n");
    return 0;
  }
  (*(code *)RI_Printf)(0,"Game window successfully created.\n");
  return 1;
}


