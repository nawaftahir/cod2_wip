// 1005b950 size=69 FUN_1005b950

float * FUN_1005b950(float param_1)

{
  float10 fVar1;
  undefined4 *in_EAX;
  float10 fVar2;
  
  *in_EAX = 0;
  in_EAX[2] = 0;
  fVar1 = (float10)fcos((float10)(param_1 * 0.008726646));
  fVar2 = (float10)fsin((float10)(param_1 * 0.008726646));
  in_EAX[3] = (float)fVar1;
  in_EAX[1] = (float)fVar2;
  return (float *)(in_EAX + 1);
}


