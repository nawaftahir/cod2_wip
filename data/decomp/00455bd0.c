
void FUN_00455bd0(int param_1)

{
  int iVar1;
  int iVar2;
  int unaff_EBX;
  undefined4 *puVar3;
  undefined4 *puVar4;
  
  if ((unaff_EBX == 0) && (DAT_0124a28f == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054527c,".\\brush.cpp",0x2d6,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a28f = '\x01';
    }
  }
  if (((param_1 < 0) || (*(int *)(unaff_EBX + 0x38) <= param_1)) && (DAT_0124a28e == '\0')) {
    iVar1 = FUN_0047d980("faceIndex >= 0 && faceIndex < b->faceCount",".\\brush.cpp",0x2d7,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a28e = '\x01';
    }
  }
  iVar1 = param_1 * 0xa8;
  FUN_00453e30();
  iVar2 = *(int *)(unaff_EBX + 0x38) + -1;
  *(int *)(unaff_EBX + 0x38) = iVar2;
  if (param_1 < iVar2) {
    do {
      puVar4 = (undefined4 *)(*(int *)(unaff_EBX + 0x3c) + iVar1);
      puVar3 = puVar4 + 0x2a;
      for (iVar2 = 0x2a; iVar2 != 0; iVar2 = iVar2 + -1) {
        *puVar4 = *puVar3;
        puVar3 = puVar3 + 1;
        puVar4 = puVar4 + 1;
      }
      param_1 = param_1 + 1;
      iVar1 = iVar1 + 0xa8;
    } while (param_1 < *(int *)(unaff_EBX + 0x38));
  }
  return;
}

