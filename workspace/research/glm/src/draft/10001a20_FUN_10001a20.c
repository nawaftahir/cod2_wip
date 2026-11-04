extern unsigned int DAT_10191a80;
extern unsigned int DAT_101ae288;
extern int FUN_10001940();
extern int FUN_100138c0();


int FUN_10001a20(int *param_1,unsigned int *param_2)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  short *psVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int *piVar8;
  int iVar9;
  unsigned int *puVar10;
  int local_90;
  int local_8c;
  int local_88;
  int local_7c [31];
  
  iVar6 = *param_1;
  iVar2 = FUN_10001940();
  iVar7 = *(int *)(iVar6 + 0x44) + param_1[1];
  iVar3 = FUN_10001940();
  iVar6 = 0;
  local_88 = 0;
  if (0 < iVar2) {
    psVar4 = (short *)(iVar7 + 2);
    iVar9 = iVar2;
    do {
      iVar5 = (int)*psVar4;
      if ((iVar5 != 0x1f) && (iVar6 <= iVar5)) {
        iVar6 = iVar5 + 1;
      }
      psVar4 = psVar4 + 8;
      iVar9 = iVar9 + -1;
      local_88 = iVar6;
    } while (iVar9 != 0);
  }
  if ((iVar3 != 0) && (iVar3 != local_88)) {
    FUN_100138c0(1,&DAT_10191a80,DAT_101ae288);
  }
  piVar8 = local_7c;
  for (iVar6 = 0x1f; iVar6 != 0; iVar6 = iVar6 + -1) {
    *piVar8 = 0;
    piVar8 = piVar8 + 1;
  }
  puVar10 = param_2;
  for (iVar6 = 0x3c1; iVar6 != 0; iVar6 = iVar6 + -1) {
    *puVar10 = 0;
    puVar10 = puVar10 + 1;
  }
  local_90 = 0;
  if (0 < param_1[4]) {
    do {
      if (0 < iVar2) {
        psVar4 = (short *)(iVar7 + 8);
        iVar6 = iVar2;
        do {
          if ((psVar4[-4] == local_90) && (psVar4[-3] != 0x1f)) {
            local_7c[psVar4[-3]] = local_7c[psVar4[-3]] + (int)*psVar4;
          }
          psVar4 = psVar4 + 8;
          iVar6 = iVar6 + -1;
        } while (iVar6 != 0);
      }
      local_8c = 0;
      if (0 < local_88) {
        iVar6 = 0;
        do {
          iVar3 = local_7c[local_8c];
          if (iVar3 != 0) {
            iVar9 = local_8c + 1;
            if (iVar9 < local_88) {
              piVar8 = param_2 + iVar6 + local_8c + 0x1f;
              do {
                if (local_7c[iVar9] != 0) {
                  piVar1 = param_2 + iVar6 + iVar9;
                  iVar5 = *piVar1 + local_7c[iVar9] + iVar3;
                  *piVar1 = iVar5;
                  if (iVar5 < 0) {
                    *piVar1 = 0x7fffffff;
                  }
                  *piVar8 = *piVar1;
                }
                iVar9 = iVar9 + 1;
                piVar8 = piVar8 + 0x1f;
              } while (iVar9 < local_88);
            }
            local_7c[local_8c] = 0;
          }
          local_8c = local_8c + 1;
          iVar6 = iVar6 + 0x1f;
        } while (local_8c < local_88);
      }
      local_90 = local_90 + 1;
    } while (local_90 < param_1[4]);
  }
  return local_88;
}


