
void FUN_004aa310(int param_1)

{
  int iVar1;
  undefined4 *puVar2;
  int unaff_EBX;
  uint uVar3;
  
  if ((unaff_EBX == 0) && (DAT_0124a704 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00555d3c,"\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",0x476,0,1
                        );
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a704 = '\x01';
    }
  }
  if ((param_1 == 0) && (DAT_0124a703 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00555d38,"\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",0x477,0,1
                        );
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a703 = '\x01';
    }
  }
  uVar3 = 4;
  do {
    if ((*(byte *)((int)&DAT_01223300 + uVar3 + 1) & 0xc0) != 0) {
      puVar2 = (undefined4 *)FUN_004a87b0();
      if ((*(byte *)((int)puVar2 + 1) & (byte)unaff_EBX) != 0) {
        *(byte *)((int)puVar2 + 1) = (byte)((uint)*puVar2 >> 8) & ~(byte)unaff_EBX | (byte)param_1;
      }
    }
    uVar3 = uVar3 + 4;
  } while (uVar3 < 0x10000);
  return;
}

