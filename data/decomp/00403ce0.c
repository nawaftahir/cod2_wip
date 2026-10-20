
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00403ce0(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  float fVar4;
  float fVar5;
  float *in_EAX;
  
  iVar1 = *(int *)(param_1 + 0x58);
  iVar2 = *(int *)(param_1 + 0x54);
  iVar3 = iVar2;
  if (iVar2 < iVar1) {
    iVar3 = iVar1;
  }
  fVar4 = (float)(param_2 - iVar1 / 2) * (_DAT_00556ab0 / (float)iVar3);
  fVar5 = (float)(param_3 - iVar2 / 2) * (_DAT_00556ab0 / (float)iVar3);
  *in_EAX = fVar4 * *(float *)(param_1 + 0xac) + fVar5 * *(float *)(param_1 + 0xc4) +
            *(float *)(param_1 + 0xb8);
  in_EAX[1] = fVar4 * *(float *)(param_1 + 0xb0) + fVar5 * *(float *)(param_1 + 200) +
              *(float *)(param_1 + 0xbc);
  in_EAX[2] = fVar4 * *(float *)(param_1 + 0xb4) + fVar5 * *(float *)(param_1 + 0xcc) +
              *(float *)(param_1 + 0xc0);
  FUN_00483b50();
  return;
}

