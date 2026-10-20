
void __fastcall FUN_00488b70(undefined4 param_1)

{
  float fVar1;
  int iVar2;
  undefined4 uVar3;
  float *unaff_EBX;
  float *unaff_ESI;
  float *unaff_EDI;
  
  iVar2 = FUN_00482600(param_1);
  if ((iVar2 == 0) && (DAT_0124a3c6 == '\0')) {
    uVar3 = FUN_004969e0("%g %g %g",(double)*unaff_ESI,(double)unaff_ESI[1],(double)unaff_ESI[2],
                         "\\trees\\cod2src\\src\\universal\\com_math.cpp",0xca3,0,1);
    FUN_004969e0("%s\n\t%s","Vec3IsNormalized( normal )",uVar3);
    iVar2 = FUN_0047d980();
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a3c6 = '\x01';
    }
  }
  fVar1 = -(unaff_ESI[2] * unaff_EDI[2] + unaff_EDI[1] * unaff_ESI[1] + *unaff_EDI * *unaff_ESI);
  *unaff_EBX = fVar1 * *unaff_ESI + *unaff_EDI;
  unaff_EBX[1] = fVar1 * unaff_ESI[1] + unaff_EDI[1];
  unaff_EBX[2] = fVar1 * unaff_ESI[2] + unaff_EDI[2];
  return;
}

