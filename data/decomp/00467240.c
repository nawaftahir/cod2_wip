
void FUN_00467240(void)

{
  undefined4 uVar1;
  int iVar2;
  int *unaff_ESI;
  
  if ((unaff_ESI[1] == 0) || (*unaff_ESI == 0)) {
    FUN_0047a760("Entity_UnlinkBrush: Not currently linked");
  }
  if ((unaff_ESI[7] < 1) && (DAT_0124a2e7 == '\0')) {
    uVar1 = FUN_004969e0("%s\n\t(b->refCount) = %i","(b->refCount > 0)",unaff_ESI[7],".\\entity.cpp"
                         ,0x45b,0,1);
    iVar2 = FUN_0047d980(uVar1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a2e7 = '\x01';
    }
  }
  unaff_ESI[7] = unaff_ESI[7] + -1;
  *(int *)unaff_ESI[1] = *unaff_ESI;
  *(int *)(*unaff_ESI + 4) = unaff_ESI[1];
  *unaff_ESI = 0;
  unaff_ESI[1] = 0;
  unaff_ESI[2] = 0;
  return;
}

