// 1003a9d0 size=501 FUN_1003a9d0

undefined4 FUN_1003a9d0(void)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 unaff_EDI;
  undefined1 auStack_4 [4];
  
  piVar1 = DAT_107645b4;
  if (DAT_107645b4 == (int *)0x0) {
    return 0;
  }
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dx.device->BeginScene()\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0xa4))(DAT_101d1bf8);
  } while (DAT_1076a830 != 0);
  FUN_1002fe70(&DAT_10191488,0x3f800000,0);
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","occlusionQuery->Issue( (1 << 1) )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*piVar1 + 0x18))(piVar1,2);
  } while (DAT_1076a830 != 0);
  FUN_1002e850(0,0,0x41800000,0x41800000,0,0,0x3f800000,0x3f800000);
  FUN_1003a8d0();
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","occlusionQuery->Issue( (1 << 0) )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*piVar1 + 0x18))(piVar1,1);
  } while (DAT_1076a830 != 0);
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dx.device->EndScene()\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0xa8))(DAT_101d1bf8);
  } while (DAT_1076a830 != 0);
  iVar2 = (**(code **)(*piVar1 + 0x1c))(piVar1,auStack_4,4,1);
  while (iVar2 == 1) {
    Sleep(0);
    iVar2 = (**(code **)(*piVar1 + 0x1c))(piVar1,&stack0xffffffec,4,1);
  }
  uVar3 = 0x100;
  if (iVar2 == 0) {
    uVar3 = unaff_EDI;
  }
  return uVar3;
}


