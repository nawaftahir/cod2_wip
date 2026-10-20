
undefined4 FUN_004ac8d0(void)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  int unaff_EDI;
  
  if ((unaff_EDI == 0) && (DAT_0124a737 == '\0')) {
    iVar1 = FUN_0047d980("model","\\trees\\cod2src\\src\\xanim\\xmodel_load_obj.cpp",0x292,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a737 = '\x01';
    }
  }
  puVar3 = (undefined4 *)(unaff_EDI + 8);
  if ((**(char **)(unaff_EDI + 8) == '\0') && (DAT_0124a736 == '\0')) {
    iVar1 = FUN_0047d980("model->lodInfo[0].filename[0]",
                         "\\trees\\cod2src\\src\\xanim\\xmodel_load_obj.cpp",0x293,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a736 = '\x01';
    }
  }
  iVar1 = 0;
  while( true ) {
    if (*(char *)*puVar3 == '\0') {
      return 1;
    }
    iVar2 = FUN_004ac860();
    puVar3[3] = iVar2;
    if (iVar2 == 0) break;
    iVar1 = iVar1 + 1;
    puVar3 = puVar3 + 5;
    if (3 < iVar1) {
      return 1;
    }
  }
  return 0;
}

