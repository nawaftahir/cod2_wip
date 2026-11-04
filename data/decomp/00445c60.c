
void __fastcall FUN_00445c60(HWND param_1)

{
  HWND pHVar1;
  HWND pHVar2;
  int *piVar3;
  int iVar4;
  LPCWSTR unaff_EDI;
  HWND local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005263d8;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  local_14 = param_1;
  piVar3 = (int *)FUN_004ff4c3();
  iVar4 = (**(code **)(*piVar3 + 0xc))();
  local_14 = (HWND)(iVar4 + 0x10);
  local_8 = 0;
  SendMessageA((HWND)param_1[0x73].unused,0x405,1,0x2c);
  FUN_004075c0(&local_14,&DAT_00545f4c,0x2c);
  pHVar2 = local_14;
  FID_conflict_SetWindowTextW(local_14,unaff_EDI);
  FUN_00445420();
  pHVar1 = pHVar2 + -4;
  local_8 = 0xffffffff;
  pHVar2 = pHVar2 + -1;
  LOCK();
  iVar4 = pHVar2->unused;
  pHVar2->unused = pHVar2->unused + -1;
  UNLOCK();
  if (iVar4 == 1 || iVar4 + -1 < 0) {
    (**(code **)(*(int *)pHVar1->unused + 4))(pHVar1);
  }
  ExceptionList = local_10;
  return;
}

