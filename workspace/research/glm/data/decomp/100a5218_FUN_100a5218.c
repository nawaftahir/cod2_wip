// 100a5218 size=1023 FUN_100a5218

int FUN_100a5218(uint param_1,uint *param_2)

{
  char cVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  undefined4 *puVar5;
  int iVar6;
  char *pcVar7;
  int *in_ECX;
  int *piVar8;
  uint uVar9;
  char *pcVar10;
  undefined4 uVar11;
  char local_50 [31];
  undefined1 local_31;
  uint local_30 [7];
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  iVar6 = param_1;
  iVar3 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(param_1 + 0x6c));
  uVar4 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(param_1 + 0x6c));
  if (in_ECX[0x56] != 0) {
    if (*(int *)(param_1 + 0x6c) == -1) {
      return 0;
    }
    if (iVar3 != 0xffff) {
      if ((*(byte *)(*(int *)(in_ECX[4] + *(int *)(param_1 + 4) * 4) + 4) & 0x10) == 0) {
        puVar5 = (undefined4 *)FUN_100c8c80(iVar3);
        uVar11 = *puVar5;
        pcVar10 = "o_%s%d";
      }
      else {
        puVar5 = (undefined4 *)FUN_100c8c80(iVar3);
        uVar11 = *puVar5;
        pcVar10 = "v_%s%d";
      }
      __snprintf(local_50,0x20,pcVar10,uVar11,uVar4);
      local_31 = 0;
      iVar6 = FUN_1006a777(local_50,*(undefined4 *)(param_1 + 0xc),1);
      if (iVar6 < 0) {
        return iVar6;
      }
      in_ECX[0x7c] = in_ECX[0x7c] + 1;
      if (((((*(byte *)(in_ECX + 0x33) & 1) != 0) && (iVar6 = *(int *)(param_1 + 0x60), iVar6 != 0))
          && (*(int *)(iVar6 + 4) == 6)) &&
         (iVar6 = *(int *)(iVar6 + 0x14), *(int *)(iVar6 + 4) == 3)) {
        pcVar7 = *(char **)(iVar6 + 0x18);
        pcVar10 = pcVar7 + 1;
        do {
          cVar1 = *pcVar7;
          pcVar7 = pcVar7 + 1;
        } while (cVar1 != '\0');
        pcVar10 = operator_new((uint)(pcVar7 + (3 - (int)pcVar10)));
        if (pcVar10 == (char *)0x0) {
          return -0x7ff8fff2;
        }
        _sprintf(pcVar10,"n_%s",*(undefined4 *)(iVar6 + 0x18));
        iVar6 = FUN_1006a777(pcVar10,*(undefined4 *)(param_1 + 0xc),1);
        _free(pcVar10);
        if (iVar6 < 0) {
          return iVar6;
        }
        in_ECX[0x7c] = in_ECX[0x7c] + 1;
      }
    }
    if (param_2 == (uint *)0x0) {
      return 0;
    }
    *param_2 = *(uint *)(param_1 + 0x6c);
    return 0;
  }
  local_c = 0;
  switch(iVar3) {
  case 0:
    return 1;
  case 1:
    param_1 = 0;
    break;
  case 2:
    param_1 = 1;
    break;
  case 3:
    param_1 = 2;
    break;
  case 4:
    param_1 = 3;
    break;
  case 5:
    param_1 = 4;
    break;
  case 6:
    param_1 = 5;
    break;
  case 7:
    param_1 = 6;
    break;
  case 8:
    param_1 = 7;
    break;
  case 9:
    param_1 = 8;
    if (uVar4 != 0) {
      return -0x7fffbffb;
    }
    goto LAB_100a538c;
  case 10:
    param_1 = 9;
    break;
  case 0xb:
    param_1 = 10;
    break;
  case 0xc:
    param_1 = 0xb;
    break;
  case 0xd:
    param_1 = 0xc;
    break;
  case 0xe:
    param_1 = 0xd;
    break;
  default:
    goto LAB_100a546f;
  case 0x11:
    param_1 = 0x80000000;
    local_c = 1;
    break;
  case 0x12:
    param_1 = 0x80000000;
  }
  if (0xf < uVar4) {
LAB_100a546f:
    return -0x7fffbffb;
  }
