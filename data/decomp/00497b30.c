
void FUN_00497b30(float param_1)

{
  int iVar1;
  float *unaff_EBX;
  float *unaff_ESI;
  float *unaff_EDI;
  
  if ((unaff_EDI == unaff_EBX) && (DAT_0124a4e1 == '\0')) {
    iVar1 = FUN_0047d980("pos != out","\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x61d,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4e1 = '\x01';
    }
  }
  *unaff_EBX = (unaff_ESI[6] * unaff_EDI[1] +
               unaff_ESI[3] * *unaff_EDI + unaff_ESI[9] * unaff_EDI[2]) * param_1 + *unaff_ESI;
  unaff_EBX[1] = (unaff_ESI[7] * unaff_EDI[1] +
                 unaff_ESI[4] * *unaff_EDI + unaff_ESI[10] * unaff_EDI[2]) * param_1 + unaff_ESI[1];
  unaff_EBX[2] = (unaff_ESI[8] * unaff_EDI[1] +
                 unaff_ESI[5] * *unaff_EDI + unaff_ESI[0xb] * unaff_EDI[2]) * param_1 + unaff_ESI[2]
  ;
  return;
}

