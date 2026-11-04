
int FUN_0042f4f0(int param_1)

{
  undefined4 *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int local_10;
  int local_c;
  int local_8;
  
  iVar5 = 0;
  local_c = 0;
  local_10 = 0;
  iVar2 = 0;
  if (0 < *(int *)(param_1 + 0x18)) {
    do {
      iVar2 = *(int *)(*(int *)(param_1 + 0x14) + 0x3c);
      iVar4 = 0;
      if (0 < **(int **)(iVar5 + 0xa0 + iVar2)) {
        local_8 = 0;
        do {
          puVar1 = (undefined4 *)(*(int *)(iVar5 + 0xa0 + iVar2) + 4 + local_8);
          iVar3 = FUN_00429e90();
          iVar2 = DAT_010f8d88;
          if ((iVar3 < 0) && (DAT_010f8d88 < 0x4000)) {
            (&DAT_010c8d88)[DAT_010f8d88 * 3] = *puVar1;
            (&DAT_010c8d8c)[iVar2 * 3] = puVar1[1];
            (&DAT_010c8d90)[iVar2 * 3] = puVar1[2];
            DAT_010f8d88 = DAT_010f8d88 + 1;
            local_c = local_c + 1;
          }
          iVar2 = *(int *)(*(int *)(param_1 + 0x14) + 0x3c);
          local_8 = local_8 + 0xc;
          iVar4 = iVar4 + 1;
        } while (iVar4 < **(int **)(iVar5 + 0xa0 + iVar2));
      }
      local_10 = local_10 + 1;
      iVar5 = iVar5 + 0xa8;
      iVar2 = local_c;
    } while (local_10 < *(int *)(param_1 + 0x18));
  }
  return iVar2;
}

