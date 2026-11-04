
void FUN_00485040(void)

{
  int iVar1;
  undefined4 *unaff_ESI;
  
  if ((unaff_ESI == (undefined4 *)0x0) && (DAT_0124a3f1 == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_00551964,"\\trees\\cod2src\\src\\universal\\com_math.cpp",0x5d8);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3f1 = '\x01';
    }
  }
  *unaff_ESI = 0;
  unaff_ESI[1] = 0;
  unaff_ESI[2] = 0;
  unaff_ESI[3] = 0;
  unaff_ESI[4] = 0;
  unaff_ESI[5] = 0;
  unaff_ESI[6] = 0;
  unaff_ESI[7] = 0;
  unaff_ESI[8] = 0;
  *unaff_ESI = 0x3f800000;
  unaff_ESI[4] = 0x3f800000;
  unaff_ESI[8] = 0x3f800000;
  return;
}

