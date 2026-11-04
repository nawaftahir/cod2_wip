// 10026b30 size=805 FUN_10026b30

void FUN_10026b30(undefined4 param_1,int param_2,int param_3,undefined4 param_4,float *param_5,
                 undefined1 *param_6)

{
  float fVar1;
  float fVar2;
  float fVar3;
  undefined1 *puVar4;
  int iVar5;
  float10 fVar6;
  float10 fVar7;
  float10 fVar8;
  int local_40;
  int local_34;
  undefined1 local_20;
  
  puVar4 = param_6;
  iVar5 = 0;
  do {
    local_40 = 0;
    if (0 < param_3) {
      do {
        local_34 = 0;
        if (0 < param_2) {
          do {
            FUN_100590b0();
            local_34 = local_34 + 1;
          } while (local_34 < param_2);
        }
        local_40 = local_40 + 1;
      } while (local_40 < param_3);
    }
    iVar5 = iVar5 + 1;
  } while (iVar5 < 6);
  fVar6 = (float10)FUN_100f8f20();
  fVar7 = (float10)FUN_100f8f20();
  fVar8 = (float10)FUN_100f8f20();
  fVar2 = (float)fVar6 * *param_5;
  fVar3 = (float)fVar7 * param_5[1];
  fVar1 = (float)(fVar8 * (float10)param_5[2]);
  if (0.0 <= fVar2 - 1.0) {
    fVar2 = 1.0;
  }
  local_20 = (undefined1)(int)ROUND(fVar2 * 255.0 + 9.313226e-10);
  param_6[2] = local_20;
  if (0.0 <= fVar3 - 1.0) {
    fVar3 = 1.0;
  }
  param_6._0_1_ = (undefined1)(int)ROUND(fVar3 * 255.0 + 9.313226e-10);
  puVar4[1] = param_6._0_1_;
  if (0.0 <= fVar1 - 1.0) {
    fVar1 = 1.0;
  }
  param_6._0_1_ = (undefined1)(int)ROUND(fVar1 * 255.0 + 9.313226e-10);
  *puVar4 = param_6._0_1_;
  puVar4[3] = 0xff;
  return;
}


