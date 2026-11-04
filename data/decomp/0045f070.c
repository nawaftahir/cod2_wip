
void FUN_0045f070(void)

{
  int iVar1;
  int iVar2;
  int unaff_EBX;
  undefined4 *puVar3;
  undefined4 *puVar4;
  int local_c;
  int local_8;
  
  if ((unaff_EBX == 0) && (DAT_0124a228 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054527c,".\\brush.cpp",0x1054,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a228 = '\x01';
    }
  }
  local_c = 0;
  if (0 < *(int *)(unaff_EBX + 0x38)) {
    local_8 = 0;
    do {
      iVar1 = *(int *)(unaff_EBX + 0x3c) + local_8;
      if ((iVar1 == 0) && (DAT_0124a22a == '\0')) {
        iVar2 = FUN_0047d980(&DAT_00546b30,".\\brush.cpp",0x1043,0,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a22a = '\x01';
        }
      }
      puVar3 = (undefined4 *)(DAT_01128d94 * 0x1c + 0x24 + iVar1);
      puVar4 = (undefined4 *)(iVar1 + 0x5c);
      for (iVar2 = 7; iVar2 != 0; iVar2 = iVar2 + -1) {
        *puVar4 = *puVar3;
        puVar3 = puVar3 + 1;
        puVar4 = puVar4 + 1;
      }
      local_c = local_c + 1;
      local_8 = local_8 + 0xa8;
    } while (local_c < *(int *)(unaff_EBX + 0x38));
  }
  if (*(int *)(unaff_EBX + 0x44) != 0) {
    FUN_004393c0();
  }
  return;
}

