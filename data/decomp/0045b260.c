
void FUN_0045b260(int param_1)

{
  float *pfVar1;
  float *unaff_EDI;
  float local_28;
  float local_24;
  float local_20;
  float local_1c;
  float local_18;
  float local_14;
  int local_10;
  int local_c;
  int local_8;
  
  local_10 = 0;
  if (0 < *(int *)(param_1 + 0x38)) {
    local_8 = 0;
    do {
      local_c = 3;
      pfVar1 = (float *)(*(int *)(param_1 + 0x3c) + local_8 + 8);
      do {
        local_1c = pfVar1[-2] - *unaff_EDI;
        local_18 = pfVar1[-1] - unaff_EDI[1];
        local_14 = *pfVar1 - unaff_EDI[2];
        FUN_00489260(&local_28);
        local_c = local_c + -1;
        pfVar1[-2] = local_28 + *unaff_EDI;
        pfVar1[-1] = local_24 + unaff_EDI[1];
        *pfVar1 = local_20 + unaff_EDI[2];
        pfVar1 = pfVar1 + 3;
      } while (local_c != 0);
      local_10 = local_10 + 1;
      local_8 = local_8 + 0xa8;
    } while (local_10 < *(int *)(param_1 + 0x38));
  }
  return;
}

