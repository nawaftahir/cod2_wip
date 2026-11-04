
void __fastcall FUN_00418ec0(int param_1)

{
  undefined4 *puVar1;
  char cVar2;
  undefined4 *puVar3;
  
  if (*(int *)(param_1 + 0x7e0) != 0) {
    if (DAT_0109fe5e != '\0') {
      FUN_004171b0();
    }
    if (DAT_0109fe5f == '\0') {
      cVar2 = FUN_00452d90(*(int *)(param_1 + 0x7e0));
      if (cVar2 != '\0') {
        SendMessageA(*(HWND *)(param_1 + 0x180),0x402,0x802a,1);
        return;
      }
      SendMessageA(*(HWND *)(param_1 + 0x180),0x402,0x802a,0);
    }
    else {
      DAT_0109fe5f = '\0';
      RedrawWindow(*(HWND *)(*(int *)(param_1 + 0x7e0) + 0x1c),(RECT *)0x0,(HRGN)0x0,0x105);
      SendMessageA(*(HWND *)(param_1 + 0x180),0x402,0x802a,0);
      puVar3 = DAT_010a44b8;
      if (DAT_010a44b8 != &DAT_010a44b4) {
        do {
          if (puVar3[8] == 0) {
            FUN_00467f00();
            return;
          }
          puVar1 = puVar3 + 1;
          puVar3 = (undefined4 *)*puVar1;
        } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
        return;
      }
    }
  }
  return;
}