LAB_100a538c:
  param_1 = param_1 | (uVar4 | 0xffff8000) << 0x10;
  local_30[5] = 0;
  if ((*(byte *)(iVar6 + 3) & 1) != 0) {
    local_30[5] = 0x400000;
  }
  iVar3 = FUN_100c98b1(0x1f);
  if (iVar3 < 0) {
    return iVar3;
  }
  iVar3 = FUN_100c7b3a(param_1);
  if (iVar3 < 0) {
    return iVar3;
  }
  if ((*(byte *)(*(int *)(in_ECX[4] + *(int *)(iVar6 + 4) * 4) + 4) & 0x10) == 0) {
    iVar3 = (**(code **)(*in_ECX + 0x84))(iVar6,local_30 + 6,&local_14,&local_c);
    if (iVar3 < 0) {
      return iVar3;
    }
    local_c = 0;
  }
  else {
    local_c = local_c | (in_ECX[0x1c] << 0x19) >> 0x1f;
    iVar3 = (**(code **)(*in_ECX + 0x88))(iVar6,local_30 + 6,&local_14);
    if (iVar3 < 0) {
      return iVar3;
    }
  }
  local_30[4] = 0;
  local_10 = 0;
  local_30[0] = 0xffffffff;
  local_30[1] = 0xffffffff;
  local_30[2] = 0xffffffff;
  local_30[3] = 0xffffffff;
  if (in_ECX[2] != 0) {
    iVar3 = *(int *)(iVar6 + 4);
    piVar8 = (int *)in_ECX[5];
    do {
      iVar2 = *piVar8;
      if (((iVar3 == *(int *)(iVar2 + 4)) && (*(int *)(iVar6 + 8) == *(int *)(iVar2 + 8))) &&
         (*(int *)(iVar6 + 0xc) == *(int *)(iVar2 + 0xc))) {
        local_30[*(int *)(iVar2 + 0x10)] = local_10;
      }
      local_10 = local_10 + 1;
      piVar8 = piVar8 + 1;
    } while (local_10 < (uint)in_ECX[2]);
  }
  uVar9 = 0;
  uVar4 = local_30[4];
  do {
    if (local_30[uVar9] != 0xffffffff) {
      local_30[uVar4] = local_30[uVar9];
      uVar4 = uVar4 + 1;
    }
    uVar9 = uVar9 + 1;
  } while (uVar9 < 4);
  iVar3 = (**(code **)(*in_ECX + 0x70))(local_30,uVar4,&local_8,local_c);
  if (iVar3 < 0) {
    return iVar3;
  }
  uVar4 = (**(code **)(*in_ECX + 0x50))(4,0);
  if ((param_1 & 0x7fffffff) == uVar4) {
    local_8 = local_8 | 0xf0000;
  }
  local_8 = local_8 & 0xffefffff;
  if (((*(byte *)(in_ECX + 0x1c) & 0x40) == 0) &&
     (((*(byte *)(in_ECX + 0x33) & 0x20) != 0 || ((*(byte *)(iVar6 + 3) & 2) != 0)))) {
    local_8 = local_8 | 0x200000;
  }
  iVar6 = (**(code **)(*in_ECX + 100))
                    (((local_14 | 0xfffffff8) << 0x14 | local_14 & 0x18) << 8 | local_30[6] & 0x7ff
                     | local_30[5],local_8,0);
  if (iVar6 < 0) {
    return iVar6;
  }
  iVar6 = (**(code **)(*in_ECX + 0x60))();
  if (iVar6 < 0) {
    return iVar6;
  }
  iVar6 = FUN_100c4cc4();
  if (-1 < iVar6) {
    if (param_2 != (uint *)0x0) {
      *param_2 = param_1;
    }
    return 0;
  }
  return iVar6;
}


