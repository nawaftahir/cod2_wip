
void __fastcall FUN_00479820(char *param_1)

{
  int *piVar1;
  int iVar2;
  AFX_MODULE_STATE *pAVar3;
  char *pcVar4;
  int iVar5;
  char *local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525618;
  local_10 = ExceptionList;
  iVar5 = 0;
  ExceptionList = &local_10;
  local_14 = param_1;
  do {
    if ((&DAT_01129a38)[iVar5] != (&DAT_01129a78)[iVar5]) {
      piVar1 = (int *)FUN_004ff4c3();
      iVar2 = (**(code **)(*piVar1 + 0xc))();
      local_14 = (char *)(iVar2 + 0x10);
      local_8 = 0;
      FUN_004075c0(&local_14,&DAT_00547f50,iVar5);
      if ((&DAT_01129a78)[iVar5] == 0xffffff) {
        pAVar3 = AfxGetModuleState();
        pcVar4 = local_14;
        CWinApp::WriteProfileStringA(*(CWinApp **)(pAVar3 + 4),"Custom Colors",local_14,(char *)0x0)
        ;
      }
      else {
        pAVar3 = AfxGetModuleState();
        pcVar4 = local_14;
        CWinApp::WriteProfileInt
                  (*(CWinApp **)(pAVar3 + 4),"Custom Colors",local_14,(&DAT_01129a78)[iVar5]);
      }
      (&DAT_01129a38)[iVar5] = (&DAT_01129a78)[iVar5];
      local_8 = 0xffffffff;
      piVar1 = (int *)(pcVar4 + -4);
      LOCK();
      iVar2 = *piVar1;
      *piVar1 = *piVar1 + -1;
      UNLOCK();
      if (iVar2 == 1 || iVar2 + -1 < 0) {
        (**(code **)(**(int **)(pcVar4 + -0x10) + 4))(pcVar4 + -0x10);
      }
    }
    iVar5 = iVar5 + 1;
  } while (iVar5 < 0x10);
  ExceptionList = local_10;
  return;
}

