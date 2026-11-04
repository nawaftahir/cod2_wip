// 1002c370 size=201 FUN_1002c370

float10 FUN_1002c370(float param_1,float param_2)

{
  float10 fVar1;
  float10 fVar2;
  float10 fVar3;
  float10 fVar4;
  double dVar5;
  
  fVar1 = (float10)FUN_100f8e10();
  fVar2 = (float10)fsin(fVar1);
  fVar2 = ((float10)param_1 / (float10)param_2) * fVar2;
  dVar5 = (double)fVar2;
  if (fVar2 <= (float10)1.0) {
    if (fVar2 < (float10)-1.0) {
      dVar5 = -1.0;
    }
  }
  else {
    dVar5 = 1.0;
  }
  fVar2 = (float10)FUN_100f8d40(dVar5);
  dVar5 = (double)((float10)(double)fVar1 + fVar2);
  fVar2 = (float10)(double)fVar1 - fVar2;
  fVar1 = (float10)fsin(fVar2);
  fVar3 = (float10)fsin((float10)dVar5);
  fVar2 = (float10)fptan(fVar2);
  fVar4 = (float10)fptan((float10)dVar5);
  fVar1 = ((fVar1 / fVar3) * (fVar1 / fVar3) + (fVar2 / fVar4) * (fVar2 / fVar4)) * (float10)0.5;
  if ((float10)0.0 <= fVar1) {
    if ((float10)1.0 < fVar1) {
      fVar1 = (float10)1.0;
    }
    return fVar1;
  }
  return (float10)0.0;
}


