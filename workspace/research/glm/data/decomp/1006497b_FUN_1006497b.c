// 1006497b size=793 FUN_1006497b

int FUN_1006497b(void)

{
  double dVar1;
  int iVar2;
  double *pdVar3;
  int in_ECX;
  char *pcVar4;
  int *piVar5;
  char *pcVar6;
  undefined4 *puVar7;
  bool bVar8;
  double local_38 [4];
  undefined4 local_14;
  undefined4 local_10;
  int local_c;
  undefined4 *local_8;
  
  iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
  if (iVar2 < 0) goto LAB_10064c89;
  if (*(int *)(in_ECX + 0x278) == 1) {
    iVar2 = 2;
    bVar8 = true;
    pcVar4 = (char *)(in_ECX + 0x280);
    pcVar6 = "(";
    do {
      if (iVar2 == 0) break;
      iVar2 = iVar2 + -1;
      bVar8 = *pcVar4 == *pcVar6;
      pcVar4 = pcVar4 + 1;
      pcVar6 = pcVar6 + 1;
    } while (bVar8);
    if (!bVar8) goto LAB_10064c6b;
    iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
    if (iVar2 < 0) goto LAB_10064c89;
    if (*(int *)(in_ECX + 0x278) != 9) goto LAB_10064c6b;
    local_10 = *(undefined4 *)(in_ECX + 0x280);
    iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
    if (iVar2 < 0) goto LAB_10064c89;
    if (*(int *)(in_ECX + 0x278) != 1) goto LAB_10064c6b;
    iVar2 = 2;
    bVar8 = true;
    pcVar4 = (char *)(in_ECX + 0x280);
    pcVar6 = ",";
    do {
      if (iVar2 == 0) break;
      iVar2 = iVar2 + -1;
      bVar8 = *pcVar4 == *pcVar6;
      pcVar4 = pcVar4 + 1;
      pcVar6 = pcVar6 + 1;
    } while (bVar8);
    if (!bVar8) goto LAB_10064c6b;
    iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
    if (iVar2 < 0) goto LAB_10064c89;
    if (*(int *)(in_ECX + 0x278) != 9) goto LAB_10064c6b;
    local_14 = *(undefined4 *)(in_ECX + 0x280);
    local_8 = (undefined4 *)0x0;
    do {
      local_c = 0;
      iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
      if (iVar2 < 0) goto LAB_10064c89;
      if (*(int *)(in_ECX + 0x278) != 1) goto LAB_10064c6b;
      iVar2 = 2;
      bVar8 = true;
      pcVar4 = (char *)(in_ECX + 0x280);
      pcVar6 = ",";
      do {
        if (iVar2 == 0) break;
        iVar2 = iVar2 + -1;
        bVar8 = *pcVar4 == *pcVar6;
        pcVar4 = pcVar4 + 1;
        pcVar6 = pcVar6 + 1;
      } while (bVar8);
      if (!bVar8) goto LAB_10064c6b;
      iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
      if (iVar2 < 0) goto LAB_10064c89;
      if (*(int *)(in_ECX + 0x278) == 1) {
        iVar2 = 2;
        bVar8 = true;
        pcVar4 = (char *)(in_ECX + 0x280);
        pcVar6 = "-";
        do {
          if (iVar2 == 0) break;
          iVar2 = iVar2 + -1;
          bVar8 = *pcVar4 == *pcVar6;
          pcVar4 = pcVar4 + 1;
          pcVar6 = pcVar6 + 1;
        } while (bVar8);
        if (bVar8) {
          local_c = 1;
          iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),in_ECX + 0x278);
          if (iVar2 < 0) goto LAB_10064c89;
        }
      }
      iVar2 = *(int *)(in_ECX + 0x278);
      if (iVar2 == 2) {
LAB_10064b53:
        dVar1 = (double)*(int *)(in_ECX + 0x280);
        pdVar3 = local_38 + (int)local_8;
        if (*(int *)(in_ECX + 0x280) < 0) {
          dVar1 = dVar1 + 4294967296.0;
        }
      }
      else if (iVar2 == 3) {
        dVar1 = (double)*(int *)(in_ECX + 0x280);
        pdVar3 = local_38 + (int)local_8;
      }
      else {
        if (iVar2 == 4) goto LAB_10064b53;
        if ((iVar2 < 5) || (8 < iVar2)) goto LAB_10064c6b;
        dVar1 = *(double *)(in_ECX + 0x280);
        pdVar3 = local_38 + (int)local_8;
      }
      bVar8 = local_c != 0;
      *pdVar3 = dVar1;
      if (bVar8) {
        *pdVar3 = -*pdVar3;
      }
      local_8 = (undefined4 *)((int)local_8 + 1);
    } while (local_8 < 4);
    iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
    if (iVar2 < 0) goto LAB_10064c89;
    if (*(int *)(in_ECX + 0x278) != 1) goto LAB_10064c6b;
    iVar2 = 2;
    bVar8 = true;
    pcVar4 = (char *)(in_ECX + 0x280);
    pcVar6 = ")";
    do {
      if (iVar2 == 0) break;
      iVar2 = iVar2 + -1;
      bVar8 = *pcVar4 == *pcVar6;
      pcVar4 = pcVar4 + 1;
      pcVar6 = pcVar6 + 1;
    } while (bVar8);
    if (!bVar8) goto LAB_10064c6b;
    iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
    if (iVar2 < 0) goto LAB_10064c89;
    iVar2 = *(int *)(in_ECX + 0x278);
    if ((iVar2 != 0xc) && (iVar2 != 0xd)) goto LAB_10064c6b;
    local_8 = operator_new(0x30);
    if (local_8 == (undefined4 *)0x0) {
      local_8 = (undefined4 *)0x0;
    }
    else {
      local_8[10] = 0;
    }
    if (local_8 == (undefined4 *)0x0) {
      iVar2 = -0x7ff8fff2;
      goto LAB_10064c89;
    }
    *local_8 = local_10;
    local_8[1] = local_14;
    pdVar3 = local_38;
    puVar7 = local_8 + 2;
    for (iVar2 = 8; iVar2 != 0; iVar2 = iVar2 + -1) {
      *puVar7 = *(undefined4 *)pdVar3;
      pdVar3 = (double *)((int)pdVar3 + 4);
      puVar7 = puVar7 + 1;
    }
    piVar5 = (int *)(in_ECX + 0x3c);
    iVar2 = *piVar5;
    while ((iVar2 != 0 && (iVar2 = __stricmp(*(char **)(iVar2 + 4),(char *)local_8[1]), iVar2 < 0)))
    {
      piVar5 = (int *)(*piVar5 + 0x28);
      iVar2 = *piVar5;
    }
    local_8[10] = *piVar5;
    *piVar5 = (int)local_8;
  }
  else {
LAB_10064c6b:
    if ((*(int *)(in_ECX + 0x278) != 0xc) && (*(int *)(in_ECX + 0x278) != 0xd)) {
      FUN_10067789();
    }
  }
  iVar2 = 0;
LAB_10064c89:
  *(undefined4 *)(in_ECX + 0x40) = 1;
  return iVar2;
}


