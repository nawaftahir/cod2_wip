// 1002f110 size=331 FUN_1002f110

void FUN_1002f110(void)

{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  undefined1 *in_EAX;
  int iVar4;
  int in_ECX;
  undefined1 *unaff_EDI;
  int iVar5;
  int in_stack_00000014;
  int *piVar6;
  int iStack_38;
  int iStack_34;
  int iStack_8;
  
  iStack_34 = 0;
  uVar1 = 0x16;
  iVar4 = (**(code **)(*DAT_101d1bf8 + 0x90))(DAT_101d1bf8,in_stack_00000014);
  if (-1 < iVar4) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","rawSurf->LockRect( &lockedRect, 0, 0x00002000L )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(iRam00000000 + 0x34))(0,&iStack_34,0,0x2000);
    } while (DAT_1076a830 != 0);
    iVar4 = in_stack_00000014 * -4;
    iStack_38 = in_ECX;
    if (0 < in_ECX) {
      do {
        iVar5 = in_stack_00000014;
        if (0 < in_stack_00000014) {
          do {
            uVar1 = in_EAX[1];
            uVar2 = in_EAX[3];
            uVar3 = in_EAX[2];
            unaff_EDI[2] = *in_EAX;
            unaff_EDI[1] = uVar1;
            *unaff_EDI = uVar3;
            unaff_EDI[3] = uVar2;
            in_EAX = in_EAX + 4;
            unaff_EDI = unaff_EDI + 4;
            iVar5 = iVar5 + -1;
            in_stack_00000014 = iStack_8;
          } while (iVar5 != 0);
        }
        unaff_EDI = unaff_EDI + iStack_34 + iVar4;
        iStack_38 = iStack_38 + -1;
      } while (iStack_38 != 0);
    }
    (**(code **)(iRam00000000 + 0x38))(0);
    piVar6 = (int *)0x2;
    (**(code **)(*DAT_101d1bf8 + 0x88))(DAT_101d1bf8,uVar1,0,DAT_101d4824,&stack0xffffffd0);
    (**(code **)(*piVar6 + 8))(piVar6);
  }
  return;
}


