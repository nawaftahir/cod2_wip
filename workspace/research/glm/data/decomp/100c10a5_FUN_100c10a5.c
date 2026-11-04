// 100c10a5 size=469 FUN_100c10a5

undefined4 FUN_100c10a5(uint param_1,int param_2,uint param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int *in_ECX;
  int *piVar4;
  uint uVar5;
  uint uVar6;
  int local_18;
  int *local_14;
  int *local_10;
  uint local_c;
  uint local_8;
  
  iVar2 = param_1;
  iVar3 = (**(code **)(*in_ECX + 0x20))(param_1,0);
  if (iVar3 == 0) {
    local_8 = 0;
    local_14 = *(int **)(param_1 + 0xc);
    param_1 = 0xffffffff;
    if (local_14 != (int *)0x0) {
      piVar4 = *(int **)(iVar2 + 0x10);
      do {
        iVar3 = *(int *)(in_ECX[5] + *piVar4 * 4);
        uVar5 = *(uint *)(iVar3 + 0x4c);
        if (local_8 < uVar5) {
          local_8 = uVar5;
        }
        uVar5 = *(uint *)(iVar3 + 0x48);
        if (uVar5 < param_1) {
          param_1 = uVar5;
        }
        piVar4 = piVar4 + 1;
        local_14 = (int *)((int)local_14 + -1);
      } while (local_14 != (int *)0x0);
    }
    local_18 = *(int *)(iVar2 + 4);
    if (local_18 != 0) {
      local_14 = *(int **)(iVar2 + 8);
      do {
        iVar3 = *(int *)(in_ECX[5] + *local_14 * 4);
        if (((*(byte *)(*(int *)(in_ECX[4] + *(int *)(iVar3 + 4) * 4) + 4) & 2) != 0) &&
           (*(int *)(iVar3 + 0x48) != -1)) {
          uVar5 = *(int *)(iVar3 + 0x48) + 1;
          if (local_8 < uVar5) {
            local_8 = uVar5;
          }
          while (uVar5 = *(uint *)(iVar3 + 0x50), uVar5 <= param_1) {
            if ((uVar5 == 0xffffffff) || (uVar6 = 0, param_3 == 0)) {
LAB_100c11c0:
              param_1 = *(int *)(iVar3 + 0x50) - 1;
              break;
            }
            do {
              if (*(int *)(param_2 + uVar6 * 4) == *(int *)(in_ECX[6] + uVar5 * 4)) break;
              uVar6 = uVar6 + 1;
            } while (uVar6 < param_3);
            if (param_3 <= uVar6) goto LAB_100c11c0;
            iVar1 = *(int *)(param_2 + uVar6 * 4);
            local_c = 0;
            if (*(int *)(iVar1 + 0xc) != 0) {
              local_10 = *(int **)(iVar1 + 0x10);
              do {
                if (*(int *)(iVar3 + 0x10) == *(int *)(*(int *)(in_ECX[5] + *local_10 * 4) + 0x10))
                break;
                local_c = local_c + 1;
                local_10 = local_10 + 1;
              } while (local_c < *(uint *)(iVar1 + 0xc));
            }
            if (*(uint *)(iVar1 + 0xc) <= local_c) goto LAB_100c11c0;
            iVar3 = *(int *)(in_ECX[5] + *(int *)(*(int *)(iVar1 + 0x10) + local_c * 4) * 4);
          }
        }
        local_14 = local_14 + 1;
        local_18 = local_18 + -1;
      } while (local_18 != 0);
    }
    uVar5 = 0;
    if (param_3 == 0) {
      uVar6 = 0;
    }
    else {
      do {
        uVar6 = *(uint *)(*(int *)(in_ECX[5] + **(int **)(*(int *)(param_2 + uVar5 * 4) + 0x10) * 4)
                         + 0x48);
        if ((local_8 <= uVar6) && (uVar6 <= param_1)) break;
        uVar5 = uVar5 + 1;
      } while (uVar5 < param_3);
    }
    if ((uVar5 != param_3) && (iVar3 = (**(code **)(*in_ECX + 0x34))(iVar2,uVar6), iVar3 == 0)) {
      uVar5 = 0;
      if (param_3 != 0) {
        do {
          **(undefined4 **)(param_2 + uVar5 * 4) = 0;
          uVar5 = uVar5 + 1;
        } while (uVar5 < param_3);
      }
      if (*(int *)(in_ECX[6] + uVar6 * 4) != 0) {
        FUN_1006c418(1);
      }
      *(int *)(in_ECX[6] + uVar6 * 4) = iVar2;
      uVar5 = 0;
      if (*(int *)(iVar2 + 0xc) != 0) {
        do {
          iVar3 = uVar5 * 4;
          uVar5 = uVar5 + 1;
          *(uint *)(*(int *)(in_ECX[5] + *(int *)(*(int *)(iVar2 + 0x10) + iVar3) * 4) + 0x48) =
               uVar6;
        } while (uVar5 < *(uint *)(iVar2 + 0xc));
      }
      return 0;
    }
  }
  if (iVar2 != 0) {
    FUN_1006c418(1);
  }
  return 1;
}


