
void FUN_004863e0(void)

{
  int iVar1;
  float *unaff_EBX;
  float *unaff_ESI;
  float *unaff_EDI;
  
  if ((unaff_EDI == unaff_EBX) && (DAT_0124a3e0 == '\0')) {
    iVar1 = FUN_0047d980("in1 != out","\\trees\\cod2src\\src\\universal\\com_math.cpp",0x775,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3e0 = '\x01';
    }
  }
  *unaff_EBX = *unaff_EDI * *unaff_ESI + unaff_ESI[6] * unaff_EDI[2] + unaff_ESI[3] * unaff_EDI[1] +
               unaff_ESI[9];
  unaff_EBX[1] = unaff_ESI[7] * unaff_EDI[2] +
                 unaff_ESI[4] * unaff_EDI[1] + unaff_ESI[1] * *unaff_EDI + unaff_ESI[10];
  unaff_EBX[2] = unaff_ESI[8] * unaff_EDI[2] +
                 unaff_ESI[5] * unaff_EDI[1] + unaff_ESI[2] * *unaff_EDI + unaff_ESI[0xb];
  return;
}

