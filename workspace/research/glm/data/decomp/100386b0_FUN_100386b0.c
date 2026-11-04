// 100386b0 size=282 FUN_100386b0

uint FUN_100386b0(void)

{
  uint uVar1;
  int *piVar2;
  bool bVar3;
  int iVar4;
  int in_EAX;
  undefined4 uVar5;
  int iVar6;
  undefined4 uVar7;
  undefined4 unaff_ESI;
  undefined1 local_4 [4];
  
  iVar4 = in_EAX * 2;
  bVar3 = (int)DAT_101d497c[1] < (int)(*DAT_101d497c + iVar4);
  if (bVar3) {
    *DAT_101d497c = 0;
  }
  if (*DAT_101d497c == 0) {
    DAT_101d497c = &DAT_101d4970;
  }
  uVar1 = *DAT_101d497c;
  piVar2 = (int *)DAT_101d497c[2];
  if ((bVar3) || ((DAT_101d4810 == 0 && (uVar1 == 0)))) {
    uVar5 = 0x2000;
  }
  else {
    uVar5 = 0x1000;
  }
  iVar6 = (**(code **)(*piVar2 + 0x2c))(piVar2,uVar1,iVar4,local_4,uVar5);
  if (iVar6 < 0) {
    (*(code *)RI_Printf)
              (0,
               "********** DirectX failed a call to lock a vertex buffer or an index buffer **********\n"
              );
    uVar7 = FUN_100efe3c(iVar6);
    (*(code *)RI_Printf)(0,"********** error information:  %s\n",uVar7);
    (*(code *)RI_Sys_DirectXFatalError)();
  }
  FUN_1005eaf0(uVar5,unaff_ESI,iVar4);
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dxIb->Unlock()\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*piVar2 + 0x30))(piVar2);
  } while (DAT_1076a830 != 0);
  if (DAT_1076674c != piVar2) {
    FUN_1003ecb0();
  }
  *DAT_101d497c = *DAT_101d497c + iVar4;
  return uVar1 >> 1;
}


