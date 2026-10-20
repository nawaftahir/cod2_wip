
void FUN_00485980(void)

{
  int iVar1;
  undefined4 *unaff_ESI;
  undefined4 *unaff_EDI;
  
  if ((unaff_EDI == unaff_ESI) && (DAT_0124a3e9 == '\0')) {
    iVar1 = FUN_0047d980("in != out","\\trees\\cod2src\\src\\universal\\com_math.cpp",0x692,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3e9 = '\x01';
    }
  }
  *unaff_ESI = *unaff_EDI;
  unaff_ESI[1] = unaff_EDI[3];
  unaff_ESI[2] = unaff_EDI[6];
  unaff_ESI[3] = unaff_EDI[1];
  unaff_ESI[4] = unaff_EDI[4];
  unaff_ESI[5] = unaff_EDI[7];
  unaff_ESI[6] = unaff_EDI[2];
  unaff_ESI[7] = unaff_EDI[5];
  unaff_ESI[8] = unaff_EDI[8];
  return;
}

