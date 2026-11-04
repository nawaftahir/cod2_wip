
void FUN_00494d20(void)

{
  int iVar1;
  undefined4 *unaff_EBX;
  int iVar2;
  undefined4 *unaff_EDI;
  
  iVar2 = DAT_00596d48 * 0x45c;
  if ((unaff_EBX == (undefined4 *)0x0) && (DAT_0124a4d8 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0053fb8c,"\\trees\\cod2src\\src\\universal\\q_parse.cpp",0x165);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4d8 = '\x01';
    }
  }
  if ((unaff_EDI == (undefined4 *)0x0) && (DAT_0124a4d7 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00553924,"\\trees\\cod2src\\src\\universal\\q_parse.cpp",0x166);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4d7 = '\x01';
    }
  }
  *unaff_EDI = *(undefined4 *)(&DAT_00592b88 + iVar2);
  unaff_EDI[1] = *unaff_EBX;
  unaff_EDI[2] = (uint)(byte)(&DAT_00592b8c)[iVar2];
  unaff_EDI[3] = *(undefined4 *)(&DAT_00592b9c + iVar2);
  unaff_EDI[4] = *(undefined4 *)(&DAT_00592ba0 + iVar2);
  return;
}

