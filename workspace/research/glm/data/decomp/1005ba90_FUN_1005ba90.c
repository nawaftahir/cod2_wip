// 1005ba90 size=103 FUN_1005ba90

void FUN_1005ba90(float param_1)

{
  float10 fVar1;
  undefined4 *in_EDX;
  float10 fVar2;
  
  fVar1 = (float10)fcos((float10)(param_1 * 0.017453292));
  fVar2 = (float10)fsin((float10)(param_1 * 0.017453292));
  in_EDX[5] = -(float)fVar2;
  in_EDX[1] = 0;
  in_EDX[2] = 0;
  in_EDX[3] = 0;
  in_EDX[6] = 0;
  *in_EDX = 0x3f800000;
  in_EDX[4] = (float)fVar1;
  in_EDX[7] = (float)fVar2;
  in_EDX[8] = (float)fVar1;
  return;
}


