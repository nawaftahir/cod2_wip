// 100aff11 size=1139 FUN_100aff11

uint FUN_100aff11(ushort *param_1,int param_2)

{
  int *piVar1;
  ushort *puVar2;
  char cVar3;
  int iVar4;
  char *pcVar5;
  uint uVar6;
  bool bVar7;
  undefined4 uVar8;
  char *pcVar9;
  char *pcVar10;
  char local_38 [31];
  undefined1 local_19;
  int local_18;
  char *local_14;
  char *local_10;
  int local_c;
  uint local_8;
  
  puVar2 = param_1;
  local_10 = *(char **)(*(int *)(param_1 + 0x34) + 0x18);
  uVar6 = 0;
  local_18 = 0;
  local_8 = 0;
  _strncpy(local_38,local_10,0x1f);
  local_19 = 0;
  pcVar5 = local_38;
  if (local_38[0] == '\0') {
LAB_100aff74:
    param_1 = (ushort *)0x0;
  }
  else {
    do {
      iVar4 = _isalpha((int)*pcVar5);
      if (iVar4 == 0) break;
      pcVar5 = pcVar5 + 1;
    } while (*pcVar5 != '\0');
    if (*pcVar5 == '\0') goto LAB_100aff74;
    param_1 = (ushort *)_atol(pcVar5);
  }
  if (*pcVar5 != '\0') {
    *pcVar5 = '\0';
    pcVar5 = pcVar5 + 1;
  }
  cVar3 = *pcVar5;
  if (cVar3 == '\0') {
LAB_100affa7:
    param_1 = (ushort *)((int)param_1 + (*(uint *)(puVar2 + 0x38) >> 2));
  }
  else {
    do {
      iVar4 = _isdigit((int)cVar3);
      if (iVar4 == 0) break;
      pcVar5 = pcVar5 + 1;
      cVar3 = *pcVar5;
    } while (cVar3 != '\0');
    if (*pcVar5 == '\0') goto LAB_100affa7;
    param_1 = (ushort *)0xffffffff;
  }
  if (*(uint *)(puVar2 + 0x36) == 0xffffffff) {
    iVar4 = *(int *)(*(int *)(local_c + 0x10) + *(int *)(puVar2 + 2) * 4);
    local_14 = (char *)FUN_100862e1(puVar2);
    uVar6 = *(uint *)(iVar4 + 4);
    if (((uVar6 & 0x10) != 0) && ((uVar6 & 0x200) == 0)) {
      iVar4 = __stricmp(local_38,"color");
      if (iVar4 == 0) {
        local_8 = 1;
        if (param_2 == 0) {
          pcVar5 = *(char **)(local_c + 0x28);
        }
        else {
          pcVar5 = (char *)0x2;
        }
LAB_100b005d:
        bVar7 = param_1 < pcVar5;
LAB_100b00d6:
        uVar6 = 1 - bVar7;
      }
      else {
        iVar4 = __stricmp(local_38,"texcoord");
        if (iVar4 == 0) {
          local_8 = 3;
          if (param_2 == 0) {
            pcVar5 = *(char **)(local_c + 0x3c);
          }
          else {
            pcVar5 = (char *)0x8;
          }
          goto LAB_100b005d;
        }
        iVar4 = __stricmp(local_38,"position");
        if (((iVar4 == 0) || (iVar4 = __stricmp(local_38,"fog"), iVar4 == 0)) ||
           (iVar4 = __stricmp(local_38,"psize"), iVar4 == 0)) {
          bVar7 = param_1 == (ushort *)0x0;
          local_8 = 4;
          goto LAB_100b00d6;
        }
        iVar4 = __stricmp(local_38,"diffuse");
        if (iVar4 == 0) {
          local_8 = 1;
          uVar6 = (uint)(param_1 != (ushort *)0x0);
          local_18 = 1;
          if (uVar6 == 0) {
            param_1 = (ushort *)0x0;
          }
        }
        else {
          iVar4 = __stricmp(local_38,"specular");
          if (iVar4 == 0) {
            local_8 = 1;
            uVar6 = (uint)(param_1 != (ushort *)0x0);
            local_18 = 1;
            if (uVar6 == 0) {
              param_1 = (ushort *)0x1;
            }
          }
          else {
            local_8 = 0;
            uVar6 = 1;
          }
        }
      }
      if ((param_2 == 0) || (*(int *)(puVar2 + 8) == 0)) {
        if (uVar6 == 0) {
          if (local_18 != 0) {
            FUN_1008b13a(local_c,*(undefined4 *)(puVar2 + 0x34),0x1261,
                         "%s semantic \'%s\' has been deprecated; use \'%s%d\' instead",local_14,
                         local_10,*(undefined4 *)(local_8 * 4 + 0x101a3f88),param_1);
          }
        }
        else {
          FUN_1008b0b5(local_c,*(undefined4 *)(puVar2 + 0x34),0x1196,"invalid %s semantic \'%s\'",
                       local_14,local_10);
        }
      }
      if (((local_8 == 4) || (uVar6 != 0)) && ((*(int *)(local_c + 0x448) == 0 && (param_2 == 0))))
      {
        *(int *)(local_c + 0x448) = 1;
        FUN_1008b0b5(local_c,*(undefined4 *)(puVar2 + 0x34),0x1196,
                     "invalid reference to %s semantic \'%s\'",local_14,local_10);
        uVar6 = 1;
      }
      goto LAB_100b028a;
    }
    if ((uVar6 & 0x20) != 0) {
      iVar4 = __stricmp(local_38,"color");
      if (iVar4 == 0) {
        local_8 = 1;
        uVar6 = (uint)(*(char **)(local_c + 0x48) <= param_1);
LAB_100b0236:
        if (uVar6 != 0) goto LAB_100b023a;
      }
      else {
        iVar4 = __stricmp(local_38,"depth");
        if (iVar4 != 0) {
          local_8 = 0;
          uVar6 = 1;
          goto LAB_100b0236;
        }
        local_8 = 4;
        uVar6 = 1;
LAB_100b023a:
        if ((param_2 == 0) || (*(int *)(puVar2 + 8) == 0)) {
          FUN_1008b0b5(local_c,*(undefined4 *)(puVar2 + 0x34),0x1196,"invalid %s semantic \'%s\'",
                       local_14,local_10);
        }
      }
      if (local_8 == 4) {
        if (param_2 != 0) goto LAB_100b0354;
        pcVar9 = "%s semantic \'%s\' not yet implemented in ps_1_x";
        uVar8 = *(undefined4 *)(puVar2 + 0x34);
        pcVar5 = local_14;
        pcVar10 = local_10;
        goto LAB_100b0282;
      }
      goto LAB_100b028a;
    }
  }
  else {
    param_1 = (ushort *)(uint)*(byte *)((int)puVar2 + 0x6d);
    local_8 = *(uint *)(puVar2 + 0x36) & 0xff;
    if (local_8 == 4) {
      if ((*(int *)(local_c + 0x448) != 0) || (param_2 != 0)) goto LAB_100b0354;
      uVar6 = 1;
      *(int *)(local_c + 0x448) = 1;
      pcVar9 = "invalid reference to input semantic \'%s%d\'";
      uVar8 = *(undefined4 *)(puVar2 + 0x34);
      pcVar5 = local_38;
      pcVar10 = (char *)param_1;
LAB_100b0282:
      FUN_1008b0b5(local_c,uVar8,0x1196,pcVar9,pcVar5,pcVar10);
    }
LAB_100b028a:
    if (local_8 == 3) {
      if ((((param_1 != (ushort *)0x0) && (param_1 < (char *)0x4)) && (*(int *)(puVar2 + 8) == 3))
         && ((*(uint *)(local_c + 200) & 0xffff) < 0x104)) {
        piVar1 = (int *)(local_c + 0x43c);
        if (*piVar1 == -1) {
          iVar4 = FUN_100860e0(&DAT_10117794,0x51,0xffffffff,4);
          *piVar1 = iVar4;
        }
        iVar4 = *piVar1;
        if (iVar4 == -1) {
          return 0x8007000e;
        }
        puVar2[6] = 0;
        puVar2[7] = 0;
        local_8 = 5;
        *(int *)(puVar2 + 2) = iVar4;
        *(char **)(puVar2 + 8) = (char *)((int)param_1 + -1);
        goto LAB_100b0354;
      }
      if (((param_1 < *(char **)(local_c + 0x3c)) || (param_2 != 0)) ||
         (*(int *)(local_c + 0x448) != 0)) goto LAB_100b0354;
      uVar6 = 1;
      *(int *)(local_c + 0x448) = 1;
      FUN_1008b0b5(local_c,*(undefined4 *)(puVar2 + 0x34),0x1196,
                   "\'texcoord\' reference exceeds valid range for this shader model (max: %i)",
                   *(char **)(local_c + 0x3c));
    }
    if (local_8 == 1) {
      *puVar2 = *puVar2 | 0x114;
      puVar2[0x10] = 0;
      puVar2[0x11] = 0;
      puVar2[0x12] = 0;
      puVar2[0x13] = 0;
      puVar2[0x14] = 0;
      puVar2[0x15] = 0;
      puVar2[0x16] = 0;
      puVar2[0x17] = 0x3ff0;
    }
    if (local_8 != 0) goto LAB_100b0354;
  }
  uVar6 = 1;
LAB_100b0354:
  if ((char *)0xffff < param_1) {
    uVar6 = 1;
  }
  *(uint *)(puVar2 + 0x36) = local_8 & 0xff | (int)param_1 << 8;
  return -(uint)(uVar6 != 0) & 0x80004005;
}


