
void FUN_00443d90(void)

{
  char cVar1;
  int iVar2;
  int unaff_EBX;
  
  if ((unaff_EBX == 0) && (DAT_0124a1f2 == '\0')) {
    iVar2 = FUN_0047d980("brush",".\\Undo.cpp",0x17c,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a1f2 = '\x01';
    }
  }
  if ((DAT_0109fdcc == 0) && (DAT_0124a1f1 == '\0')) {
    iVar2 = FUN_0047d980("g_lastundo",".\\Undo.cpp",0x17d,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a1f1 = '\x01';
    }
  }
  cVar1 = FUN_00443c30();
  if (cVar1 == '\0') {
    iVar2 = FUN_00458eb0();
    *(undefined4 *)(iVar2 + 0x18) = *(undefined4 *)(*(int *)(unaff_EBX + 8) + 0x74);
    *(undefined4 *)(iVar2 + 0x10) = *(undefined4 *)(unaff_EBX + 0x10);
    *(undefined4 *)(iVar2 + 8) = 0;
    FUN_004431f0();
    *(undefined4 *)(unaff_EBX + 0x10) = *(undefined4 *)(DAT_0109fdcc + 8);
    iVar2 = FUN_00458d40();
    DAT_012334d4 = DAT_012334d4 + iVar2;
  }
  return;
}

