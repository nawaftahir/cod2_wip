// 10064454 size=319 FUN_10064454

int FUN_10064454(void)

{
  int *piVar1;
  int iVar2;
  int in_ECX;
  int iVar3;
  char *pcVar4;
  char *pcVar5;
  bool bVar6;
  char *local_8;
  
  iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
  if (iVar2 < 0) goto LAB_10064588;
  iVar2 = *(int *)(in_ECX + 0x278);
  if (iVar2 == 1) {
    iVar3 = 2;
    bVar6 = true;
    pcVar4 = (char *)(in_ECX + 0x280);
    pcVar5 = "(";
    do {
      if (iVar3 == 0) break;
      iVar3 = iVar3 + -1;
      bVar6 = *pcVar4 == *pcVar5;
      pcVar4 = pcVar4 + 1;
      pcVar5 = pcVar5 + 1;
    } while (bVar6);
    if (!bVar6) goto LAB_10064570;
    piVar1 = (int *)(in_ECX + 0x278);
    iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),piVar1);
    if (iVar2 < 0) goto LAB_10064588;
    if (*piVar1 == 9) {
      local_8 = *(char **)(in_ECX + 0x280);
      iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),piVar1);
      if (iVar2 < 0) goto LAB_10064588;
    }
    else {
      local_8 = (char *)0x0;
    }
    iVar2 = *piVar1;
    if (iVar2 != 1) goto LAB_10064570;
    iVar3 = 2;
    bVar6 = true;
    pcVar4 = (char *)(in_ECX + 0x280);
    pcVar5 = ")";
    do {
      if (iVar3 == 0) break;
      iVar3 = iVar3 + -1;
      bVar6 = *pcVar4 == *pcVar5;
      pcVar4 = pcVar4 + 1;
      pcVar5 = pcVar5 + 1;
    } while (bVar6);
    if (!bVar6) goto LAB_10064570;
    iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
    if (iVar2 < 0) goto LAB_10064588;
    iVar2 = *(int *)(in_ECX + 0x278);
    if ((iVar2 != 0xc) && (iVar2 != 0xd)) goto LAB_10064570;
    if (local_8 == (char *)0x0) {
      *(undefined4 *)(in_ECX + 0x38) = 0;
    }
    else {
      iVar3 = 10;
      bVar6 = true;
      pcVar4 = local_8;
      pcVar5 = "row_major";
      do {
        if (iVar3 == 0) break;
        iVar3 = iVar3 + -1;
        bVar6 = *pcVar4 == *pcVar5;
        pcVar4 = pcVar4 + 1;
        pcVar5 = pcVar5 + 1;
      } while (bVar6);
      if (bVar6) {
        *(undefined4 *)(in_ECX + 0x38) = 0x400;
      }
      else {
        iVar3 = 0xd;
        bVar6 = true;
        pcVar4 = "column_major";
        do {
          if (iVar3 == 0) break;
          iVar3 = iVar3 + -1;
          bVar6 = *local_8 == *pcVar4;
          local_8 = local_8 + 1;
          pcVar4 = pcVar4 + 1;
        } while (bVar6);
        if (!bVar6) goto LAB_10064570;
        *(undefined4 *)(in_ECX + 0x38) = 0x800;
      }
    }
  }
  else {
LAB_10064570:
    if ((iVar2 != 0xc) && (iVar2 != 0xd)) {
      FUN_10067789();
    }
  }
  iVar2 = 0;
LAB_10064588:
  *(undefined4 *)(in_ECX + 0x40) = 1;
  return iVar2;
}


