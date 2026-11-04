
int FUN_004986f0(int param_1)

{
  int iVar1;
  int unaff_ESI;
  
  if (((unaff_ESI < 0) || (2 < unaff_ESI)) && (DAT_0124a610 == '\0')) {
    iVar1 = FUN_0047d980("(index >= 0) && (index < 3)",
                         "e:\\trees\\cod2src\\src\\universal\\splines\\math_matrix.h",0x6e,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a610 = 1;
      return param_1 + unaff_ESI * 0xc;
    }
  }
  return param_1 + unaff_ESI * 0xc;
}

