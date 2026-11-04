// 100387d0 size=282 FUN_100387d0

void FUN_100387d0(void)

{
  int *piVar1;
  int in_EAX;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  int in_ECX;
  undefined4 unaff_EBP;
  int unaff_ESI;
  undefined1 local_4 [4];
  
  iVar2 = in_EAX * in_ECX;
  piVar1 = (int *)DAT_101d49a4[2];
  iVar3 = (-(uint)(*DAT_101d49a4 != 0) & 0xfffff000) + 0x2000;
  iVar4 = (**(code **)(*piVar1 + 0x2c))(piVar1,*DAT_101d49a4,iVar2,local_4,iVar3);
  if (iVar4 < 0) {
    (*(code *)RI_Printf)
              (0,
               "********** DirectX failed a call to lock a vertex buffer or an index buffer **********\n"
              );
    uVar5 = FUN_100efe3c(iVar4);
    (*(code *)RI_Printf)(0,"********** error information:  %s\n",uVar5);
    (*(code *)RI_Sys_DirectXFatalError)();
  }
  FUN_1005eaf0(iVar3,unaff_EBP,iVar2);
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dxVb->Unlock()\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*piVar1 + 0x30))(piVar1);
  } while (DAT_1076a830 != 0);
  if ((((int *)(&DAT_10766750)[unaff_ESI * 3] == piVar1) &&
      ((&DAT_10766754)[unaff_ESI * 3] == *DAT_101d49a4)) &&
     ((&DAT_10766758)[unaff_ESI * 3] == in_ECX)) {
    *DAT_101d49a4 = *DAT_101d49a4 + iVar2;
    return;
  }
  FUN_1003ed20(piVar1);
  *DAT_101d49a4 = *DAT_101d49a4 + iVar2;
  return;
}


