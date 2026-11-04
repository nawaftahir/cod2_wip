// 100ac9bb size=351 FUN_100ac9bb

undefined4
FUN_100ac9bb(int param_1,uint param_2,uint param_3,int param_4,uint param_5,int param_6,
            uint *param_7)

{
  uint *puVar1;
  uint uVar2;
  int iVar3;
  bool bVar4;
  uint uVar5;
  uint uVar6;
  int in_ECX;
  int *piVar7;
  uint uVar8;
  int iVar9;
  uint uVar10;
  uint local_10;
  uint local_c;
  int local_8;
  
  uVar6 = param_2;
  do {
    if (param_3 <= uVar6) {
      return 0;
    }
    puVar1 = *(uint **)(param_1 + uVar6 * 4);
    if ((puVar1 != (uint *)0x0) && (uVar8 = *puVar1 & 0xfffff, *puVar1 != 0)) {
      uVar2 = puVar1[1];
      local_10 = 0;
      if (uVar2 / uVar8 != 0) {
        param_2 = 0;
        do {
          bVar4 = false;
          if (uVar8 != 0) {
            piVar7 = (int *)(puVar1[2] + param_2);
            local_c = uVar8;
            do {
              iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar7 * 4);
              uVar5 = 0;
              if (param_5 != 0) {
                do {
                  iVar3 = *(int *)(param_4 + uVar5 * 4);
                  if (((*piVar7 == iVar3) || (*(int *)(iVar9 + 0x38) == iVar3)) &&
                     (*(int *)(iVar9 + 0xc) == -1)) {
                    bVar4 = true;
                  }
                  uVar5 = uVar5 + 1;
                } while (uVar5 < param_5);
              }
              piVar7 = piVar7 + 1;
              local_c = local_c - 1;
            } while (local_c != 0);
            if (bVar4) {
              local_c = 0;
              local_8 = param_2;
              do {
                iVar9 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                         *(int *)(local_8 + puVar1[2]) * 4) + 0x38);
                if (iVar9 == -1) {
                  iVar9 = *(int *)(local_8 + puVar1[2]);
                }
                uVar5 = *param_7;
                uVar10 = 0;
                if (uVar5 != 0) {
                  do {
                    if (*(int *)(param_6 + uVar10 * 4) == iVar9) break;
                    uVar10 = uVar10 + 1;
                  } while (uVar10 < *param_7);
                }
                if (uVar10 == uVar5) {
                  if (uVar10 == 0x20) {
                    FUN_1008b0b5();
                    return 0x80004005;
                  }
                  *(int *)(param_6 + uVar5 * 4) = iVar9;
                  *param_7 = *param_7 + 1;
                }
                local_c = local_c + 1;
                local_8 = local_8 + 4;
              } while (local_c < uVar8);
            }
          }
          local_10 = local_10 + 1;
          param_2 = param_2 + uVar8 * 4;
        } while (local_10 < uVar2 / uVar8);
      }
    }
    uVar6 = uVar6 + 1;
  } while( true );
}


