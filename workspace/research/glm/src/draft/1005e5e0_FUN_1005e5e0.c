


float FUN_1005e5e0(float param_1,float param_2,float param_3)

{
  float fVar1;
  unsigned int uVar2;
  int iVar3;
  
  uVar2 = (unsigned int)param_1 & 0xfff;
  if (uVar2 < 5) {
    iVar3 = -uVar2;
  }
  else {
    if (4 < (int)(0x1000 - uVar2)) goto LAB_1005e614;
    iVar3 = 0x1000 - uVar2;
  }
  param_1 = (float)((int)param_1 + iVar3);
LAB_1005e614:
  param_2 = (float)(int)ROUND(param_1 * param_2 + 9.313226e-10) / param_2;
  fVar1 = ABS(param_2 - param_1);
  if (fVar1 < param_3 != (fVar1 == param_3)) {
    return (float)param_2;
  }
  return (float)param_1;
}


