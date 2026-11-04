// 10059ee0 size=100 FUN_10059ee0

void FUN_10059ee0(float param_1)

{
  float10 fVar1;
  float *in_EDX;
  float *unaff_ESI;
  float10 fVar2;
  
  fVar1 = (float10)fcos((float10)(param_1 * 0.017453292));
  fVar2 = (float10)fsin((float10)(param_1 * 0.017453292));
  if (in_EDX != (float *)0x0) {
    *in_EDX = (float)fVar1;
    in_EDX[1] = (float)fVar2;
    in_EDX[2] = 0.0;
  }
  if (unaff_ESI != (float *)0x0) {
    *unaff_ESI = (float)fVar2;
    unaff_ESI[2] = 0.0;
    unaff_ESI[1] = -(float)fVar1;
  }
  return;
}


