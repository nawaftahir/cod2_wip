// 1003abd0 size=110 FUN_1003abd0

float10 FUN_1003abd0(float param_1,float param_2,int param_3,int param_4,int param_5)

{
  if (param_2 <= param_1) {
    if ((param_1 <= param_2) ||
       ((0 < param_4 && (param_1 = param_1 - (float)param_5 / (float)param_4, param_2 <= param_1))))
    goto LAB_1003ac39;
  }
  else if ((0 < param_3) &&
          (param_1 = (float)param_5 / (float)param_3 + param_1, param_1 <= param_2)) {
LAB_1003ac39:
    return (float10)param_1;
  }
  return (float10)param_2;
}


