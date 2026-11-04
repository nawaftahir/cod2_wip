extern int FUN_100f8d40();
extern int FUN_100f8e10();


float FUN_1002c370(float param_1,float param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  double dVar5;
  
  fVar1 = (float)FUN_100f8e10();
  fVar2 = (float)fsin(fVar1);
  fVar2 = ((float)param_1 / (float)param_2) * fVar2;
  dVar5 = (double)fVar2;
  if (fVar2 <= (float)1.0) {
    if (fVar2 < (float)-1.0) {
      dVar5 = -1.0;
    }
  }
  else {
    dVar5 = 1.0;
  }
  fVar2 = (float)FUN_100f8d40(dVar5);
  dVar5 = (double)((float)(double)fVar1 + fVar2);
  fVar2 = (float)(double)fVar1 - fVar2;
  fVar1 = (float)fsin(fVar2);
  fVar3 = (float)fsin((float)dVar5);
  fVar2 = (float)fptan(fVar2);
  fVar4 = (float)fptan((float)dVar5);
  fVar1 = ((fVar1 / fVar3) * (fVar1 / fVar3) + (fVar2 / fVar4) * (fVar2 / fVar4)) * (float)0.5;
  if ((float)0.0 <= fVar1) {
    if ((float)1.0 < fVar1) {
      fVar1 = (float)1.0;
    }
    return fVar1;
  }
  return (float)0.0;
}


