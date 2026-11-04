
void FUN_00417cf0(void)

{
  int unaff_EBX;
  int iVar1;
  undefined4 *puVar2;
  
  iVar1 = 0;
  puVar2 = (undefined4 *)(unaff_EBX + 0x7a4);
  do {
    if (((-1 < *(int *)((char *)*puVar2 + -0xc)) &&
        ((CStatusBar *)(unaff_EBX + 0xd0) != (CStatusBar *)0x0)) &&
       (*(int *)(unaff_EBX + 0xec) != 0)) {
      CStatusBar::SetPaneText((CStatusBar *)(unaff_EBX + 0xd0),iVar1,(char *)*puVar2,1);
    }
    iVar1 = iVar1 + 1;
    puVar2 = puVar2 + 1;
  } while (iVar1 < 6);
  return;
}

