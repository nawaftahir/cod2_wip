
void FUN_004432a0(void)

{
  undefined4 uVar1;
  int iVar2;
  int *unaff_ESI;
  
  if ((unaff_ESI[7] < 1) && (DAT_0124a206 == '\0')) {
    uVar1 = FUN_004969e0("%s\n\t(brush->refCount) = %i","(brush->refCount >= 1)",unaff_ESI[7],
                         ".\\Undo.cpp",0x62,0,1);
    iVar2 = FUN_0047d980(uVar1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a206 = '\x01';
    }
  }
  unaff_ESI[7] = unaff_ESI[7] + -1;
  if ((unaff_ESI[1] == 0) && (DAT_0124a205 == '\0')) {
    iVar2 = FUN_0047d980("brush->onext",".\\Undo.cpp",0x65,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a205 = '\x01';
    }
  }
  if ((*unaff_ESI == 0) && (DAT_0124a204 == '\0')) {
    iVar2 = FUN_0047d980("brush->oprev",".\\Undo.cpp",0x66,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a204 = '\x01';
    }
  }
  *(int *)unaff_ESI[1] = *unaff_ESI;
  *(int *)(*unaff_ESI + 4) = unaff_ESI[1];
  unaff_ESI[1] = 0;
  *unaff_ESI = 0;
  return;
}

