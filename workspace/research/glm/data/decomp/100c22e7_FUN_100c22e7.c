// 100c22e7 size=508 FUN_100c22e7

int FUN_100c22e7(int param_1,undefined4 *param_2,undefined4 param_3,uint param_4,uint param_5,
                int param_6)

{
  uint *puVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  uint uVar5;
  uint extraout_EDX;
  int *piVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  uint local_18;
  int local_14;
  int local_c;
  uint local_8;
  
  iVar3 = 1;
  local_14 = 1;
  if (param_4 != 0) {
    puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + -4 + param_4 * 4);
    iVar3 = FUN_10085604();
    if (((iVar3 == 0) && (uVar5 = *puVar1, (uVar5 & 0xf0000000) != 0x60000000)) &&
       (iVar3 = local_14, uVar2 = param_4, (uVar5 & 0xfff00000) != 0x11000000)) {
      while (uVar2 = uVar2 - 1, -1 < (int)uVar2) {
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar2 * 4);
        if (puVar1[9] != param_4) {
          uVar5 = *puVar1 & 0xfff00000;
          if (uVar5 != 0) {
            if ((*puVar1 & 0xf0000000) == 0x60000000) {
              return iVar3;
            }
            if (uVar5 == 0x11000000) {
              return iVar3;
            }
            FUN_100b9ffd(param_3,puVar1,param_4);
            local_c = 0;
            local_8 = (uint)((*puVar1 & extraout_EDX) == 0x50000000);
            local_18 = puVar1[3];
            if (local_18 != 0) {
              piVar6 = (int *)puVar1[4];
              do {
                iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar6 * 4);
                if (*(int *)(in_ECX + 0x6c) << 3 < 0) {
                  iVar4 = *(int *)(iVar4 + 0x10);
                }
                else {
                  iVar4 = *(int *)(*(int *)(param_1 + 0x14) +
                                  (*(int *)(iVar4 + 0x10) + *(int *)(iVar4 + 0xc) * 4) * 4);
                }
                if (iVar4 == 3) {
                  local_c = 1;
                }
                else {
                  local_8 = 1;
                }
                piVar6 = piVar6 + 1;
                local_18 = local_18 - 1;
              } while (local_18 != 0);
            }
            if ((local_8 != param_5) && (local_c != param_6)) {
              iVar3 = FUN_100c229a(param_4 - 1,uVar2);
              if (iVar3 < 0) {
                return iVar3;
              }
              if ((*(byte *)(in_ECX + 0x6f) & 0x10) != 0) {
                return 0;
              }
              iVar4 = FUN_10093058(param_1,0);
              if (-1 < iVar4) {
                local_18 = puVar1[3];
                if (local_18 != 0) {
                  piVar6 = (int *)puVar1[4];
                  do {
                    iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar6 * 4);
                    if (*(int *)(*(int *)(param_1 + 0x14) +
                                (*(int *)(iVar4 + 0x10) + *(int *)(iVar4 + 0xc) * 4) * 4) == 3) {
                      local_c = 1;
                    }
                    else {
                      local_8 = 1;
                    }
                    piVar6 = piVar6 + 1;
                    local_18 = local_18 - 1;
                  } while (local_18 != 0);
                }
                if ((local_8 != param_5) && (local_c != param_6)) {
                  return 0;
                }
              }
              puVar7 = param_2;
              puVar8 = *(undefined4 **)(in_ECX + 0x18);
              for (uVar5 = *(uint *)(in_ECX + 0xc) & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
                *puVar8 = *puVar7;
                puVar7 = puVar7 + 1;
                puVar8 = puVar8 + 1;
              }
              for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
                *(undefined1 *)puVar8 = *(undefined1 *)puVar7;
                puVar7 = (undefined4 *)((int)puVar7 + 1);
                puVar8 = (undefined4 *)((int)puVar8 + 1);
              }
            }
          }
        }
      }
    }
    else {
      iVar3 = 1;
    }
  }
  return iVar3;
}


