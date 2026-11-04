// 100b3b45 size=736 FUN_100b3b45

int FUN_100b3b45(char *param_1,uint *param_2)

{
  char *pcVar1;
  char cVar2;
  int iVar3;
  uint uVar4;
  undefined4 *puVar5;
  int iVar6;
  char *pcVar7;
  uint uVar8;
  int *in_ECX;
  int *piVar9;
  uint uVar10;
  int iVar11;
  char local_34 [16];
  uint local_24 [5];
  int local_10;
  uint local_c;
  uint local_8;
  
  iVar11 = (int)param_1;
  param_1 = (char *)(**(code **)(*in_ECX + 0x54))(*(undefined4 *)((int)param_1 + 0x6c));
  uVar4 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(iVar11 + 0x6c));
  uVar10 = 0;
  local_24[4] = uVar4;
  if (in_ECX[0x56] == 0) {
    if (param_1 == (char *)0xb) {
      if ((uint)in_ECX[10] <= uVar4) {
        return -0x7fffbffb;
      }
      *param_2 = uVar4;
      uVar8 = in_ECX[uVar4 + 0x86];
      local_8 = 1;
    }
    else {
      if (param_1 != (char *)0x6) {
        return -0x7fffbffb;
      }
      if (7 < uVar4) {
        return -0x7fffbffb;
      }
      *param_2 = uVar4 + 2;
      uVar8 = in_ECX[uVar4 + 0x7e];
      local_8 = 3;
    }
    param_2 = (uint *)0x0;
    if (uVar8 != 0) {
      do {
        if (uVar10 == 0) {
          param_2 = (uint *)((uint)param_2 | 0x10000);
        }
        else if (uVar10 == 1) {
          param_2 = (uint *)((uint)param_2 | 0x20000);
        }
        else if (uVar10 == 2) {
          param_2 = (uint *)((uint)param_2 | 0x40000);
        }
        else if (uVar10 == 3) {
          param_2 = (uint *)((uint)param_2 | 0x80000);
        }
        uVar10 = uVar10 + 1;
      } while (uVar10 < uVar8);
    }
    if ((local_8 != 1) &&
       (((*(byte *)(in_ECX + 0x33) & 0x20) != 0 ||
        ((param_1 == (char *)0x6 && ((*(byte *)(iVar11 + 3) & 2) != 0)))))) {
      param_2 = (uint *)((uint)param_2 | 0x200000);
    }
    local_c = 0;
    if ((*(byte *)(iVar11 + 3) & 1) != 0) {
      local_c = 0x400000;
    }
    iVar6 = FUN_100c98b1(0x200001f);
    if (iVar6 < 0) {
      return iVar6;
    }
    iVar6 = FUN_100c7b3a(0x80000000);
    if (iVar6 < 0) {
      return iVar6;
    }
    if ((*(byte *)(in_ECX + 0x33) & 1) != 0) {
      local_10 = 0;
      param_1 = (char *)0x0;
      local_24[0] = 0xffffffff;
      local_24[1] = 0xffffffff;
      local_24[2] = 0xffffffff;
      local_24[3] = 0xffffffff;
      if (in_ECX[2] != 0) {
        iVar6 = *(int *)(iVar11 + 4);
        piVar9 = (int *)in_ECX[5];
        do {
          iVar3 = *piVar9;
          if (((iVar6 == *(int *)(iVar3 + 4)) && (*(int *)(iVar11 + 8) == *(int *)(iVar3 + 8))) &&
             (*(int *)(iVar11 + 0xc) == *(int *)(iVar3 + 0xc))) {
            local_24[*(int *)(iVar3 + 0x10)] = (uint)param_1;
          }
          param_1 = (char *)((int)param_1 + 1);
          piVar9 = piVar9 + 1;
        } while (param_1 < (uint)in_ECX[2]);
      }
      uVar4 = 0;
      iVar11 = local_10;
      do {
        if (local_24[uVar4] != 0xffffffff) {
          local_24[iVar11] = local_24[uVar4];
          iVar11 = iVar11 + 1;
        }
        uVar4 = uVar4 + 1;
      } while (uVar4 < 4);
      iVar11 = (**(code **)(*in_ECX + 0x70))(local_24,iVar11,&param_1,1);
      uVar4 = local_24[4];
      if (iVar11 < 0) {
        return iVar11;
      }
    }
    iVar11 = (**(code **)(*in_ECX + 100))
                       (((local_8 | 0xfffffff8) << 0x14 | local_8 & 0x18) << 8 | uVar4 & 0x7ff |
                        local_c,param_2,0);
    if (iVar11 < 0) {
      return iVar11;
    }
    iVar11 = FUN_100c4cc4();
    if (iVar11 < 0) {
      return iVar11;
    }
  }
  else if (*(int *)(iVar11 + 0x6c) != -1) {
    if (param_1 != (char *)0xffff) {
      puVar5 = (undefined4 *)FUN_100c8c80(param_1);
      __snprintf(local_34,0x20,"v_%s%d",*puVar5,uVar4);
      local_24[3] = local_24[3] & 0xffffff;
      iVar6 = FUN_1006a777(local_34,*(undefined4 *)(iVar11 + 0xc),1);
      if (iVar6 < 0) {
        return iVar6;
      }
      in_ECX[0x7c] = in_ECX[0x7c] + 1;
      if ((((*(byte *)(in_ECX + 0x33) & 1) != 0) && (iVar6 = *(int *)(iVar11 + 0x60), iVar6 != 0))
         && ((*(int *)(iVar6 + 4) == 6 && (iVar6 = *(int *)(iVar6 + 0x14), *(int *)(iVar6 + 4) == 3)
             ))) {
        pcVar7 = *(char **)(iVar6 + 0x18);
        pcVar1 = pcVar7 + 1;
        do {
          cVar2 = *pcVar7;
          pcVar7 = pcVar7 + 1;
        } while (cVar2 != '\0');
        param_1 = operator_new((uint)(pcVar7 + (3 - (int)pcVar1)));
        if (param_1 == (char *)0x0) {
          return -0x7ff8fff2;
        }
        _sprintf(param_1,"n_%s",*(undefined4 *)(iVar6 + 0x18));
        iVar6 = FUN_1006a777(param_1,*(undefined4 *)(iVar11 + 0xc),1);
        _free(param_1);
        if (iVar6 < 0) {
          return iVar6;
        }
        in_ECX[0x7c] = in_ECX[0x7c] + 1;
      }
    }
    if (param_2 != (uint *)0x0) {
      *param_2 = *(uint *)(iVar11 + 0x6c);
    }
  }
  return 0;
}


