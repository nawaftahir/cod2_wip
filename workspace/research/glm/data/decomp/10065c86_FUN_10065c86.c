// 10065c86 size=1173 FUN_10065c86

int FUN_10065c86(void)

{
  char cVar1;
  char cVar2;
  int *piVar3;
  int in_ECX;
  int iVar4;
  int iVar5;
  char *pcVar6;
  char *pcVar7;
  undefined4 *puVar8;
  char *pcVar9;
  undefined4 *puVar10;
  bool bVar11;
  undefined4 local_2c [8];
  int local_c;
  undefined4 local_8;
  
  if ((*(int *)(in_ECX + 0x40) != 0) || (*(int *)(in_ECX + 0x48) != 0)) {
    *(undefined4 *)(in_ECX + 0x278) = 0xc;
    return -1;
  }
  iVar5 = *(int *)(in_ECX + 100);
  if (iVar5 == 0) {
    iVar5 = FUN_100686c0(*(uint *)(in_ECX + 0x298) | 4,in_ECX + 0x278);
    if (iVar5 < 0) {
      return -1;
    }
  }
  else {
    puVar8 = (undefined4 *)(iVar5 + 0x10);
    puVar10 = (undefined4 *)(in_ECX + 0x278);
    for (iVar4 = 8; iVar4 != 0; iVar4 = iVar4 + -1) {
      *puVar10 = *puVar8;
      puVar8 = puVar8 + 1;
      puVar10 = puVar10 + 1;
    }
    *(undefined4 *)(in_ECX + 100) = *(undefined4 *)(iVar5 + 0xc);
    *(undefined4 *)(iVar5 + 0xc) = 0;
  }
  iVar5 = *(int *)(in_ECX + 0x278);
  if (iVar5 == 1) {
    cVar1 = *(char *)(in_ECX + 0x281);
    if (cVar1 == '\0') {
      return (int)*(char *)(in_ECX + 0x280);
    }
    if (*(char *)(in_ECX + 0x282) == '\0') {
      if (cVar1 == '=') {
        cVar1 = *(char *)(in_ECX + 0x280);
        if (cVar1 == '!') {
          return 0x113;
        }
        if (cVar1 == '<') {
          return 0x110;
        }
        if (cVar1 == '=') {
          return 0x112;
        }
        if (cVar1 == '>') {
          return 0x111;
        }
      }
      else {
        cVar2 = *(char *)(in_ECX + 0x280);
        if (cVar2 == cVar1) {
          if (cVar2 == '&') {
            return 0x114;
          }
          if (cVar2 == '|') {
            return 0x115;
          }
        }
      }
    }
    return 0x119;
  }
  if (iVar5 < 2) {
    return 0x119;
  }
  if (iVar5 < 5) {
    return 0x117;
  }
  if (iVar5 != 9) {
    if (iVar5 == 10) {
      return 0x118;
    }
    if ((iVar5 != 0xc) && (iVar5 != 0xd)) {
      return 0x119;
    }
    *(undefined4 *)(in_ECX + 0x40) = 1;
    return -1;
  }
  if (*(int *)(in_ECX + 0x4c) == 0) {
    iVar5 = 8;
    bVar11 = true;
    pcVar7 = *(char **)(in_ECX + 0x280);
    pcVar6 = "defined";
    do {
      if (iVar5 == 0) break;
      iVar5 = iVar5 + -1;
      bVar11 = *pcVar7 == *pcVar6;
      pcVar7 = pcVar7 + 1;
      pcVar6 = pcVar6 + 1;
    } while (bVar11);
    if (bVar11) {
      *(undefined4 *)(in_ECX + 0x58) = 0;
      return 0x10f;
    }
    if (*(int *)(in_ECX + 0x58) == 0) {
      return 0x116;
    }
    iVar5 = FUN_10064fd0(*(char **)(in_ECX + 0x280),&local_c,&local_8);
    if (iVar5 == 0) {
      return 0x116;
    }
    iVar5 = *(int *)(in_ECX + 0x44);
    puVar8 = (undefined4 *)(in_ECX + 0x278);
    puVar10 = local_2c;
    for (iVar4 = 8; iVar4 != 0; iVar4 = iVar4 + -1) {
      *puVar10 = *puVar8;
      puVar8 = puVar8 + 1;
      puVar10 = puVar10 + 1;
    }
    if ((iVar5 == 0) && (iVar5 = FUN_1006541e(local_2c,local_c,local_8), iVar5 != 0)) {
      iVar5 = 0;
    }
    else {
      iVar5 = 1;
    }
    *(int *)(in_ECX + 0x44) = iVar5;
    if ((iVar5 == 0) && (local_c = FUN_10065c86(), local_c != -1)) {
      iVar5 = 0;
    }
    else {
      iVar5 = 1;
    }
    *(int *)(in_ECX + 0x44) = iVar5;
    if (iVar5 != 0) {
      *(undefined4 *)(in_ECX + 0x48) = 1;
      puVar8 = local_2c;
      puVar10 = (undefined4 *)(in_ECX + 0x278);
      for (iVar5 = 8; iVar5 != 0; iVar5 = iVar5 + -1) {
        *puVar10 = *puVar8;
        puVar8 = puVar8 + 1;
        puVar10 = puVar10 + 1;
      }
      FUN_10067c3e(in_ECX + 0x18,(undefined4 *)(in_ECX + 0x278),0x5ee,
                   "invalid or unsupported integer constant expression");
      return 0x116;
    }
    return local_c;
  }
  *(undefined4 *)(in_ECX + 0x4c) = 0;
  *(undefined4 *)(in_ECX + 0x58) = 0;
  pcVar7 = *(char **)(in_ECX + 0x280);
  if (*(int *)(in_ECX + 0x50) == 0) {
    if (*pcVar7 != 'e') {
      if (*pcVar7 == 'i') {
        iVar5 = 3;
        bVar11 = true;
        pcVar6 = pcVar7;
        pcVar9 = "if";
        do {
          if (iVar5 == 0) break;
          iVar5 = iVar5 + -1;
          bVar11 = *pcVar6 == *pcVar9;
          pcVar6 = pcVar6 + 1;
          pcVar9 = pcVar9 + 1;
        } while (bVar11);
        if (bVar11) {
          return 0x10c;
        }
        iVar5 = 6;
        bVar11 = true;
        pcVar6 = pcVar7;
        pcVar9 = "ifdef";
        do {
          if (iVar5 == 0) break;
          iVar5 = iVar5 + -1;
          bVar11 = *pcVar6 == *pcVar9;
          pcVar6 = pcVar6 + 1;
          pcVar9 = pcVar9 + 1;
        } while (bVar11);
        if (bVar11) {
          return 0x10c;
        }
        iVar5 = 7;
        bVar11 = true;
        pcVar6 = "ifndef";
        do {
          if (iVar5 == 0) break;
          iVar5 = iVar5 + -1;
          bVar11 = *pcVar7 == *pcVar6;
          pcVar7 = pcVar7 + 1;
          pcVar6 = pcVar6 + 1;
        } while (bVar11);
        if (bVar11) {
          return 0x10c;
        }
      }
LAB_10065f9f:
      *(undefined4 *)(in_ECX + 0x4c) = 1;
      return 0x116;
    }
    iVar5 = 5;
    bVar11 = true;
    pcVar6 = pcVar7;
    pcVar9 = "else";
    do {
      if (iVar5 == 0) break;
      iVar5 = iVar5 + -1;
      bVar11 = *pcVar6 == *pcVar9;
      pcVar6 = pcVar6 + 1;
      pcVar9 = pcVar9 + 1;
    } while (bVar11);
    if (bVar11) {
      return 0x10a;
    }
    iVar5 = 6;
    bVar11 = true;
    pcVar6 = pcVar7;
    pcVar9 = "endif";
    do {
      if (iVar5 == 0) break;
      iVar5 = iVar5 + -1;
      bVar11 = *pcVar6 == *pcVar9;
      pcVar6 = pcVar6 + 1;
      pcVar9 = pcVar9 + 1;
    } while (bVar11);
    if (bVar11) {
      return 0x10b;
    }
    iVar5 = 5;
    bVar11 = true;
    pcVar6 = "elif";
    do {
      if (iVar5 == 0) break;
      iVar5 = iVar5 + -1;
      bVar11 = *pcVar7 == *pcVar6;
      pcVar7 = pcVar7 + 1;
      pcVar6 = pcVar6 + 1;
    } while (bVar11);
    if (!bVar11) goto LAB_10065f9f;
    piVar3 = *(int **)(*(int *)(in_ECX + 0x268) + 0x38);
    if (piVar3 != (int *)0x0) {
      if ((piVar3[1] != 0) && (*piVar3 == 0)) {
        *(int *)(in_ECX + 0x50) = piVar3[1];
        *(undefined4 *)(in_ECX + 0x58) = 1;
        return 0x109;
      }
      return 0x10d;
    }
    *(undefined4 *)(in_ECX + 0x50) = 1;
  }
  else {
    cVar1 = *pcVar7;
    if (cVar1 == 'd') {
      iVar5 = 7;
      bVar11 = true;
      pcVar6 = "define";
      do {
        if (iVar5 == 0) break;
        iVar5 = iVar5 + -1;
        bVar11 = *pcVar7 == *pcVar6;
        pcVar7 = pcVar7 + 1;
        pcVar6 = pcVar6 + 1;
      } while (bVar11);
      if (bVar11) {
        return 0x101;
      }
      goto LAB_10065f9f;
    }
    if (cVar1 != 'e') {
      if (cVar1 != 'i') {
        if (cVar1 == 'l') {
          iVar5 = 5;
          bVar11 = true;
          pcVar6 = "line";
          do {
            if (iVar5 == 0) break;
            iVar5 = iVar5 + -1;
            bVar11 = *pcVar7 == *pcVar6;
            pcVar7 = pcVar7 + 1;
            pcVar6 = pcVar6 + 1;
          } while (bVar11);
          if (bVar11) {
            return 0x103;
          }
        }
        else if (cVar1 == 'p') {
          iVar5 = 7;
          bVar11 = true;
          pcVar6 = "pragma";
          do {
            if (iVar5 == 0) break;
            iVar5 = iVar5 + -1;
            bVar11 = *pcVar7 == *pcVar6;
            pcVar7 = pcVar7 + 1;
            pcVar6 = pcVar6 + 1;
          } while (bVar11);
          if (bVar11) {
            return 0x10e;
          }
        }
        else if (cVar1 == 'u') {
          iVar5 = 6;
          bVar11 = true;
          pcVar6 = "undef";
          do {
            if (iVar5 == 0) break;
            iVar5 = iVar5 + -1;
            bVar11 = *pcVar7 == *pcVar6;
            pcVar7 = pcVar7 + 1;
            pcVar6 = pcVar6 + 1;
          } while (bVar11);
          if (bVar11) {
            return 0x102;
          }
        }
        goto LAB_10065f9f;
      }
      iVar5 = 3;
      bVar11 = true;
      pcVar6 = pcVar7;
      pcVar9 = "if";
      do {
        if (iVar5 == 0) break;
        iVar5 = iVar5 + -1;
        bVar11 = *pcVar6 == *pcVar9;
        pcVar6 = pcVar6 + 1;
        pcVar9 = pcVar9 + 1;
      } while (bVar11);
      if (!bVar11) {
        iVar5 = 6;
        bVar11 = true;
        pcVar6 = pcVar7;
        pcVar9 = "ifdef";
        do {
          if (iVar5 == 0) break;
          iVar5 = iVar5 + -1;
          bVar11 = *pcVar6 == *pcVar9;
          pcVar6 = pcVar6 + 1;
          pcVar9 = pcVar9 + 1;
        } while (bVar11);
        if (bVar11) {
          return 0x107;
        }
        iVar5 = 7;
        bVar11 = true;
        pcVar6 = pcVar7;
        pcVar9 = "ifndef";
        do {
          if (iVar5 == 0) break;
          iVar5 = iVar5 + -1;
          bVar11 = *pcVar6 == *pcVar9;
          pcVar6 = pcVar6 + 1;
          pcVar9 = pcVar9 + 1;
        } while (bVar11);
        if (bVar11) {
          return 0x108;
        }
        iVar5 = 8;
        bVar11 = true;
        pcVar6 = "include";
        do {
          if (iVar5 == 0) break;
          iVar5 = iVar5 + -1;
          bVar11 = *pcVar7 == *pcVar6;
          pcVar7 = pcVar7 + 1;
          pcVar6 = pcVar6 + 1;
        } while (bVar11);
        if (bVar11) {
          return 0x104;
        }
        goto LAB_10065f9f;
      }
      iVar5 = 0x106;
      goto LAB_10065f69;
    }
    iVar5 = 5;
    bVar11 = true;
    pcVar6 = pcVar7;
    pcVar9 = "elif";
    do {
      if (iVar5 == 0) break;
      iVar5 = iVar5 + -1;
      bVar11 = *pcVar6 == *pcVar9;
      pcVar6 = pcVar6 + 1;
      pcVar9 = pcVar9 + 1;
    } while (bVar11);
    if (!bVar11) {
      iVar5 = 5;
      bVar11 = true;
      pcVar6 = pcVar7;
      pcVar9 = "else";
      do {
        if (iVar5 == 0) break;
        iVar5 = iVar5 + -1;
        bVar11 = *pcVar6 == *pcVar9;
        pcVar6 = pcVar6 + 1;
        pcVar9 = pcVar9 + 1;
      } while (bVar11);
      if (bVar11) {
        return 0x10a;
      }
      iVar5 = 6;
      bVar11 = true;
      pcVar6 = pcVar7;
      pcVar9 = "endif";
      do {
        if (iVar5 == 0) break;
        iVar5 = iVar5 + -1;
        bVar11 = *pcVar6 == *pcVar9;
        pcVar6 = pcVar6 + 1;
        pcVar9 = pcVar9 + 1;
      } while (bVar11);
      if (bVar11) {
        return 0x10b;
      }
      iVar5 = 6;
      bVar11 = true;
      pcVar6 = "error";
      do {
        if (iVar5 == 0) break;
        iVar5 = iVar5 + -1;
        bVar11 = *pcVar7 == *pcVar6;
        pcVar7 = pcVar7 + 1;
        pcVar6 = pcVar6 + 1;
      } while (bVar11);
      if (bVar11) {
        return 0x105;
      }
      goto LAB_10065f9f;
    }
  }
  iVar5 = 0x109;
LAB_10065f69:
  *(undefined4 *)(in_ECX + 0x58) = 1;
  return iVar5;
}


