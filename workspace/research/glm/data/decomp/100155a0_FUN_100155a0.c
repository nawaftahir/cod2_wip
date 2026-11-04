// 100155a0 size=412 FUN_100155a0

void FUN_100155a0(int *param_1,float *param_2,float *param_3,undefined4 param_4,int param_5,
                 int *param_6)

{
  int iVar1;
  int iVar2;
  float *pfVar3;
  int *piVar4;
  int local_4;
  
  if (*param_1 != DAT_101d4d20) {
    *param_1 = DAT_101d4d20;
    local_4 = 0;
    if (0 < param_1[10]) {
      do {
        iVar2 = *(int *)(param_1[0xb] + local_4 * 4) * 0x20;
        pfVar3 = (float *)(iVar2 + *(int *)(DAT_101d1b9c + 0xf0));
        if ((((*param_2 <= *(float *)(iVar2 + 0xc + *(int *)(DAT_101d1b9c + 0xf0))) &&
             (*pfVar3 <= *param_3)) && (param_2[1] <= pfVar3[4])) &&
           (((pfVar3[1] <= param_3[1] && (param_2[2] <= pfVar3[5])) && (pfVar3[2] <= param_3[2]))))
        {
          piVar4 = (int *)(*(int *)(DAT_101d1b9c + 0x14) + (int)pfVar3[7] * 0xc);
          iVar2 = 0;
          if (0 < (int)pfVar3[6]) {
            do {
              if (param_5 <= *param_6) break;
              if ((((*(byte *)(*piVar4 + 0xc) & 4) == 0) &&
                  (iVar1 = piVar4[2], *param_2 <= *(float *)(iVar1 + 0x10))) &&
                 (((*(float *)(iVar1 + 4) <= *param_3 &&
                   (((param_2[1] <= *(float *)(iVar1 + 0x14) &&
                     (*(float *)(iVar1 + 8) <= param_3[1])) &&
                    (param_2[2] <= *(float *)(iVar1 + 0x18))))) &&
                  (*(float *)(iVar1 + 0xc) <= param_3[2])))) {
                FUN_10015570();
              }
              iVar2 = iVar2 + 1;
              piVar4 = piVar4 + 3;
            } while (iVar2 < (int)pfVar3[6]);
          }
        }
        local_4 = local_4 + 1;
      } while (local_4 < param_1[10]);
    }
    FUN_100153f0(param_1[7],param_2,param_3,param_4,param_5,param_6);
  }
  return;
}


