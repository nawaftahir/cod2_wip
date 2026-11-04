// 1005dc70 size=240 FUN_1005dc70

undefined4 FUN_1005dc70(float param_1,float param_2,float param_3,float param_4,float param_5)

{
  ushort uVar1;
  float *unaff_EBX;
  float *unaff_EDI;
  float10 fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  
  fVar3 = *unaff_EBX - *unaff_EDI;
  fVar4 = unaff_EBX[1] - unaff_EDI[1];
  fVar5 = unaff_EBX[2] - unaff_EDI[2];
  fVar2 = (float10)FUN_10059140();
  param_1 = (float)fVar2 - param_1;
  if (((param_1 * param_1 <= param_2 * param_2) && (unaff_EDI[2] - param_5 <= unaff_EBX[2])) &&
     (unaff_EBX[2] <= param_5 + unaff_EDI[2])) {
    FUN_10059870((float)fVar2,fVar3,fVar4,fVar5);
    uVar1 = FUN_1010a8a8();
    fVar3 = (float)uVar1 * 0.005493164;
    if (param_4 <= param_3) {
      if (fVar3 < param_4) {
        return 1;
      }
    }
    else if (fVar3 >= param_4) {
      return 0;
    }
    if (param_3 < fVar3) {
      return 1;
    }
  }
  return 0;
}


