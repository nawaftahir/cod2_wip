
void __fastcall FUN_00487e10(int param_1,int param_2)

{
  float *in_EAX;
  float *pfVar1;
  float *pfVar2;
  uint uVar3;
  int unaff_ESI;
  int local_8;
  
  local_8 = 3;
  pfVar1 = in_EAX;
  pfVar2 = (float *)(param_1 + 0x18);
  do {
    *pfVar1 = *(float *)((param_2 - (int)in_EAX) + (int)pfVar1);
    pfVar1[3] = *(float *)((param_2 - (int)in_EAX) + (int)pfVar1);
    uVar3 = (-1 < (int)pfVar2[-6]) - 1 & 0xc;
    *pfVar1 = *(float *)(uVar3 + unaff_ESI) * pfVar2[-6] + *pfVar1;
    pfVar1[3] = *(float *)((unaff_ESI - uVar3) + 0xc) * pfVar2[-6] + pfVar1[3];
    uVar3 = (-1 < (int)pfVar2[-3]) - 1 & 0xc;
    *pfVar1 = *(float *)(unaff_ESI + 4 + uVar3) * pfVar2[-3] + *pfVar1;
    pfVar1[3] = *(float *)((unaff_ESI - uVar3) + 0x10) * pfVar2[-3] + pfVar1[3];
    uVar3 = (-1 < (int)*pfVar2) - 1 & 0xc;
    local_8 = local_8 + -1;
    *pfVar1 = *(float *)(unaff_ESI + 8 + uVar3) * *pfVar2 + *pfVar1;
    pfVar1[3] = *(float *)((unaff_ESI - uVar3) + 0x14) * *pfVar2 + pfVar1[3];
    pfVar1 = pfVar1 + 1;
    pfVar2 = pfVar2 + 1;
  } while (local_8 != 0);
  return;
}

