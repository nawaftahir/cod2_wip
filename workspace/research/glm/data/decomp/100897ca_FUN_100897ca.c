// 100897ca size=395 FUN_100897ca

int FUN_100897ca(uint param_1,int param_2,int *param_3)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  uint in_ECX;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  int *local_10;
  int *local_c;
  uint local_8;
  
  iVar2 = *(int *)(*(int *)(in_ECX + 0x18) + param_1 * 4);
  uVar5 = 0;
  if (*(int *)(iVar2 + 0x24) == 0) {
    local_8 = in_ECX;
    if (*(int *)(iVar2 + 0x14) != 0) {
      do {
        local_10 = (int *)0x0;
        piVar1 = (int *)(*(int *)(iVar2 + 0x18) + uVar5 * 4);
        iVar4 = *(int *)(*(int *)(local_8 + 0x18) + *piVar1 * 4);
        local_c = (int *)0x0;
        FUN_1008974a(iVar4,&local_c,&local_10,*piVar1);
        uVar5 = uVar5 + 1;
        *(int *)(iVar4 + 0x30) = (int)local_10 / ((int)local_c + 1);
        in_ECX = local_8;
      } while (uVar5 < *(uint *)(iVar2 + 0x14));
    }
    FUN_10086920(FUN_100865e0,*(undefined4 *)(iVar2 + 0x18),*(undefined4 *)(iVar2 + 0x14),in_ECX);
    uVar5 = 0;
    if (*(int *)(iVar2 + 0x14) != 0) {
      do {
        iVar4 = FUN_100897ca(*(undefined4 *)(*(int *)(iVar2 + 0x18) + uVar5 * 4),param_2,param_3);
        if (iVar4 < 0) {
          return iVar4;
        }
        uVar5 = uVar5 + 1;
      } while (uVar5 < *(uint *)(iVar2 + 0x14));
    }
    if (*(int *)(iVar2 + 0x24) == 0) {
      local_8 = 0;
      *(undefined4 *)(iVar2 + 0x24) = 1;
      *(uint *)(param_2 + *param_3 * 4) = param_1;
      *param_3 = *param_3 + 1;
      if (*(int *)(iVar2 + 0x14) != 0) {
        do {
          iVar4 = *(int *)(in_ECX + 0x18);
          iVar3 = *(int *)(iVar4 + *(int *)(*(int *)(iVar2 + 0x18) + local_8 * 4) * 4);
          uVar5 = *(uint *)(iVar3 + 0x1c);
          param_1 = 0;
          if (uVar5 != 0) {
            local_10 = *(int **)(iVar3 + 0x20);
            uVar6 = 0xffffffff;
            local_c = local_10;
            do {
              uVar7 = uVar6;
              if ((*(int *)(*(int *)(iVar4 + *local_c * 4) + 0x24) == 0) &&
                 (uVar7 = param_1, uVar6 != 0xffffffff)) goto LAB_100898ed;
              param_1 = param_1 + 1;
              local_c = local_c + 1;
              uVar6 = uVar7;
            } while (param_1 < uVar5);
            if (uVar7 != 0xffffffff) {
LAB_100898ed:
              if (param_1 == uVar5) {
                iVar3 = *(int *)(iVar4 + local_10[uVar6] * 4);
                uVar5 = *(uint *)(iVar3 + 0x14);
                param_1 = 0;
                if (uVar5 != 0) {
                  local_c = *(int **)(iVar3 + 0x18);
                  do {
                    if (*(int *)(*(int *)(iVar4 + *local_c * 4) + 0x24) == 0) break;
                    param_1 = param_1 + 1;
                    local_c = local_c + 1;
                  } while (param_1 < uVar5);
                }
                if ((uVar5 <= param_1) &&
                   (iVar4 = FUN_100897ca(local_10[uVar6],param_2,param_3), iVar4 < 0)) {
                  return iVar4;
                }
              }
            }
          }
          local_8 = local_8 + 1;
        } while (local_8 < *(uint *)(iVar2 + 0x14));
      }
    }
  }
  return 0;
}


