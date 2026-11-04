// 100811b0 size=519 FUN_100811b0

undefined4 FUN_100811b0(char *param_1,int *param_2)

{
  byte bVar1;
  uint uVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  byte *pbVar6;
  int in_ECX;
  byte *pbVar7;
  uint uVar8;
  char *pcVar9;
  int *piVar10;
  byte *pbVar11;
  bool bVar12;
  byte *local_10;
  byte *local_c;
  int local_8;
  
  if ((int)param_1 < 0) {
    *param_2 = -(int)param_1;
    uVar3 = 0;
  }
  else {
    iVar4 = _isspace((int)*param_1);
    pcVar9 = param_1;
    while (iVar4 != 0) {
      pcVar9 = pcVar9 + 1;
      iVar4 = _isspace((int)*pcVar9);
    }
    iVar4 = _isalnum((int)*pcVar9);
    if (((iVar4 == 0) && (*pcVar9 != '_')) && (*pcVar9 != '$')) {
      uVar3 = 0x8876086c;
    }
    else {
      local_8 = 1;
      while( true ) {
        iVar4 = _isalnum((int)pcVar9[local_8]);
        if ((iVar4 == 0) && (pcVar9[local_8] != '_')) break;
        local_8 = local_8 + 1;
      }
      param_1 = *(char **)(*(int *)(in_ECX + 0x10) + 0xc);
      uVar8 = 0;
      local_c = (byte *)0x0;
      iVar4 = *(int *)(*(int *)(in_ECX + 0x10) + 0x10) + *(int *)(in_ECX + 8);
      if (param_1 != (char *)0x0) {
        do {
          uVar8 = (uint)((int)param_1 + (int)local_c) >> 1;
          iVar5 = FUN_1007d7ee(local_8);
          if (iVar5 == 0) break;
          uVar2 = uVar8;
          if (iVar5 < 0) {
            local_c = (byte *)(uVar8 + 1);
            uVar2 = (uint)param_1;
          }
          param_1 = (char *)uVar2;
        } while (local_c < param_1);
      }
      if (local_c != (byte *)param_1) {
        piVar10 = (int *)(iVar4 + uVar8 * 0x14);
        pbVar7 = (byte *)(*piVar10 + *(int *)(in_ECX + 8));
        for (; uVar8 != 0; uVar8 = uVar8 - 1) {
          piVar10 = piVar10 + -5;
          local_10 = (byte *)(*piVar10 + *(int *)(in_ECX + 8));
          local_c = pbVar7;
          if (pbVar7 != local_10) {
            do {
              bVar1 = *local_c;
              bVar12 = bVar1 < *local_10;
              if (bVar1 != *local_10) {
LAB_10081301:
                iVar5 = (1 - (uint)bVar12) - (uint)(bVar12 != 0);
                goto LAB_10081306;
              }
              if (bVar1 == 0) break;
              bVar1 = local_c[1];
              bVar12 = bVar1 < local_10[1];
              if (bVar1 != local_10[1]) goto LAB_10081301;
              local_10 = local_10 + 2;
              local_c = local_c + 2;
            } while (bVar1 != 0);
            iVar5 = 0;
LAB_10081306:
            if (iVar5 != 0) break;
          }
        }
        iVar5 = FUN_10081062(pcVar9 + local_8,0);
        if (iVar5 != 0) {
          piVar10 = (int *)(iVar4 + uVar8 * 0x14);
          do {
            *param_2 = iVar5;
            param_2 = (int *)(iVar5 + 0x24);
            uVar8 = uVar8 + 1;
            piVar10 = piVar10 + 5;
            if (*(uint *)(*(int *)(in_ECX + 0x10) + 0xc) <= uVar8) {
              return 0;
            }
            pbVar6 = (byte *)(*piVar10 + *(int *)(in_ECX + 8));
            pbVar11 = pbVar7;
            if (pbVar7 != pbVar6) {
              do {
                bVar1 = *pbVar11;
                bVar12 = bVar1 < *pbVar6;
                if (bVar1 != *pbVar6) {
LAB_1008138c:
                  iVar4 = (1 - (uint)bVar12) - (uint)(bVar12 != 0);
                  goto LAB_10081391;
                }
                if (bVar1 == 0) break;
                bVar1 = pbVar11[1];
                bVar12 = bVar1 < pbVar6[1];
                if (bVar1 != pbVar6[1]) goto LAB_1008138c;
                pbVar11 = pbVar11 + 2;
                pbVar6 = pbVar6 + 2;
              } while (bVar1 != 0);
              iVar4 = 0;
LAB_10081391:
              if (iVar4 != 0) {
                return 0;
              }
            }
            iVar5 = FUN_10081062(pcVar9 + local_8,0);
          } while (iVar5 != 0);
        }
      }
      uVar3 = 0x8876086c;
    }
  }
  return uVar3;
}


