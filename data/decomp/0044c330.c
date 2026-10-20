
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_0044c330(float *param_1,int param_2,int param_3)

{
  int iVar1;
  float fVar2;
  int in_EAX;
  
  iVar1 = *(int *)(in_EAX + 0x5c);
  fVar2 = ((float)param_2 - (float)*(int *)(in_EAX + 0x58) / _DAT_00556ab0) /
          *(float *)(in_EAX + 0x60);
  if (*(int *)(in_EAX + 0xf4) == 2) {
    *param_1 = fVar2 + *(float *)(in_EAX + 0x70);
    param_1[1] = ((float)param_3 - (float)iVar1 / _DAT_00556ab0) / *(float *)(in_EAX + 0x60) +
                 *(float *)(in_EAX + 0x74);
    return;
  }
  if (*(int *)(in_EAX + 0xf4) == 0) {
    param_1[1] = fVar2 + *(float *)(in_EAX + 0x74);
  }
  else {
    *param_1 = fVar2 + *(float *)(in_EAX + 0x70);
  }
  param_1[2] = ((float)param_3 - (float)iVar1 / _DAT_00556ab0) / *(float *)(in_EAX + 0x60) +
               *(float *)(in_EAX + 0x78);
  return;
}

