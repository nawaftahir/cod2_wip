
void FUN_0041a330(void)

{
  int iVar1;
  CWnd *this;
  HWND pHVar2;
  CWnd *pCVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  int local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524c9a;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  local_14 = FUN_004ff450(0x168);
  local_8 = 0;
  if (local_14 == 0) {
    this = (CWnd *)0x0;
  }
  else {
    this = (CWnd *)FUN_00402f50();
  }
  local_8 = 0xffffffff;
  local_24 = 100;
  local_20 = 100;
  uVar5 = 0;
  local_1c = 300;
  local_18 = 300;
  iVar1 = *(int *)this;
  uVar4 = 0x3039;
  pHVar2 = GetDesktopWindow();
  pCVar3 = CWnd::FromHandle(pHVar2);
  (**(code **)(iVar1 + 0x54))("QCamera",&DAT_0053d753,&DAT_00cf0000,&local_24,pCVar3,uVar4,uVar5);
  CWnd::ShowWindow(this,5);
  ExceptionList = local_10;
  return;
}

