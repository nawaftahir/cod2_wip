
void FUN_00455060(uint *param_1,uint *param_2)

{
  float fVar1;
  uint uVar2;
  float *unaff_EDI;
  double dVar3;
  double dVar4;
  
  fVar1 = *unaff_EDI;
  dVar3 = _fabs((double)unaff_EDI[1]);
  dVar4 = _fabs((double)fVar1);
  uVar2 = (uint)((float)dVar4 < (float)dVar3);
  fVar1 = unaff_EDI[uVar2];
  dVar3 = _fabs((double)unaff_EDI[2]);
  dVar4 = _fabs((double)fVar1);
  if ((float)dVar4 < (float)dVar3) {
    uVar2 = 2;
  }
  *param_1 = ~uVar2 & 1;
  *param_2 = ~uVar2 & 2;
  return;
}

