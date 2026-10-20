
void FUN_00445370(void)

{
  undefined4 *puVar1;
  int iVar2;
  HWND hDlg;
  
  for (puVar1 = DAT_010a44b8; puVar1 != &DAT_010a44b4; puVar1 = (undefined4 *)puVar1[1]) {
    iVar2 = puVar1[2];
    if ((iVar2 != 0) && (iVar2 != DAT_012334ec)) {
      if ((*(int *)(iVar2 + 8) != *(int *)(puVar1[5] + 8)) && (DAT_0124a20a == '\0')) {
        iVar2 = FUN_0047d980("b->owner->def == b->def->owner",".\\VehicleDlg.cpp",0x85,0,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a20a = '\x01';
        }
      }
      FUN_00465bf0(*(undefined4 *)(puVar1[2] + 8));
    }
  }
  hDlg = GetActiveWindow();
  EndDialog(hDlg,1);
  SetFocus(DAT_010bcd58);
  DAT_0123348c = 0xffffffff;
  return;
}

