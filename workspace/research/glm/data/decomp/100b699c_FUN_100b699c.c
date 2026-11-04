// 100b699c size=822 FUN_100b699c

int FUN_100b699c(uint param_1,uint *param_2)

{
  char cVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  undefined4 *puVar5;
  int iVar6;
  char *pcVar7;
  char *pcVar8;
  int *in_ECX;
  int *piVar9;
  char local_34 [16];
  uint local_24 [5];
  uint local_10;
  int local_c;
  uint local_8;
  
  iVar6 = param_1;
  iVar3 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(param_1 + 0x6c));
  uVar4 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(param_1 + 0x6c));
  if (in_ECX[0x56] != 0) {
    if (*(int *)(param_1 + 0x6c) == -1) {
      return 0;
    }
    if (iVar3 != 0xffff) {
      puVar5 = (undefined4 *)FUN_100c8c80(iVar3);
      __snprintf(local_34,0x20,"v_%s%d",*puVar5,uVar4);
      local_24[3] = local_24[3] & 0xffffff;
      iVar6 = FUN_1006a777(local_34,*(undefined4 *)(param_1 + 0xc),1);
      if (iVar6 < 0) {
        return iVar6;
      }
      in_ECX[0x7c] = in_ECX[0x7c] + 1;
      if ((((*(byte *)(in_ECX + 0x33) & 1) != 0) && (iVar6 = *(int *)(param_1 + 0x60), iVar6 != 0))
         && ((*(int *)(iVar6 + 4) == 6 && (iVar6 = *(int *)(iVar6 + 0x14), *(int *)(iVar6 + 4) == 3)
             ))) {
        pcVar7 = *(char **)(iVar6 + 0x18);
        pcVar8 = pcVar7 + 1;
        do {
          cVar1 = *pcVar7;
          pcVar7 = pcVar7 + 1;
        } while (cVar1 != '\0');
        pcVar8 = operator_new((uint)(pcVar7 + (3 - (int)pcVar8)));
        if (pcVar8 == (char *)0x0) {
          return -0x7ff8fff2;
        }
        _sprintf(pcVar8,"n_%s",*(undefined4 *)(iVar6 + 0x18));
        iVar6 = FUN_1006a777(pcVar8,*(undefined4 *)(param_1 + 0xc),1);
        _free(pcVar8);
        if (iVar6 < 0) {
          return iVar6;
        }
        in_ECX[0x7c] = in_ECX[0x7c] + 1;
      }
    }
    if (param_2 == (uint *)0x0) {
      return 0;
    }
    param_1 = *(uint *)(param_1 + 0x6c);
    goto LAB_100b6c1c;
  }
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
    goto LAB_100b6aed;
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
    goto LAB_100b6c8a;
  }
  if (0xf < uVar4) {
LAB_100b6c8a:
    return -0x7fffbffb;
  }
LAB_100b6aed:
  param_1 = param_1 | (uVar4 | 0xffff8000) << 0x10;
  iVar3 = FUN_100c98b1(0x1f);
  if (iVar3 < 0) {
    return iVar3;
  }
  iVar3 = FUN_100c7b3a(param_1);
  if (iVar3 < 0) {
    return iVar3;
  }
  if ((*(byte *)(in_ECX + 0x33) & 1) != 0) {
    local_c = 0;
    local_8 = 0;
    local_24[0] = 0xffffffff;
    local_24[1] = 0xffffffff;
    local_24[2] = 0xffffffff;
    local_24[3] = 0xffffffff;
    if (in_ECX[2] != 0) {
      iVar3 = *(int *)(iVar6 + 4);
      piVar9 = (int *)in_ECX[5];
      do {
        iVar2 = *piVar9;
        if (((iVar3 == *(int *)(iVar2 + 4)) && (*(int *)(iVar6 + 8) == *(int *)(iVar2 + 8))) &&
           (*(int *)(iVar6 + 0xc) == *(int *)(iVar2 + 0xc))) {
          local_24[*(int *)(iVar2 + 0x10)] = local_8;
        }
        local_8 = local_8 + 1;
        piVar9 = piVar9 + 1;
      } while (local_8 < (uint)in_ECX[2]);
    }
    uVar4 = 0;
    iVar3 = local_c;
    do {
      if (local_24[uVar4] != 0xffffffff) {
        local_24[iVar3] = local_24[uVar4];
        iVar3 = iVar3 + 1;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < 4);
    iVar3 = (**(code **)(*in_ECX + 0x70))(local_24,iVar3,&local_c,1);
    if (iVar3 < 0) {
      return iVar3;
    }
  }
  iVar6 = (**(code **)(*in_ECX + 0x88))(iVar6,local_24 + 4,&local_10);
  if (iVar6 < 0) {
    return iVar6;
  }
  iVar6 = (**(code **)(*in_ECX + 100))
                    (((local_10 | 0xfffffff8) << 0x14 | local_10 & 0x18) << 8 | local_24[4] & 0x7ff,
                     0xf0000,0);
  if (iVar6 < 0) {
    return iVar6;
  }
  iVar6 = (**(code **)(*in_ECX + 0x60))();
  if (iVar6 < 0) {
    return iVar6;
  }
  iVar6 = FUN_100c4cc4();
  if (iVar6 < 0) {
    return iVar6;
  }
  if (param_2 == (uint *)0x0) {
    return 0;
  }
LAB_100b6c1c:
  *param_2 = param_1;
  return 0;
}


