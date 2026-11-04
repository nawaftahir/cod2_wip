// 100844e1 size=195 FUN_100844e1

undefined4
FUN_100844e1(undefined4 param_1,float *param_2,int param_3,uint param_4,undefined4 param_5)

{
  int iVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  undefined4 uVar5;
  float *pfVar6;
  float *local_8;
  
  uVar5 = 0;
  local_8 = (float *)0x0;
  if (*(int *)(param_4 + 4) == 0xd) {
    iVar1 = *(int *)(param_4 + 0x20);
    if (*(int *)(iVar1 + 4) == 1) {
      uVar4 = (int)param_2 << 4;
      local_8 = operator_new(uVar4);
      if (local_8 == (float *)0x0) {
        uVar5 = 0x8007000e;
      }
      else {
        pfVar6 = local_8;
        for (iVar3 = ((uint)param_2 & 0xfffffff) << 2; iVar3 != 0; iVar3 = iVar3 + -1) {
          *pfVar6 = 0.0;
          pfVar6 = pfVar6 + 1;
        }
        for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
          *(undefined1 *)pfVar6 = 0;
          pfVar6 = (float *)((int)pfVar6 + 1);
        }
        if (param_2 != (float *)0x0) {
          param_4 = (uint)param_2;
          pfVar6 = local_8;
          iVar3 = param_3;
          param_2 = local_8;
          do {
            for (; iVar3 != 0; iVar3 = iVar3 + -1) {
              iVar2 = *(int *)(iVar1 + 8);
              if (*(int *)(iVar2 + 0x10) == 3) {
                *pfVar6 = (float)*(double *)(iVar2 + 0x18);
              }
              else {
                *pfVar6 = *(float *)(iVar2 + 0x18);
              }
              iVar1 = *(int *)(iVar1 + 0xc);
              pfVar6 = pfVar6 + 1;
            }
            pfVar6 = param_2 + 4;
            param_4 = param_4 - 1;
            iVar3 = param_3;
            param_2 = pfVar6;
          } while (param_4 != 0);
        }
        uVar5 = FUN_100840db(local_8,uVar4,6,param_5);
      }
    }
    _free(local_8);
  }
  else {
    uVar5 = 0;
  }
  return uVar5;
}


