
void FUN_004671b0(void)

{
  int *piVar1;
  int *in_EAX;
  undefined4 uVar2;
  int iVar3;
  int unaff_EDI;
  
  if ((*in_EAX != 0) || (in_EAX[1] != 0)) {
    FUN_0047a760("Entity_LinkBrush: Allready linked");
  }
  in_EAX[2] = unaff_EDI;
  if ((in_EAX[7] < 0) && (DAT_0124a2e8 == '\0')) {
    uVar2 = FUN_004969e0("%s\n\t(b->refCount) = %i","(b->refCount >= 0)",in_EAX[7],".\\entity.cpp",
                         0x449,0,1);
    iVar3 = FUN_0047d980(uVar2);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a2e8 = '\x01';
    }
  }
  in_EAX[7] = in_EAX[7] + 1;
  piVar1 = (int *)(unaff_EDI + 8);
  in_EAX[1] = (int)piVar1;
  *in_EAX = *piVar1;
  *(int **)(*piVar1 + 4) = in_EAX;
  *piVar1 = (int)in_EAX;
  FUN_00457bd0();
  return;
}

