
void __fastcall FUN_00439450(int *param_1)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int local_c;
  int local_8;
  
  param_1[DAT_01128d90 + 6] = param_1[8];
  *(char *)((int)param_1 + 0x382f) = (char)param_1[0xe0c];
  local_8 = 0;
  if (0 < param_1[1]) {
    piVar1 = param_1 + 0x14;
    local_c = 0;
    do {
      iVar5 = 0;
      piVar2 = piVar1;
      iVar4 = local_c;
      if (0 < *param_1) {
        do {
          iVar3 = DAT_01128d94 + iVar4;
          param_1[iVar3 * 2 + 0xc] = *piVar2;
          (param_1 + iVar3 * 2 + 0xc)[1] = piVar2[1];
          iVar5 = iVar5 + 1;
          iVar4 = iVar4 + 0x70;
          piVar2 = piVar2 + 0xe0;
        } while (iVar5 < *param_1);
      }
      local_8 = local_8 + 1;
      local_c = local_c + 7;
      piVar1 = piVar1 + 0xe;
    } while (local_8 < param_1[1]);
  }
  FUN_004269d0();
  return;
}

