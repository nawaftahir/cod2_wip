// 10059d80 size=347 FUN_10059d80

undefined1 * FUN_10059d80(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float10 fVar7;
  undefined1 *puVar8;
  float *in_EDX;
  float *unaff_EBX;
  float *unaff_ESI;
  float *unaff_EDI;
  float10 fVar9;
  undefined1 local_1c [8];
  undefined1 local_14 [20];
  
  fVar7 = (float10)fcos((float10)(in_EDX[1] * 0.017453292));
  fVar9 = (float10)fsin((float10)(in_EDX[1] * 0.017453292));
  fVar1 = (float)fVar7;
  fVar2 = (float)fVar9;
  puVar8 = local_14;
  fVar7 = (float10)fcos((float10)(*in_EDX * 0.017453292));
  fVar9 = (float10)fsin((float10)(*in_EDX * 0.017453292));
  fVar3 = (float)fVar7;
  fVar4 = (float)fVar9;
  if (unaff_ESI != (float *)0x0) {
    *unaff_ESI = fVar3 * fVar1;
    unaff_ESI[1] = fVar3 * fVar2;
    unaff_ESI[2] = -fVar4;
  }
  if ((unaff_EDI != (float *)0x0) || (unaff_EBX != (float *)0x0)) {
    puVar8 = local_1c;
    fVar7 = (float10)fcos((float10)(in_EDX[2] * 0.017453292));
    fVar9 = (float10)fsin((float10)(in_EDX[2] * 0.017453292));
    fVar5 = (float)fVar7;
    fVar6 = (float)fVar9;
    if (unaff_EDI != (float *)0x0) {
      *unaff_EDI = fVar5 * fVar2 - fVar6 * fVar4 * fVar1;
      unaff_EDI[1] = fVar5 * fVar1 * -1.0 - fVar6 * fVar4 * fVar2;
      unaff_EDI[2] = fVar6 * fVar3 * -1.0;
    }
    if (unaff_EBX != (float *)0x0) {
      *unaff_EBX = fVar6 * fVar2 + fVar5 * fVar4 * fVar1;
      unaff_EBX[1] = fVar5 * fVar4 * fVar2 - fVar6 * fVar1;
      unaff_EBX[2] = fVar5 * fVar3;
    }
  }
  return puVar8;
}


