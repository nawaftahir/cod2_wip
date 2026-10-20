
void FUN_00483f40(void)

{
  int iVar1;
  float *unaff_EBX;
  float *unaff_ESI;
  float *unaff_EDI;
  
  if ((unaff_ESI == unaff_EBX) && (DAT_0124a3fb == '\0')) {
    iVar1 = FUN_0047d980("in != out","\\trees\\cod2src\\src\\universal\\com_math.cpp",0x3bd,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3fb = '\x01';
    }
  }
  *unaff_EBX = *unaff_ESI * *unaff_EDI + unaff_EDI[2] * unaff_ESI[2] + unaff_EDI[1] * unaff_ESI[1];
  unaff_EBX[1] = unaff_EDI[5] * unaff_ESI[2] +
                 unaff_EDI[4] * unaff_ESI[1] + unaff_EDI[3] * *unaff_ESI;
  unaff_EBX[2] = unaff_EDI[8] * unaff_ESI[2] +
                 unaff_EDI[7] * unaff_ESI[1] + unaff_EDI[6] * *unaff_ESI;
  return;
}

