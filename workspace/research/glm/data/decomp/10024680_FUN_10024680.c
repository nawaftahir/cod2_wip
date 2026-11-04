// 10024680 size=286 FUN_10024680

void FUN_10024680(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  int local_c;
  int local_8;
  int local_4;
  
  param_1 = param_1 * 0x34;
  piVar2 = *(int **)(&DAT_10678af4 + param_1);
  local_c = 0;
  local_8 = 0;
  local_4 = 0;
  if (0 < *(int *)(&DAT_10678ad4 + param_1)) {
    do {
      if (*(int *)(*(int *)(&DAT_10678af0 + param_1) + local_4 * 4) != 0) {
        FUN_10024380(piVar2);
        if (*(char *)(DAT_101ce63c + 8) == '\0') {
          if (*(char *)(DAT_101ce808 + 8) != '\0') {
            local_8 = local_8 + *(short *)(piVar2[1] + 2);
          }
        }
        else {
          local_c = local_c + *(short *)(piVar2[1] + 4);
        }
        piVar2 = (int *)((int)piVar2 + (uint)(byte)(&DAT_101a5a30)[*piVar2]);
      }
      local_4 = local_4 + 1;
    } while (local_4 < *(int *)(&DAT_10678ad4 + param_1));
  }
  if ((*(char *)(DAT_101ce63c + 8) == '\0') &&
     (local_c = local_8, *(char *)(DAT_101ce808 + 8) == '\0')) {
    if (*(char *)(DAT_101ce774 + 8) == '\0') {
      return;
    }
    local_c = *(int *)(&DAT_10678ad4 + param_1);
  }
  uVar1 = FUN_10060c70(&DAT_10196ccc,local_c);
  FUN_10005710(DAT_101da9c8 + 0x249d18,&DAT_10191448,uVar1);
  return;
}


