// 10071188 size=949 FUN_10071188

bool FUN_10071188(uint param_1,int param_2,undefined4 *param_3,int *param_4)

{
  byte *pbVar1;
  uint uVar2;
  uint *puVar3;
  double dVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int in_ECX;
  int *piVar8;
  int *piVar9;
  double local_28;
  undefined4 local_20;
  int iStack_1c;
  uint *local_18;
  int local_14;
  int local_10;
  uint local_c;
  uint local_8;
  
  iVar5 = param_1;
  do {
    while( true ) {
      if (iVar5 == -1) {
        return false;
      }
      iVar5 = *(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iVar5 * 4) + 0x48);
      if (iVar5 == -1) {
        return false;
      }
      piVar9 = *(int **)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + iVar5 * 4);
      if (*piVar9 != 0x10000001) break;
LAB_1007121b:
      iVar5 = *(int *)piVar9[2];
    }
    if (*piVar9 != 0x20500001) {
      if (*piVar9 == 0x20200001) {
        iVar5 = FUN_1006e16c(*(undefined4 *)piVar9[2],&local_20);
        if (iVar5 < 0) {
          return false;
        }
        dVar4 = (double)param_2;
        if (param_2 < 0) {
          dVar4 = dVar4 + 4294967296.0;
        }
        if ((double)CONCAT44(iStack_1c,local_20) != dVar4) {
          return false;
        }
        param_1 = *(int *)(piVar9[2] + 4);
        iVar5 = FUN_1007107a(0,&param_1,1);
        if (iVar5 < 0) {
          return false;
        }
        if (*param_4 != -1) {
          return param_1 == *param_4;
        }
        iVar5 = *(int *)(*(int *)(in_ECX + 8) + 0x14);
        pbVar1 = *(byte **)(iVar5 + param_1 * 4);
        if ((*pbVar1 & 2) == 0) {
          return false;
        }
        uVar2 = *(uint *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) + *(int *)(pbVar1 + 4) * 4)
                         + 4);
        if ((uVar2 & 0x100) != 0) {
          return false;
        }
        if ((uVar2 & 0x10) == 0) {
          return false;
        }
        if ((uVar2 & 0x200) == 0) {
          return false;
        }
        if (param_3 == (undefined4 *)0x0) goto LAB_100712ef;
        iVar5 = *(int *)(iVar5 + *(int *)piVar9[2] * 4);
        goto LAB_100712ea;
      }
      if (*piVar9 != 0x30000001) {
        return false;
      }
      piVar9 = (int *)piVar9[2];
      iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + piVar9[1] * 4);
      if ((*(uint *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) + *(int *)(iVar5 + 4) * 4) + 4)
          & 0x100) == 0) {
        return false;
      }
      if (*(int *)(iVar5 + 8) != -1) {
        return false;
      }
      if (*(double *)(iVar5 + 0x20) != 0.0) {
        return false;
      }
      iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + piVar9[2] * 4);
      if ((*(uint *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) + *(int *)(iVar5 + 4) * 4) + 4)
          & 0x100) == 0) {
        return false;
      }
      if (*(int *)(iVar5 + 8) != -1) {
        return false;
      }
      if (*(double *)(iVar5 + 0x20) != 1.0) {
        return false;
      }
      iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar9 * 4);
      if ((*(byte *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) + *(int *)(iVar5 + 4) * 4) + 4)
          & 2) == 0) {
        return false;
      }
      if (*(int *)(iVar5 + 8) != -1) {
        return false;
      }
      local_18 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + *(int *)(iVar5 + 0x48) * 4);
      if ((*local_18 & 0xfff00000) != 0x20400000) {
        return false;
      }
      param_1 = 0;
      if (local_18[3] == 0) goto LAB_100713ed;
      piVar8 = (int *)local_18[4];
      break;
    }
    iVar5 = FUN_1006e16c(*(undefined4 *)piVar9[2],&local_20);
    if ((iVar5 < 0) || ((double)CONCAT44(iStack_1c,local_20) != 1.0)) {
      iVar5 = FUN_1006e16c(*(undefined4 *)(piVar9[2] + 4),&local_20);
      if (iVar5 < 0) {
        return false;
      }
      if ((double)CONCAT44(iStack_1c,local_20) != 1.0) {
        return false;
      }
      goto LAB_1007121b;
    }
    iVar5 = *(int *)(piVar9[2] + 4);
  } while( true );
  while( true ) {
    param_1 = param_1 + 1;
    piVar8 = piVar8 + 1;
    if (local_18[3] <= param_1) break;
    if (*piVar8 == *piVar9) break;
  }
LAB_100713ed:
  local_c = 0;
  local_14 = 1;
  do {
    iStack_1c = *(int *)(local_18[2] + (local_18[3] * local_c + param_1) * 4);
    iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iStack_1c * 4);
    if ((((*(byte *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) + *(int *)(iVar5 + 4) * 4) + 4)
          & 2) != 0) && (*(int *)(iVar5 + 8) == -1)) &&
       (puVar3 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + *(int *)(iVar5 + 0x48) * 4),
       (*puVar3 & 0xfff00000) == 0x10100000)) {
      local_8 = 0;
      if (puVar3[3] != 0) {
        piVar9 = (int *)puVar3[4];
        do {
          if (*piVar9 == iStack_1c) break;
          local_8 = local_8 + 1;
          piVar9 = piVar9 + 1;
        } while (local_8 < puVar3[3]);
      }
      iVar5 = *(int *)(local_18[2] + (local_18[3] * local_14 + param_1) * 4);
      iVar7 = *(int *)(puVar3[2] + local_8 * 4);
      iVar6 = FUN_1006e16c(iVar5,&local_28);
      if (-1 < iVar6) {
        dVar4 = (double)param_2;
        if (param_2 < 0) {
          dVar4 = dVar4 + 4294967296.0;
        }
        if ((local_28 == dVar4) &&
           (local_10 = iVar7, iVar7 = FUN_1007107a(0,&local_10,1), -1 < iVar7)) {
          if (*param_4 == -1) {
            pbVar1 = *(byte **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + local_10 * 4);
            if ((((*pbVar1 & 2) != 0) &&
                (uVar2 = *(uint *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) +
                                           *(int *)(pbVar1 + 4) * 4) + 4), (uVar2 & 0x100) == 0)) &&
               (((uVar2 & 0x10) != 0 && ((uVar2 & 0x200) != 0)))) {
              param_1 = local_10;
              if (param_3 != (undefined4 *)0x0) {
                iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iVar5 * 4);
LAB_100712ea:
                *param_3 = *(undefined4 *)(iVar5 + 0x30);
              }
LAB_100712ef:
              *param_4 = param_1;
              return true;
            }
          }
          else if (local_10 == *param_4) {
            return true;
          }
        }
      }
    }
    local_c = local_c + 1;
    local_14 = local_14 + -1;
    if (1 < local_c) {
      return false;
    }
  } while( true );
}


