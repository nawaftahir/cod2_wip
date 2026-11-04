// 10009df0 size=547 FUN_10009df0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10009df0(int param_1,int param_2,undefined4 param_3,undefined4 param_4,undefined4 param_5,
                 int param_6)

{
  float *pfVar1;
  char cVar2;
  int iVar3;
  char *pcVar4;
  int local_8;
  int local_4;
  
  FUN_10007aa0(param_1,param_4,param_5);
  FUN_100092b0(param_1,param_4,param_5);
  iVar3 = param_2;
  if (DAT_101ce5ec != '\0') {
    FUN_10009690();
  }
  for (; iVar3 != 0; iVar3 = *(int *)(iVar3 + 4)) {
    *(undefined1 *)(iVar3 + 1) = 1;
  }
  if (param_6 == 0) {
    FUN_10009cf0(param_1);
    if (param_2 != 0) {
      do {
        *(undefined1 *)(param_2 + 1) = 0;
        param_2 = *(int *)(param_2 + 4);
      } while (param_2 != 0);
      return;
    }
  }
  else {
    local_4 = 0;
    if (0 < *(int *)(param_1 + 0x20)) {
      local_8 = 0;
      do {
        pcVar4 = (char *)(*(int *)(param_1 + 0x24) + local_8);
        if ((((*(char *)(*(int *)(param_1 + 0x24) + 1 + local_8) == '\0') &&
             (pfVar1 = (float *)(pcVar4 + 8),
             _DAT_101ce5d0 * *pfVar1 +
             _DAT_101ce5dc * *(float *)(pcVar4 + 0x14) +
             _DAT_101ce5d8 * *(float *)(pcVar4 + 0x10) + _DAT_101ce5d4 * *(float *)(pcVar4 + 0xc) <=
             0.0)) && (cVar2 = FUN_10007e10(), cVar2 == '\0')) &&
           (cVar2 = FUN_10009700(), cVar2 == '\0')) {
          if ((_DAT_101ce5dc == 0.0) ||
             (_DAT_101ce5d0 * *pfVar1 +
              _DAT_101ce5dc * *(float *)(pcVar4 + 0x14) +
              _DAT_101ce5d8 * *(float *)(pcVar4 + 0x10) + _DAT_101ce5d4 * *(float *)(pcVar4 + 0xc)
              <= -0.125)) {
            cVar2 = FUN_10009b30(param_3);
            if (cVar2 != '\0') {
              if (*pcVar4 == '\0') {
                *(int *)(pcVar4 + 4) = param_2;
                FUN_10009770(pcVar4);
              }
              else if (*(int *)(pcVar4 + 4) != param_2) {
                pcVar4[4] = '\0';
                pcVar4[5] = '\0';
                pcVar4[6] = '\0';
                pcVar4[7] = '\0';
              }
            }
          }
          else {
            iVar3 = FUN_1005d800(pcVar4[0x24],&DAT_101ce5d0);
            if (iVar3 != 0) {
              pcVar4[4] = '\0';
              pcVar4[5] = '\0';
              pcVar4[6] = '\0';
              pcVar4[7] = '\0';
              FUN_10009df0(*(undefined4 *)(pcVar4 + 0x1c),pcVar4,pfVar1,param_4,param_5,param_6);
            }
          }
        }
        local_4 = local_4 + 1;
        local_8 = local_8 + 0x44;
      } while (local_4 < *(int *)(param_1 + 0x20));
    }
    for (; param_2 != 0; param_2 = *(int *)(param_2 + 4)) {
      *(undefined1 *)(param_2 + 1) = 0;
    }
  }
  return;
}


