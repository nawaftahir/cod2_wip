extern unsigned int DAT_101d1b9c;


void FUN_100153f0(float *param_1,float *param_2,float *param_3,int param_4,int param_5,int *param_6)

{
  float *pfVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  
  pfVar1 = param_2;
  if ((((*param_2 <= param_1[3]) && (*param_1 <= *param_3)) && (param_2[1] <= param_1[4])) &&
     (((param_1[1] <= param_3[1] && (param_2[2] <= param_1[5])) && (param_1[2] <= param_3[2])))) {
    iVar2 = 0;
    if (param_1[10] == 0.0) {
      piVar4 = (int *)(*(int *)(DAT_101d1b9c + 0x14) + (int)param_1[7] * 0xc);
      param_2 = (float *)0x0;
      if (0 < (int)param_1[6]) {
        do {
          if (param_5 <= *param_6) {
            return;
          }
          if ((((*(byte *)(*piVar4 + 0xc) & 4) == 0) &&
              (iVar2 = piVar4[2], *pfVar1 <= *(float *)(iVar2 + 0x10))) &&
             (((*(float *)(iVar2 + 4) <= *param_3 &&
               (((pfVar1[1] <= *(float *)(iVar2 + 0x14) && (*(float *)(iVar2 + 8) <= param_3[1])) &&
                (pfVar1[2] <= *(float *)(iVar2 + 0x18))))) &&
              (*(float *)(iVar2 + 0xc) <= param_3[2])))) {
            *(int **)(param_4 + *param_6 * 4) = piVar4;
            *param_6 = *param_6 + 1;
          }
          param_2 = (float *)((int)param_2 + 1);
          piVar4 = piVar4 + 3;
        } while ((int)param_2 < (int)param_1[6]);
      }
    }
    else {
      iVar3 = 0;
      if (0 < (int)param_1[10]) {
        do {
          FUN_100153f0((int)param_1[0xb] + iVar2,param_2,param_3,param_4,param_5,param_6);
          iVar3 = iVar3 + 1;
          iVar2 = iVar2 + 0x30;
        } while (iVar3 < (int)param_1[10]);
        return;
      }
    }
  }
  return;
}


