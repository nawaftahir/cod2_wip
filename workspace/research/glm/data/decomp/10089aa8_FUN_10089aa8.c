// 10089aa8 size=675 FUN_10089aa8

undefined4 FUN_10089aa8(int *param_1,int *param_2,undefined4 *param_3)

{
  int *piVar1;
  uint uVar2;
  int iVar3;
  int in_ECX;
  uint uVar4;
  int *piVar5;
  uint uVar6;
  int iVar7;
  undefined4 *puVar8;
  int local_2c [4];
  int local_1c;
  uint local_18;
  int *local_14;
  uint local_c;
  uint local_8;
  
  uVar4 = 0;
  local_8 = 0;
  uVar2 = 0;
  do {
    if (param_2[uVar2] == -1) break;
    local_8 = local_8 + 1;
    uVar2 = uVar2 + 1;
  } while (uVar2 < 4);
  if (local_8 == 0) {
    return 0;
  }
  if ((*(uint *)(in_ECX + 0x6c) & 6) == 0) {
    uVar2 = local_8;
    puVar8 = param_3;
    if (local_8 != 0) {
      for (; uVar2 != 0; uVar2 = uVar2 - 1) {
        *puVar8 = 0;
        puVar8 = puVar8 + 1;
      }
    }
  }
  else {
    uVar2 = 1;
    if (1 < local_8) {
      do {
        if (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_2 * 4) + 0x20) !=
            *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + param_2[uVar2] * 4) + 0x20)) break;
        uVar2 = uVar2 + 1;
      } while (uVar2 < local_8);
    }
    if (uVar2 == local_8) {
      *param_3 = 0;
      local_8 = 1;
    }
    uVar2 = 0;
    if (local_8 != 0) {
      do {
        uVar4 = uVar4 + (param_3[uVar2] == 0);
        uVar2 = uVar2 + 1;
      } while (uVar2 < local_8);
    }
    if (((*(byte *)(in_ECX + 0x6c) & 4) != 0) && (uVar4 != 0)) {
      if (1 < uVar4) {
        return 0x80004005;
      }
      uVar2 = 0;
      if (local_8 != 0) {
        do {
          if ((param_3[uVar2] & 8) != 0) {
            return 0x80004005;
          }
          if (param_3[uVar2] == 0) {
            param_3[uVar2] = 8;
          }
          uVar2 = uVar2 + 1;
        } while (uVar2 < local_8);
      }
      uVar4 = 0;
    }
    uVar2 = 0;
    uVar6 = 0;
    if (local_8 != 0) {
      do {
        if ((uVar6 & param_3[uVar2]) != 0) {
          return 0x80004005;
        }
        uVar6 = uVar6 | param_3[uVar2];
        uVar2 = uVar2 + 1;
      } while (uVar2 < local_8);
    }
    iVar3 = 0;
    uVar2 = 0;
    do {
      if ((uVar6 & 1 << ((byte)uVar2 & 0x1f)) != 0) {
        iVar3 = iVar3 + 1;
      }
      uVar2 = uVar2 + 1;
    } while (uVar2 < 4);
    if (4 < iVar3 + uVar4) {
      return 0x80004005;
    }
  }
  local_1c = 0;
  local_14 = param_1;
  do {
    piVar1 = local_14;
    local_c = 0;
    local_2c[0] = *local_14;
    local_2c[1] = local_14[1];
    local_2c[2] = local_14[2];
    local_2c[3] = local_14[3];
    if (local_8 == 0) {
LAB_10089c61:
      local_18 = 0;
      if (local_8 == 0) {
LAB_10089cfe:
        uVar2 = 0;
        do {
          iVar7 = uVar2 * 4;
          iVar3 = local_2c[uVar2];
          if (iVar3 != *(int *)((int)piVar1 + (int)local_2c + (iVar7 - (int)local_2c))) {
            iVar3 = FUN_10089955(param_1,local_1c,uVar2,iVar3);
          }
          uVar2 = uVar2 + 1;
          *(int *)((int)param_2 + (int)local_2c + (iVar7 - (int)local_2c)) = iVar3;
        } while (uVar2 < 4);
        return 0;
      }
      local_c = (int)param_3 - (int)param_2;
      piVar5 = param_2;
      do {
        uVar2 = 0;
        if (*(int *)(((int)param_3 - (int)param_2) + (int)piVar5) == 0) {
          do {
            if ((local_2c[uVar2] != -1) &&
               (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + local_2c[uVar2] * 4) + 0x20) ==
                *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + param_2[local_18] * 4) + 0x20)))
            break;
            uVar2 = uVar2 + 1;
          } while (uVar2 < 4);
          if (3 < uVar2) {
            uVar2 = 0;
            do {
              if (local_2c[uVar2] == -1) {
                local_2c[uVar2] = *piVar5;
                break;
              }
              uVar2 = uVar2 + 1;
            } while (uVar2 < 4);
            if (uVar2 == 4) break;
          }
        }
        local_18 = local_18 + 1;
        piVar5 = piVar5 + 1;
      } while (local_18 < local_8);
      if (local_8 <= local_18) goto LAB_10089cfe;
    }
    else {
      do {
        uVar4 = 0;
        uVar2 = param_3[local_c];
        do {
          if ((uVar2 & 1 << ((byte)uVar4 & 0x1f)) != 0) {
            iVar3 = local_2c[uVar4];
            if (iVar3 == -1) {
              local_2c[uVar4] = param_2[local_c];
            }
            else if (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4) + 0x20) !=
                     *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + param_2[local_c] * 4) + 0x20))
            break;
          }
          uVar4 = uVar4 + 1;
        } while (uVar4 < 4);
      } while ((3 < uVar4) && (local_c = local_c + 1, local_c < local_8));
      if (local_8 <= local_c) goto LAB_10089c61;
    }
    local_1c = local_1c + 1;
    local_14 = local_14 + 4;
  } while( true );
}


