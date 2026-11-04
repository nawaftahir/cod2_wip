// 10009bc0 size=295 FUN_10009bc0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_10009bc0(int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                undefined4 param_5,int param_6,int param_7)

{
  char cVar1;
  int iVar2;
  int iVar3;
  undefined4 local_8;
  undefined4 local_4;
  
  local_4 = 0;
  if (*(int *)(param_1 + 0x20) < 1) {
    return param_7;
  }
  local_8 = 0;
  do {
    iVar3 = *(int *)(param_1 + 0x24) + local_8;
    iVar2 = 0;
    if (0 < param_7) {
      do {
        if (*(int *)(iVar3 + 0x1c) == *(int *)(param_6 + iVar2 * 4)) goto LAB_10009cb8;
        iVar2 = iVar2 + 1;
      } while (iVar2 < param_7);
    }
    if ((*(char *)(iVar3 + 1) == '\0') &&
       (_DAT_101ce5d0 * *(float *)(iVar3 + 8) +
        _DAT_101ce5dc * *(float *)(iVar3 + 0x14) +
        _DAT_101ce5d8 * *(float *)(iVar3 + 0x10) + _DAT_101ce5d4 * *(float *)(iVar3 + 0xc) <= 0.0))
    {
      cVar1 = FUN_10007e10();
      if (cVar1 == '\0') {
        cVar1 = FUN_10009700();
        if (cVar1 == '\0') {
          iVar2 = FUN_10009a70(param_2,param_3,param_4,0);
          if (iVar2 != 0) {
            *(undefined4 *)(param_6 + param_7 * 4) = *(undefined4 *)(iVar3 + 0x1c);
            param_7 = FUN_10009bc0(*(undefined4 *)(iVar3 + 0x1c),param_2,param_3,param_4,param_5,
                                   param_6,param_7 + 1);
          }
        }
      }
    }
LAB_10009cb8:
    local_4 = local_4 + 1;
    local_8 = local_8 + 0x44;
    if (*(int *)(param_1 + 0x20) <= local_4) {
      return param_7;
    }
  } while( true );
}


