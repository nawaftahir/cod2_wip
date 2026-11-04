
void FUN_00452ca0(HWND param_1)

{
  HWND pHVar1;
  int iVar2;
  int unaff_ESI;
  char *pcVar3;
  LPCWSTR lpString;
  
  lpString = ExceptionList;
  iVar2 = DAT_01233488;
  ExceptionList = &stack0xfffffff0;
  *(HWND *)(unaff_ESI + 0xf4) = param_1;
  if (*(int *)(iVar2 + 0x7a0) != 1) {
    ExceptionList = lpString;
    return;
  }
  FUN_00407860("YZ Side");
  if (*(int *)(unaff_ESI + 0xf4) == 2) {
    pcVar3 = "XY Top";
  }
  else {
    if (*(int *)(unaff_ESI + 0xf4) != 1) goto LAB_00452d0a;
    pcVar3 = "XZ Front";
  }
  FUN_00402a70(pcVar3);
LAB_00452d0a:
  FID_conflict_SetWindowTextW(param_1,lpString);
  pHVar1 = param_1 + -1;
  LOCK();
  iVar2 = pHVar1->unused;
  pHVar1->unused = pHVar1->unused + -1;
  UNLOCK();
  if (iVar2 == 1 || iVar2 + -1 < 0) {
    (**(code **)(*(int *)param_1[-4].unused + 4))(param_1 + -4);
  }
  ExceptionList = lpString;
  return;
}

