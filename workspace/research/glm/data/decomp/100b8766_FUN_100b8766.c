// 100b8766 size=465 FUN_100b8766

uint FUN_100b8766(int param_1)

{
  uint uVar1;
  char cVar2;
  int *piVar3;
  int iVar4;
  int in_ECX;
  char *pcVar5;
  long lVar6;
  uint uVar7;
  bool bVar8;
  bool bVar9;
  char local_2c [31];
  undefined1 local_d;
  int local_c;
  uint local_8;
  
  lVar6 = 0;
  local_8 = 0;
  if ((*(uint *)(in_ECX + 200) & 0xffff0000) == 0x46580000) {
    if (*(int *)(param_1 + 0x6c) == -1) {
      piVar3 = (int *)(in_ECX + 0x1f8);
      *(int *)(param_1 + 0x6c) = *piVar3;
      *piVar3 = *piVar3 + 1;
    }
    return 0;
  }
  if (*(int *)(param_1 + 0x6c) != -1) {
    return 0;
  }
  local_c = in_ECX;
  _strncpy(local_2c,*(char **)(*(int *)(param_1 + 0x68) + 0x18),0x20);
  local_d = 0;
  pcVar5 = local_2c;
  if (local_2c[0] == '\0') {
LAB_100b87fe:
    if (*pcVar5 != '\0') {
      *pcVar5 = '\0';
      pcVar5 = pcVar5 + 1;
    }
  }
  else {
    do {
      iVar4 = _isalpha((int)*pcVar5);
      if (iVar4 == 0) break;
      pcVar5 = pcVar5 + 1;
    } while (*pcVar5 != '\0');
    if (*pcVar5 != '\0') {
      lVar6 = _atol(pcVar5);
      goto LAB_100b87fe;
    }
  }
  cVar2 = *pcVar5;
  if (cVar2 == '\0') {
LAB_100b882c:
    uVar7 = lVar6 + (*(uint *)(param_1 + 0x70) >> 2);
  }
  else {
    do {
      iVar4 = _isdigit((int)cVar2);
      if (iVar4 == 0) break;
      pcVar5 = pcVar5 + 1;
      cVar2 = *pcVar5;
    } while (cVar2 != '\0');
    if (*pcVar5 == '\0') goto LAB_100b882c;
    uVar7 = 0xffffffff;
  }
  uVar1 = *(uint *)(*(int *)(*(int *)(local_c + 0x10) + *(int *)(param_1 + 4) * 4) + 4);
  if (((uVar1 & 0x10) == 0) || ((uVar1 & 0x200) != 0)) {
    if ((uVar1 & 0x20) != 0) {
      iVar4 = __stricmp(local_2c,"color");
      bVar9 = iVar4 != 0;
      bVar8 = bVar9 || uVar7 != 0;
      local_8 = (uint)!bVar9;
      if ((bVar9 || uVar7 != 0) && (*(int *)(param_1 + 0x10) == 0)) {
        pcVar5 = "invalid reference to output semantic \'%s%d\'";
        goto LAB_100b88e7;
      }
      goto LAB_100b88fa;
    }
  }
  else {
    iVar4 = __stricmp(local_2c,"position");
    if (iVar4 == 0) {
      local_8 = 2;
LAB_100b8867:
      bVar8 = uVar7 != 0;
    }
    else {
      iVar4 = __stricmp(local_2c,"psize");
      if (iVar4 == 0) {
        local_8 = 3;
        goto LAB_100b8867;
      }
      local_8 = 0;
      bVar8 = true;
    }
    if ((bVar8) && (*(int *)(param_1 + 0x10) == 0)) {
      pcVar5 = "invalid reference to input semantic \'%s%d\'";
LAB_100b88e7:
      FUN_1008b0b5(local_c,*(undefined4 *)(param_1 + 0x68),0x1196,pcVar5,local_2c,uVar7);
    }
LAB_100b88fa:
    if (local_8 != 0) goto LAB_100b8907;
  }
  bVar8 = true;
LAB_100b8907:
  if (0xffff < uVar7) {
    bVar8 = true;
  }
  *(uint *)(param_1 + 0x6c) = (uVar7 | 0xffffff00) << 8 | local_8 & 0xff;
  return -(uint)bVar8 & 0x80004005;
}


