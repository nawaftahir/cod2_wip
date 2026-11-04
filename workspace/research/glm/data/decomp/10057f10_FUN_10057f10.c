// 10057f10 size=707 FUN_10057f10

int FUN_10057f10(int param_1,float *param_2)

{
  float *pfVar1;
  float fVar2;
  undefined4 uVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float *pfVar7;
  int in_EAX;
  undefined4 uVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int local_14;
  float local_10;
  
  pfVar7 = param_2;
  fVar4 = param_2[3] - param_2[1];
  fVar5 = *param_2 - param_2[2];
  FUN_10059140();
  iVar10 = 0;
  pfVar1 = param_2 + 1;
  iVar11 = param_1 + -1;
  iVar9 = -1;
  fVar2 = *param_2;
  local_10 = 0.001;
  param_2 = (float *)0xba83126f;
  fVar2 = fVar4 * fVar2 + fVar5 * *pfVar1;
  local_14 = -1;
  if (-1 < iVar11) {
    do {
      fVar6 = fVar4 * *(float *)(in_EAX + iVar10 * 8) + fVar5 * *(float *)(in_EAX + 4 + iVar10 * 8);
      while (fVar6 = fVar6 - fVar2, 0.0 <= fVar6) {
        if (local_10 < fVar6) {
          iVar9 = iVar10;
          local_10 = fVar6;
        }
        iVar10 = iVar10 + 1;
        if (iVar11 < iVar10) goto LAB_100580ad;
        fVar6 = fVar4 * *(float *)(in_EAX + iVar10 * 8) +
                fVar5 * *(float *)(in_EAX + 4 + iVar10 * 8);
      }
      if (fVar6 < (float)param_2) {
        param_2 = (float *)fVar6;
        local_14 = iVar10;
      }
      fVar6 = fVar4 * *(float *)(in_EAX + iVar11 * 8) + fVar5 * *(float *)(in_EAX + 4 + iVar11 * 8);
      while (fVar6 = fVar6 - fVar2, fVar6 <= 0.0) {
        if (fVar6 < (float)param_2) {
          param_2 = (float *)fVar6;
          local_14 = iVar11;
        }
        iVar11 = iVar11 + -1;
        if (iVar11 < iVar10) goto LAB_100580ad;
        fVar6 = fVar4 * *(float *)(in_EAX + iVar11 * 8) +
                fVar5 * *(float *)(in_EAX + 4 + iVar11 * 8);
      }
      if (local_10 < fVar6) {
        iVar9 = iVar10;
        local_10 = fVar6;
      }
      if (iVar10 != iVar11) {
        uVar8 = *(undefined4 *)(in_EAX + iVar10 * 8);
        uVar3 = *(undefined4 *)(in_EAX + 4 + iVar10 * 8);
        *(undefined4 *)(in_EAX + iVar10 * 8) = *(undefined4 *)(in_EAX + iVar11 * 8);
        *(undefined4 *)(in_EAX + 4 + iVar10 * 8) = *(undefined4 *)(in_EAX + 4 + iVar11 * 8);
        *(undefined4 *)(in_EAX + iVar11 * 8) = uVar8;
        *(undefined4 *)(in_EAX + 4 + iVar11 * 8) = uVar3;
      }
      if (local_14 == iVar10) {
        local_14 = iVar11;
      }
      iVar10 = iVar10 + 1;
      iVar11 = iVar11 + -1;
    } while (iVar10 <= iVar11);
LAB_100580ad:
    if ((-1 < iVar9) || (-1 < local_14)) {
      param_2 = (float *)0x2;
      if (-1 < iVar9) {
        if (iVar9 != iVar11) {
          uVar8 = *(undefined4 *)(in_EAX + iVar9 * 8);
          uVar3 = *(undefined4 *)(in_EAX + 4 + iVar9 * 8);
          *(undefined4 *)(in_EAX + iVar9 * 8) = *(undefined4 *)(in_EAX + iVar11 * 8);
          *(undefined4 *)(in_EAX + 4 + iVar9 * 8) = *(undefined4 *)(in_EAX + 4 + iVar11 * 8);
          *(undefined4 *)(in_EAX + iVar11 * 8) = uVar8;
          *(undefined4 *)(in_EAX + 4 + iVar11 * 8) = uVar3;
        }
        _memmove(pfVar7 + 6,pfVar7 + 4,0);
        pfVar7[4] = *(float *)(in_EAX + iVar11 * 8);
        pfVar7[5] = *(float *)(in_EAX + 4 + iVar11 * 8);
        param_2 = (float *)0x3;
        if (0 < iVar11) {
          FUN_10057d00();
          param_2 = (float *)FUN_10057d00();
        }
      }
      if (-1 < local_14) {
        if (local_14 != iVar10) {
          uVar8 = *(undefined4 *)(in_EAX + local_14 * 8);
          uVar3 = *(undefined4 *)(in_EAX + 4 + local_14 * 8);
          *(undefined4 *)(in_EAX + local_14 * 8) = *(undefined4 *)(in_EAX + iVar10 * 8);
          *(undefined4 *)(in_EAX + 4 + local_14 * 8) = *(undefined4 *)(in_EAX + 4 + iVar10 * 8);
          *(undefined4 *)(in_EAX + iVar10 * 8) = uVar8;
          *(undefined4 *)(in_EAX + 4 + iVar10 * 8) = uVar3;
        }
        _memmove(pfVar7 + 4,pfVar7 + 2,(int)param_2 * 8 - 8);
        pfVar7[2] = *(float *)(in_EAX + iVar10 * 8);
        pfVar7[3] = *(float *)(in_EAX + 4 + iVar10 * 8);
        param_2 = (float *)((int)param_2 + 1);
        iVar9 = (param_1 - iVar10) + -1;
        if (0 < iVar9) {
          iVar10 = in_EAX + 8 + iVar10 * 8;
          uVar8 = FUN_10057d00(iVar10,iVar9,1,2,pfVar7,param_2);
          param_2 = (float *)FUN_10057d00(iVar10,iVar9,0,1,pfVar7,uVar8);
        }
      }
      return (int)param_2;
    }
  }
  return 0;
}


