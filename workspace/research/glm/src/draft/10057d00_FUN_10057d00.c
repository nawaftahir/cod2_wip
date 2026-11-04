extern int FUN_10059140();


int FUN_10057d00(int param_1,float param_2,int param_3,int param_4,int param_5,int param_6)

{
  unsigned int *_Src;
  unsigned int uVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  unsigned int uVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  
  fVar2 = *(float *)(param_5 + 4 + param_3 * 8) - *(float *)(param_5 + 4 + param_4 * 8);
  fVar3 = *(float *)(param_5 + param_4 * 8) - *(float *)(param_5 + param_3 * 8);
  FUN_10059140();
  iVar7 = 0;
  iVar9 = (int)param_2 + -1;
  iVar8 = -1;
  param_2 = 0.001;
  fVar4 = fVar2 * *(float *)(param_5 + param_3 * 8) + fVar3 * *(float *)(param_5 + 4 + param_3 * 8);
  if (iVar9 >= 0) {
    do {
      fVar5 = (fVar2 * *(float *)(param_1 + iVar7 * 8) + fVar3 * *(float *)(param_1 + 4 + iVar7 * 8)
              ) - fVar4;
      if (fVar5 < 0.0 == (fVar5 == 0.0)) {
        do {
          if (param_2 < fVar5) {
            iVar8 = iVar7;
            param_2 = fVar5;
          }
          iVar7 = iVar7 + 1;
          if (iVar9 < iVar7) goto LAB_10057e64;
          fVar5 = (fVar2 * *(float *)(param_1 + iVar7 * 8) +
                  fVar3 * *(float *)(param_1 + 4 + iVar7 * 8)) - fVar4;
        } while (fVar5 < 0.0 == (fVar5 == 0.0));
      }
      fVar5 = fVar2 * *(float *)(param_1 + iVar9 * 8) + fVar3 * *(float *)(param_1 + 4 + iVar9 * 8);
      while (fVar5 = fVar5 - fVar4, fVar5 <= 0.0) {
        iVar9 = iVar9 + -1;
        if (iVar9 < iVar7) goto LAB_10057e64;
        fVar5 = fVar2 * *(float *)(param_1 + iVar9 * 8) +
                fVar3 * *(float *)(param_1 + 4 + iVar9 * 8);
      }
      if (param_2 < fVar5) {
        iVar8 = iVar7;
        param_2 = fVar5;
      }
      if (iVar7 != iVar9) {
        uVar6 = *(unsigned int *)(param_1 + iVar7 * 8);
        uVar1 = *(unsigned int *)(param_1 + 4 + iVar7 * 8);
        *(unsigned int *)(param_1 + iVar7 * 8) = *(unsigned int *)(param_1 + iVar9 * 8);
        *(unsigned int *)(param_1 + 4 + iVar7 * 8) = *(unsigned int *)(param_1 + 4 + iVar9 * 8);
        *(unsigned int *)(param_1 + iVar9 * 8) = uVar6;
        *(unsigned int *)(param_1 + 4 + iVar9 * 8) = uVar1;
      }
      iVar7 = iVar7 + 1;
      iVar9 = iVar9 + -1;
    } while (iVar7 <= iVar9);
LAB_10057e64:
    if (iVar8 >= 0) {
      if (iVar8 != iVar9) {
        uVar6 = *(unsigned int *)(param_1 + iVar8 * 8);
        uVar1 = *(unsigned int *)(param_1 + 4 + iVar8 * 8);
        *(unsigned int *)(param_1 + iVar8 * 8) = *(unsigned int *)(param_1 + iVar9 * 8);
        *(unsigned int *)(param_1 + 4 + iVar8 * 8) = *(unsigned int *)(param_1 + 4 + iVar9 * 8);
        *(unsigned int *)(param_1 + iVar9 * 8) = uVar6;
        *(unsigned int *)(param_1 + 4 + iVar9 * 8) = uVar1;
      }
      iVar8 = param_3 + 1;
      _Src = (unsigned int *)(param_5 + iVar8 * 8);
      _memmove(_Src + 2,_Src,(param_6 - iVar8) * 8);
      *_Src = *(unsigned int *)(param_1 + iVar9 * 8);
      param_6 = param_6 + 1;
      _Src[1] = *(unsigned int *)(param_1 + 4 + iVar9 * 8);
      if (iVar9 != 0) {
        if (param_4 != 0) {
          param_4 = param_3 + 2;
        }
        uVar6 = FUN_10057d00(param_1,iVar9,iVar8,param_4,param_5,param_6);
        param_6 = FUN_10057d00(param_1,iVar9,param_3,iVar8,param_5,uVar6);
      }
      return param_6;
    }
  }
  return param_6;
}


