
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_00486940(void)

{
  float fVar1;
  float fVar2;
  int iVar3;
  float *unaff_ESI;
  float10 fVar4;
  
  fVar1 = *unaff_ESI * *unaff_ESI;
  fVar2 = unaff_ESI[1] * unaff_ESI[1] + fVar1;
  if ((fVar2 == _DAT_00556a70) && (DAT_0124a3dd == '\0')) {
    iVar3 = FUN_0047d980(&DAT_0054f074,"\\trees\\cod2src\\src\\universal\\com_math.cpp",0x84e,0,1);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a3dd = '\x01';
    }
  }
  fVar2 = _DAT_00556ab0 / fVar2;
  fVar4 = (float10)FUN_004d8070((double)(unaff_ESI[1] * *unaff_ESI * fVar2),
                                (double)(_DAT_00556a58 - fVar2 * fVar1));
  return (float10)(float)fVar4 * (float10)_DAT_00556c64;
}

