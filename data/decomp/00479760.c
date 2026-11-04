
void __fastcall FUN_00479760(char *param_1)

{
  char *pcVar1;
  char *pcVar2;
  int *piVar3;
  int iVar4;
  AFX_MODULE_STATE *pAVar5;
  uint uVar6;
  int iVar7;
  char *local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525638;
  local_10 = ExceptionList;
  iVar7 = 0;
  ExceptionList = &local_10;
  local_14 = param_1;
  do {
    piVar3 = (int *)FUN_004ff4c3();
    iVar4 = (**(code **)(*piVar3 + 0xc))();
    local_14 = (char *)(iVar4 + 0x10);
    local_8 = 0;
    FUN_004075c0(&local_14,&DAT_00547f50,iVar7);
    pAVar5 = AfxGetModuleState();
    pcVar2 = local_14;
    uVar6 = CWinApp::GetProfileIntA(*(CWinApp **)(pAVar5 + 4),"Custom Colors",local_14,0xffffff);
    (&DAT_01129a78)[iVar7] = uVar6;
    (&DAT_01129a38)[iVar7] = uVar6;
    pcVar1 = pcVar2 + -0x10;
    local_8 = 0xffffffff;
    piVar3 = (int *)(pcVar2 + -4);
    LOCK();
    iVar4 = *piVar3;
    *piVar3 = *piVar3 + -1;
    UNLOCK();
    if (iVar4 == 1 || iVar4 + -1 < 0) {
      (**(code **)(**(int **)pcVar1 + 4))(pcVar1);
    }
    iVar7 = iVar7 + 1;
  } while (iVar7 < 0x10);
  DAT_00591d84 = 0;
  ExceptionList = local_10;
  return;
}

