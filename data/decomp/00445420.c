
void FUN_00445420(void)

{
  undefined4 *puVar1;
  int iVar2;
  HWND hDlg;
  undefined4 *puVar3;
  
  puVar3 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      iVar2 = puVar3[2];
      if ((iVar2 != 0) && (iVar2 != DAT_012334ec)) {
        if ((*(int *)(iVar2 + 8) != *(int *)(puVar3[5] + 8)) && (DAT_0124a209 == '\0')) {
          iVar2 = FUN_0047d980("b->owner->def == b->def->owner",".\\VehicleDlg.cpp",0x97,0,1);
          if (iVar2 == 0) {
            DebugBreak();
          }
          else if (iVar2 == 2) {
            DAT_0124a209 = '\x01';
          }
        }
        FUN_00465c60();
        FUN_004655f0();
        FUN_004657a0();
      }
      puVar1 = puVar3 + 1;
      puVar3 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
  }
  hDlg = GetActiveWindow();
  EndDialog(hDlg,1);
  SetFocus(DAT_010bcd58);
  DAT_0123348c = 0xffffffff;
  return;
}

