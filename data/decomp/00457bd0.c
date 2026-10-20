
void FUN_00457bd0(void)

{
  char cVar1;
  int iVar2;
  int iVar3;
  undefined4 extraout_EDX;
  int unaff_ESI;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  if ((unaff_ESI == 0) && (DAT_0124a27d == '\0')) {
    iVar2 = FUN_0047d980(&DAT_0054527c,".\\brush.cpp",0x58e);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a27d = '\x01';
    }
  }
  iVar2 = *(int *)(unaff_ESI + 8);
  if (((iVar2 == 0) || (*(int *)(iVar2 + 0x50) == 0)) || (*(int *)(*(int *)(iVar2 + 0x50) + 8) == 0)
     ) {
    local_18 = 0x3f800000;
    local_14 = 0x3f800000;
    local_10 = 0x3f800000;
    local_c = 0x3f800000;
  }
  else {
    cVar1 = FUN_00465d80();
    if (cVar1 == '\0') {
      local_18 = *(undefined4 *)(*(int *)(iVar2 + 0x50) + 0x24);
      local_14 = *(undefined4 *)(*(int *)(iVar2 + 0x50) + 0x28);
      local_10 = *(undefined4 *)(*(int *)(iVar2 + 0x50) + 0x2c);
      local_c = *(undefined4 *)(*(int *)(iVar2 + 0x50) + 0x30);
    }
    else {
      FUN_00465d50(iVar2,extraout_EDX);
      local_c = 0x3f800000;
    }
  }
  (*DAT_0059c468)(&local_18,&local_8);
  iVar2 = 0;
  if (0 < *(int *)(unaff_ESI + 0x38)) {
    iVar3 = 0;
    do {
      *(undefined4 *)(iVar3 + 0xa4 + *(int *)(unaff_ESI + 0x3c)) = local_8;
      iVar2 = iVar2 + 1;
      iVar3 = iVar3 + 0xa8;
    } while (iVar2 < *(int *)(unaff_ESI + 0x38));
  }
  *(short *)(unaff_ESI + 0x42) = *(short *)(unaff_ESI + 0x42) + 1;
  return;
}

