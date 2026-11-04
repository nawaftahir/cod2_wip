// 10026fe0 size=242 FUN_10026fe0

void FUN_10026fe0(undefined4 param_1,int param_2,int param_3)

{
  int *in_EAX;
  int iVar1;
  int iVar2;
  float10 fVar3;
  int local_10;
  int local_c;
  int local_8;
  
  local_8 = 6;
  do {
    iVar1 = 0;
    if (0 < param_3) {
      local_c = param_3;
      do {
        if (0 < param_2) {
          iVar2 = iVar1 * 0xc;
          local_10 = param_2;
          do {
            fVar3 = (float10)FUN_100f8f20();
            *(float *)(iVar2 + *in_EAX) = (float)fVar3;
            fVar3 = (float10)FUN_100f8f20();
            *(float *)(iVar2 + 4 + *in_EAX) = (float)fVar3;
            fVar3 = (float10)FUN_100f8f20();
            *(float *)(iVar2 + 8 + *in_EAX) = (float)fVar3;
            iVar1 = iVar1 + 1;
            iVar2 = iVar2 + 0xc;
            local_10 = local_10 + -1;
          } while (local_10 != 0);
        }
        local_c = local_c + -1;
      } while (local_c != 0);
    }
    in_EAX = in_EAX + 1;
    local_8 = local_8 + -1;
  } while (local_8 != 0);
  return;
}


