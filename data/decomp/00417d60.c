
void FUN_00417d60(void)

{
  byte unaff_BL;
  byte unaff_BH;
  int unaff_EDI;
  
  if (DAT_0058fbed != '\0') {
    if (((unaff_BL & 6) != 0) && (*(int *)(unaff_EDI + 0x788) != 0)) {
      RedrawWindow(*(HWND *)(*(int *)(unaff_EDI + 0x788) + 0x1c),(RECT *)0x0,(HRGN)0x0,0x101);
    }
    if ((((unaff_BL & 1) != 0) || (((unaff_BH & 1) != 0 && (*(char *)(unaff_EDI + 0x7e4) != '\0'))))
       && (*(int *)(unaff_EDI + 0x78c) != 0)) {
      RedrawWindow(*(HWND *)(*(int *)(unaff_EDI + 0x78c) + 0x1c),(RECT *)0x0,(HRGN)0x0,0x101);
    }
    if (((unaff_BL & 0x28) != 0) && (*(int *)(unaff_EDI + 0x794) != 0)) {
      RedrawWindow(*(HWND *)(*(int *)(unaff_EDI + 0x794) + 0x1c),(RECT *)0x0,(HRGN)0x0,0x101);
    }
    if (((unaff_BL & 0x10) != 0) && (*(int *)(unaff_EDI + 0x790) != 0)) {
      RedrawWindow(*(HWND *)(*(int *)(unaff_EDI + 0x790) + 0x1c),(RECT *)0x0,(HRGN)0x0,0x101);
    }
  }
  return;
}

