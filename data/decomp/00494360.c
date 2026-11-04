
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

bool __thiscall FUN_00494360(int param_1,int param_2,int param_3)

{
  char cVar1;
  double *in_EAX;
  uint uVar2;
  uint uVar3;
  int iVar4;
  double *pdVar5;
  double *pdVar6;
  
  uVar2 = FUN_004839b0();
  *(uint *)((int)in_EAX + 0xa4) = uVar2;
  uVar3 = ~uVar2 & 2;
  *(uint *)(in_EAX + 0x14) = uVar3;
  uVar2 = ~uVar2 & 1;
  *(uint *)((int)in_EAX + 0x9c) = uVar2;
  *in_EAX = (double)*(float *)(param_2 + uVar2 * 4);
  in_EAX[1] = (double)*(float *)(param_2 + uVar3 * 4);
  in_EAX[2] = _DAT_00556a60;
  in_EAX[3] = (double)*(float *)(param_3 + uVar2 * 4);
  in_EAX[4] = (double)*(float *)(param_3 + uVar3 * 4);
  in_EAX[5] = _DAT_00556a60;
  in_EAX[6] = (double)*(float *)(param_1 + uVar2 * 4);
  in_EAX[7] = (double)*(float *)(param_1 + uVar3 * 4);
  in_EAX[8] = _DAT_00556a60;
  pdVar5 = in_EAX;
  pdVar6 = in_EAX + 9;
  for (iVar4 = 0x12; iVar4 != 0; iVar4 = iVar4 + -1) {
    *(undefined4 *)pdVar6 = *(undefined4 *)pdVar5;
    pdVar5 = (double *)((int)pdVar5 + 4);
    pdVar6 = (double *)((int)pdVar6 + 4);
  }
  cVar1 = FUN_00493c10(in_EAX + 9,in_EAX + 0x12);
  return cVar1 != '\0';
}

