extern int FUN_1010a920();
extern int FUN_1010abb0();


void FUN_100583d0(float *param_1,float *param_2)

{
  float fVar1;
  float fVar2;
  int iVar3;
  float fVar4;
  
  do {
    iVar3 = _rand();
    fVar1 = ((float)iVar3 / 32768.0 + (float)iVar3 / 32768.0) - 1.0;
    iVar3 = _rand();
    fVar2 = ((float)iVar3 / 32768.0 + (float)iVar3 / 32768.0) - 1.0;
  } while (1.0 < fVar1 * fVar1 + fVar2 * fVar2);
  FUN_1010abb0();
  fVar4 = (float)FUN_1010a920();
  *param_1 = (float)fVar4 * fVar1;
  *param_2 = (float)fVar4 * fVar2;
  return;
}


