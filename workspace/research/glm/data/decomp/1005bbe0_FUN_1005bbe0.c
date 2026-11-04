// 1005bbe0 size=128 FUN_1005bbe0

void FUN_1005bbe0(undefined4 param_1,undefined4 param_2,float param_3)

{
  int iVar1;
  float *unaff_ESI;
  float *pfVar2;
  float10 fVar3;
  
  pfVar2 = unaff_ESI;
  for (iVar1 = 0x10; iVar1 != 0; iVar1 = iVar1 + -1) {
    *pfVar2 = 0.0;
    pfVar2 = pfVar2 + 1;
  }
  fVar3 = (float10)FUN_1010a9e0();
  *unaff_ESI = (float)fVar3 * 0.9995003;
  fVar3 = (float10)FUN_1010a9e0();
  unaff_ESI[10] = 0.9995003;
  unaff_ESI[0xb] = 1.0;
  unaff_ESI[5] = (float)fVar3 * 0.9995003;
  unaff_ESI[0xe] = param_3 * -0.9995003;
  return;
}


