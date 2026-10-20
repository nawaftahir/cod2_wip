
undefined4 __thiscall FUN_0045f860(float *param_1,float param_2)

{
  float fVar1;
  int in_EAX;
  int iVar2;
  int iVar3;
  
  iVar2 = 0;
  iVar3 = in_EAX - (int)param_1;
  do {
    fVar1 = *(float *)((int)param_1 + iVar3) - *param_1;
    if (param_2 * param_2 < fVar1 * fVar1) {
      return 0;
    }
    iVar2 = iVar2 + 1;
    param_1 = param_1 + 1;
  } while (iVar2 < 3);
  return 1;
}

