// 10026e60 size=369 FUN_10026e60

void FUN_10026e60(undefined4 param_1,int param_2,int param_3,undefined4 param_4,int param_5)

{
  float fVar1;
  float fVar2;
  int iVar3;
  int iVar4;
  int local_20;
  int local_1c;
  int local_18;
  int local_14;
  float local_c;
  float local_8;
  float local_4;
  
  local_1c = 0;
  do {
    local_20 = 0;
    if (0 < param_3) {
      local_14 = 0;
      do {
        local_18 = 0;
        if (0 < param_2) {
          iVar4 = (local_1c * 9 + 9) * 4;
          fVar1 = ((float)local_20 + 0.5 + (float)local_20 + 0.5) / (float)param_3 - 1.0;
          iVar3 = local_14;
          do {
            fVar2 = ((float)local_18 + 0.5 + (float)local_18 + 0.5) / (float)param_2 - 1.0;
            local_c = fVar1 * *(float *)(&DAT_101903c0 + iVar4) +
                      fVar2 * *(float *)(&DAT_101903b4 + iVar4) + *(float *)(&DAT_101903a8 + iVar4);
            local_8 = fVar1 * *(float *)(&DAT_101903c4 + iVar4) +
                      fVar2 * *(float *)(&DAT_101903b8 + iVar4) + *(float *)(&DAT_101903ac + iVar4);
            local_4 = fVar1 * *(float *)(&DAT_101903c8 + iVar4) +
                      fVar2 * *(float *)(&DAT_101903bc + iVar4) + *(float *)(&DAT_101903b0 + iVar4);
            FUN_100590b0();
            FUN_10026b30(param_1,param_2,param_3,&local_c,param_4,
                         *(int *)(param_5 + local_1c * 4) + iVar3);
            local_18 = local_18 + 1;
            iVar3 = iVar3 + 4;
          } while (local_18 < param_2);
        }
        local_14 = local_14 + param_2 * 4;
        local_20 = local_20 + 1;
      } while (local_20 < param_3);
    }
    local_1c = local_1c + 1;
  } while (local_1c < 6);
  return;
}


