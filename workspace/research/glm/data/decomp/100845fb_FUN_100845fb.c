// 100845fb size=843 FUN_100845fb

int FUN_100845fb(undefined4 param_1,char *param_2,short *param_3,undefined2 param_4,uint param_5)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int *in_ECX;
  int iVar4;
  char *pcVar5;
  char *pcVar6;
  undefined4 local_60 [2];
  short *local_58;
  undefined4 local_50;
  undefined4 local_4c;
  undefined2 local_40;
  undefined2 local_3e;
  undefined2 local_3c;
  undefined2 local_3a;
  undefined2 local_38;
  undefined2 local_36;
  undefined4 local_34;
  undefined1 local_30 [4];
  uint local_2c;
  undefined4 local_24;
  int *local_20;
  short *local_1c;
  char *local_18;
  char *local_14;
  int local_10;
  undefined4 local_c;
  int local_8;
  
  iVar1 = (int)param_2;
  param_5 = param_5 | 0x80000000;
  local_8 = 0;
  if ((((*param_3 == 0x5f63) || (*param_3 == 0x5f62)) || (*param_3 == 0x5f69)) ||
     (*param_3 == 0x5f73)) {
    local_58 = param_3 + 1;
    local_60[0] = 10;
    local_50 = 0;
    local_4c = 0;
    local_20 = in_ECX;
    local_1c = local_58;
    FUN_1009e0fb(1,local_60,0,0,in_ECX[1],2,&local_8,0);
    iVar2 = FUN_10084323(*(undefined4 *)(local_8 + 0x20),&local_c,&local_24);
    if (iVar2 < 0) {
      return iVar2;
    }
    if (*(int *)(local_8 + 0x30) == 0) {
LAB_10084854:
      if ((*(byte *)(local_8 + 0x1c) & 2) != 0) {
        *(byte *)(iVar1 + 10) = *(byte *)(iVar1 + 10) | 1;
      }
      iVar2 = *(int *)(local_8 + 0x28);
      if (iVar2 == 0) {
        if (*(int *)(local_8 + 0x24) != 0) {
          iVar2 = *(int *)(local_8 + 0x24);
          goto LAB_100848c7;
        }
        if ((*(byte *)(iVar1 + 10) & 1) != 0) {
          iVar2 = FUN_100845a4(param_1,local_c,iVar1 + 0x10);
          goto LAB_10084882;
        }
      }
      else {
LAB_100848c7:
        iVar2 = FUN_100844e1(param_1,local_c,local_24,iVar2,iVar1 + 0x10);
LAB_10084882:
        if (iVar2 < 0) {
          return iVar2;
        }
      }
      if ((*(int *)(*(int *)(local_8 + 0x20) + 4) != 9) ||
         (*(int *)(*(int *)(local_8 + 0x20) + 0x14) != 0x14)) {
        iVar2 = FUN_100c3e06(param_1,*(undefined4 *)(local_8 + 0x20),1,0,iVar1 + 0xc);
        if (iVar2 < 0) {
          return iVar2;
        }
        goto LAB_100848f2;
      }
      FUN_10067c3e(*(int *)(*local_20 + 4) + 0x18,0,0xb59,
                   "Sampler variable \'%s\' does not specify the sampler type.  Explicit sampler types required for asm fragments."
                   ,local_1c);
    }
    else {
      local_10 = *(int *)(local_8 + 0x30);
      param_2 = (char *)0x0;
      local_14 = (char *)0x0;
      local_18 = (char *)0x0;
      if (local_10 == 0) {
LAB_100847b2:
        param_2 = local_14;
        if ((local_14 == (char *)0x0) && (param_2 = local_18, local_18 == (char *)0x0))
        goto LAB_10084854;
      }
      else {
        do {
          iVar2 = *(int *)(local_10 + 8);
          pcVar6 = param_2;
          if (*(int *)(iVar2 + 4) == 0x11) {
            if (*(int *)(iVar2 + 0x10) == 0) {
              iVar4 = 0;
            }
            else {
              iVar4 = *(int *)(*(int *)(iVar2 + 0x10) + 0x18);
            }
            if (*(int *)(iVar2 + 0x14) == 0) {
              pcVar5 = (char *)0x0;
            }
            else {
              pcVar5 = *(char **)(*(int *)(iVar2 + 0x14) + 0x18);
            }
            if (iVar4 == 0) {
              if ((pcVar5 != (char *)0x0) &&
                 (iVar2 = _tolower((int)*pcVar5), iVar2 == (char)*param_3)) {
                local_18 = pcVar5;
              }
            }
            else {
              iVar2 = FUN_10063776(iVar4,0,local_30);
              if (((-1 < iVar2) && (pcVar5 != (char *)0x0)) &&
                 ((iVar2 = _tolower((int)*pcVar5), iVar2 == (char)*param_3 &&
                  (((pcVar6 = pcVar5, param_5 != local_2c &&
                    (pcVar6 = param_2, ((local_2c ^ param_5) & 0xffff0000) == 0)) &&
                   ((short)local_2c == 0)))))) {
                local_14 = pcVar5;
              }
            }
          }
          param_2 = pcVar6;
          local_10 = *(int *)(local_10 + 0xc);
        } while (local_10 != 0);
        local_10 = 0;
        if (param_2 == (char *)0x0) goto LAB_100847b2;
      }
      iVar2 = _tolower((int)*param_2);
      if ((char)*param_3 != iVar2) goto LAB_10084854;
      iVar2 = _isdigit((int)param_2[1]);
      if (iVar2 == 0) goto LAB_10084854;
      pcVar6 = param_2 + 2;
      while (iVar2 = _isdigit((int)*pcVar6), iVar2 != 0) {
        pcVar6 = pcVar6 + 1;
      }
      if (*pcVar6 != '\0') goto LAB_10084854;
      uVar3 = _atol(param_2 + 1);
      if (uVar3 < 0x2000) {
        *(ushort *)(iVar1 + 10) = *(ushort *)(iVar1 + 10) | (ushort)(uVar3 << 2) | 2;
        goto LAB_10084854;
      }
      FUN_10067c3e(*(int *)(*local_20 + 4) + 0x18,0,0xb56,
                   "Constant variable \'%s\' bound to register greater than 8191 (%d requested)",
                   local_1c,uVar3);
    }
    iVar2 = -0x7fffbffb;
  }
  else {
    local_40 = 1;
    local_3e = 3;
    local_3c = 1;
    local_3a = 4;
    local_38 = 1;
    local_36 = 0;
    local_34 = 0;
    iVar2 = FUN_100840db(&local_40,0x10,6,(int)param_2 + 0xc);
    if (iVar2 < 0) {
      return iVar2;
    }
    local_c = 1;
LAB_100848f2:
    iVar2 = FUN_100840db(param_3,0xffffffff,7,iVar1);
    if (-1 < iVar2) {
      if (*param_3 == 0x5f62) {
        *(undefined2 *)(iVar1 + 4) = 0;
      }
      else {
        *(ushort *)(iVar1 + 4) = (*param_3 != 0x5f69) + 1;
      }
      *(undefined2 *)(iVar1 + 6) = param_4;
      *(undefined2 *)(iVar1 + 8) = (undefined2)local_c;
    }
  }
  return iVar2;
}


