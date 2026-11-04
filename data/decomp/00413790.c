
void __fastcall FUN_00413790(CFrameWnd *param_1)

{
  char cVar1;
  int iVar2;
  
  cVar1 = FUN_0046ba10();
  if (cVar1 != '\0') {
    iVar2 = MessageBoxA(DAT_010bcd54,"This will lose changes to the map","warning",1);
    if (iVar2 == 2) {
      return;
    }
  }
  FUN_0046b9b0();
  CFrameWnd::OnClose(param_1);
  return;
}

