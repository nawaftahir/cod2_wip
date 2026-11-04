
void FUN_00486480(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  int iVar4;
  float *unaff_EBX;
  float *unaff_ESI;
  float *unaff_EDI;
  
  if ((unaff_EBX == unaff_EDI) && (DAT_0124a3df == '\0')) {
    iVar4 = FUN_0047d980("in1 != out","\\trees\\cod2src\\src\\universal\\com_math.cpp",0x785,0,1);
    if (iVar4 == 0) {
      DebugBreak();
    }
    else if (iVar4 == 2) {
      DAT_0124a3df = '\x01';
    }
  }
  fVar1 = *unaff_EBX - unaff_ESI[9];
  fVar2 = unaff_EBX[1] - unaff_ESI[10];
  fVar3 = unaff_EBX[2] - unaff_ESI[0xb];
  *unaff_EDI = fVar1 * *unaff_ESI + fVar2 * unaff_ESI[1] + fVar3 * unaff_ESI[2];
  unaff_EDI[1] = fVar1 * unaff_ESI[3] + fVar2 * unaff_ESI[4] + fVar3 * unaff_ESI[5];
  unaff_EDI[2] = fVar1 * unaff_ESI[6] + fVar2 * unaff_ESI[7] + fVar3 * unaff_ESI[8];
  return;
}

