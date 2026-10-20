
void __fastcall FUN_004393c0(undefined4 param_1,int *param_2)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int local_c;
  int local_8;
  
  iVar4 = param_2[DAT_01128d90 + 6];
  *(undefined1 *)(param_2 + 0xe0c) = *(undefined1 *)((int)param_2 + 0x382f);
  param_2[8] = iVar4;
  local_8 = 0;
  if (0 < param_2[1]) {
    piVar1 = param_2 + 0x14;
    local_c = 0;
    do {
      if (0 < *param_2) {
        iVar5 = 0;
        piVar2 = piVar1;
        iVar4 = local_c;
        do {
          iVar3 = DAT_01128d94 + iVar4;
          *piVar2 = param_2[iVar3 * 2 + 0xc];
          piVar2[1] = param_2[iVar3 * 2 + 0xd];
          iVar5 = iVar5 + 1;
          piVar2 = piVar2 + 0xe0;
          iVar4 = iVar4 + 0x70;
        } while (iVar5 < *param_2);
      }
      local_8 = local_8 + 1;
      local_c = local_c + 7;
      piVar1 = piVar1 + 0xe;
    } while (local_8 < param_2[1]);
  }
  return;
}

