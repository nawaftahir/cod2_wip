
void FUN_00497950(void)

{
  int iVar1;
  float *unaff_EBX;
  float *unaff_ESI;
  int unaff_EDI;
  
  if ((unaff_ESI == unaff_EBX) && (DAT_0124a4e5 == '\0')) {
    iVar1 = FUN_0047d980("dir != out","\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x600,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4e5 = '\x01';
    }
  }
  *unaff_EBX = *(float *)(unaff_EDI + 0x10) * unaff_ESI[1] +
               *(float *)(unaff_EDI + 0xc) * *unaff_ESI +
               *(float *)(unaff_EDI + 0x14) * unaff_ESI[2];
  unaff_EBX[1] = *(float *)(unaff_EDI + 0x1c) * unaff_ESI[1] +
                 *(float *)(unaff_EDI + 0x18) * *unaff_ESI +
                 *(float *)(unaff_EDI + 0x20) * unaff_ESI[2];
  unaff_EBX[2] = *(float *)(unaff_EDI + 0x28) * unaff_ESI[1] +
                 *(float *)(unaff_EDI + 0x24) * *unaff_ESI +
                 *(float *)(unaff_EDI + 0x2c) * unaff_ESI[2];
  return;
}

