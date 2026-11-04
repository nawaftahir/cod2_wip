
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int __fastcall FUN_00454f70(int param_1,int param_2,int param_3,int param_4)

{
  float fVar1;
  int in_EAX;
  float *pfVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int *piVar6;
  int *piVar7;
  int local_18;
  int local_10;
  int *local_c;
  int local_8;
  
  local_8 = 0;
  if (param_1 < 1) {
    return 0;
  }
  piVar6 = (int *)(in_EAX + 8);
  local_10 = in_EAX - param_2;
  piVar7 = (int *)(param_2 + 0x10);
  local_18 = param_1;
  local_c = piVar6;
  do {
    if (((param_3 == piVar7[-1]) || (param_3 == *piVar7)) || (param_3 == piVar7[1])) {
      iVar4 = 0;
      iVar5 = local_10;
      if (0 < local_8) {
        do {
          iVar3 = 0;
          pfVar2 = (float *)(piVar7 + -4);
          while (fVar1 = *(float *)((int)pfVar2 + iVar5) - *pfVar2, piVar6 = local_c,
                fVar1 * fVar1 <= _DAT_00556bb0) {
            iVar3 = iVar3 + 1;
            pfVar2 = pfVar2 + 1;
            if (2 < iVar3) goto LAB_00454fe7;
          }
          iVar4 = iVar4 + 1;
          iVar5 = iVar5 + 0xc;
        } while (iVar4 < local_8);
      }
      if (local_8 == param_4) {
        FUN_00408020("Winding point limit (%i) exceeded on brush face",param_4);
      }
      piVar6[-2] = piVar7[-4];
      piVar6[-1] = piVar7[-3];
      local_8 = local_8 + 1;
      *piVar6 = piVar7[-2];
      local_c = piVar6 + 3;
      piVar6 = local_c;
    }
LAB_00454fe7:
    local_10 = local_10 + -0x18;
    piVar7 = piVar7 + 6;
    local_18 = local_18 + -1;
    if (local_18 == 0) {
      return local_8;
    }
  } while( true );
}

