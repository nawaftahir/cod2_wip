// 1005f690 size=940 FUN_1005f690

/* WARNING: Removing unreachable block (ram,0x1005f710) */

char * FUN_1005f690(int *param_1)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  char *pcVar5;
  char cVar6;
  int iVar7;
  char *pcVar8;
  char *pcVar9;
  uint uVar10;
  uint uVar11;
  undefined **ppuVar12;
  
  iVar7 = DAT_101aac70 * 0x45c;
  iVar2 = *param_1;
  uVar11 = 0;
  pcVar8 = &DAT_101a66b0 + iVar7;
  *pcVar8 = '\0';
  if (iVar2 == 0) {
    *param_1 = 0;
    return pcVar8;
  }
  *(undefined4 *)(&DAT_101a6ac4 + iVar7) = *(undefined4 *)(&DAT_101a6ab0 + iVar7);
  *(int *)(&DAT_101a6ac8 + iVar7) = *param_1;
  if ((&DAT_101a6ab7)[iVar7] != '\0') {
    pcVar8 = (char *)FUN_1005f5c0();
    return pcVar8;
  }
  pcVar4 = (char *)FUN_1005f4d0();
  while( true ) {
    if (pcVar4 == (char *)0x0) {
      *param_1 = 0;
      return pcVar8;
    }
    cVar6 = *pcVar4;
    if (cVar6 != '/') break;
    if (pcVar4[1] == '/') {
      cVar6 = '/';
      do {
        if (cVar6 == '\n') break;
        cVar6 = pcVar4[1];
        pcVar4 = pcVar4 + 1;
      } while (cVar6 != '\0');
    }
    else {
      if (pcVar4[1] != '*') break;
      cVar6 = '/';
      do {
        if ((cVar6 == '*') && (pcVar4[1] == '/')) break;
        if (cVar6 == '\n') {
          *(int *)(&DAT_101a6ab0 + iVar7) = *(int *)(&DAT_101a6ab0 + iVar7) + 1;
        }
        cVar6 = pcVar4[1];
        pcVar4 = pcVar4 + 1;
      } while (cVar6 != '\0');
    }
    pcVar4 = (char *)FUN_1005f4d0();
  }
  DAT_101aac78 = DAT_101aac74;
  if (cVar6 == '\"') {
    pcVar5 = pcVar4;
    if ((&DAT_101a6ab6)[iVar7] != '\0') {
      *pcVar8 = '\"';
      DAT_101aac74 = pcVar5;
      pcVar5 = DAT_101aac74;
    }
    DAT_101aac74 = pcVar5;
    uVar11 = (uint)((&DAT_101a6ab6)[iVar7] != '\0');
    pcVar5 = pcVar4 + 1;
    do {
      cVar6 = *pcVar5;
      pcVar4 = pcVar5 + 1;
      if (cVar6 == '\\') {
        cVar1 = *pcVar4;
        if ((cVar1 != '\"') && (cVar1 != '\\')) goto LAB_1005f7e1;
        pcVar4 = pcVar5 + 2;
        cVar6 = cVar1;
      }
      else {
        if ((cVar6 == '\"') || (cVar6 == '\0')) goto LAB_1005f7fa;
LAB_1005f7e1:
        if (*pcVar4 == '\n') {
          *(int *)(&DAT_101a6ab0 + iVar7) = *(int *)(&DAT_101a6ab0 + iVar7) + 1;
        }
      }
      pcVar5 = pcVar4;
      if ((int)uVar11 < 0x3ff) {
        pcVar8[uVar11] = cVar6;
        uVar11 = uVar11 + 1;
      }
    } while( true );
  }
  pcVar5 = pcVar4;
  if ((&DAT_101a6ab5)[iVar7] != '\0') {
    do {
      DAT_101aac74 = pcVar5;
      if ((int)uVar11 < 0x3ff) {
        pcVar8[uVar11] = cVar6;
        uVar11 = uVar11 + 1;
      }
      cVar6 = pcVar4[1];
      pcVar4 = pcVar4 + 1;
      pcVar5 = DAT_101aac74;
    } while (' ' < cVar6);
    if (uVar11 == 0x400) {
      uVar11 = 0;
    }
    pcVar8[uVar11] = '\0';
    *param_1 = (int)pcVar4;
    return pcVar8;
  }
  if ((cVar6 < '0') || ('9' < cVar6)) {
    if (((&DAT_101a6ab8)[iVar7] != '\0') && (cVar6 == '-')) {
      cVar1 = pcVar4[1];
joined_r0x1005f882:
      if ((cVar1 < '0') || ('9' < cVar1)) {
LAB_1005f961:
        ppuVar12 = &PTR_DAT_101a6674;
        pcVar5 = PTR_DAT_101a6674;
        do {
          if (pcVar5 == (char *)0x0) {
            pcVar5 = pcVar4;
            *pcVar8 = *pcVar4;
            DAT_101aac74 = pcVar5;
            (&DAT_101a66b1)[iVar7] = 0;
            *param_1 = (int)(pcVar4 + 1);
            return pcVar8;
          }
          pcVar9 = pcVar5;
          do {
            cVar6 = *pcVar9;
            pcVar9 = pcVar9 + 1;
          } while (cVar6 != '\0');
          uVar11 = (int)pcVar9 - (int)(pcVar5 + 1);
          uVar10 = 0;
          if (0 < (int)uVar11) {
            do {
              if (pcVar4[uVar10] != pcVar5[uVar10]) break;
              uVar10 = uVar10 + 1;
            } while ((int)uVar10 < (int)uVar11);
          }
          if (uVar10 == uVar11) {
            pcVar5 = *ppuVar12;
            pcVar9 = pcVar8;
            pcVar3 = pcVar4;
            for (uVar10 = uVar11 >> 2; DAT_101aac74 = pcVar3, uVar10 != 0; uVar10 = uVar10 - 1) {
              *(undefined4 *)pcVar9 = *(undefined4 *)pcVar5;
              pcVar5 = pcVar5 + 4;
              pcVar9 = pcVar9 + 4;
              pcVar3 = DAT_101aac74;
            }
            for (uVar10 = uVar11 & 3; uVar10 != 0; uVar10 = uVar10 - 1) {
              *pcVar9 = *pcVar5;
              pcVar5 = pcVar5 + 1;
              pcVar9 = pcVar9 + 1;
            }
            pcVar8[uVar11] = '\0';
            *param_1 = (int)(pcVar4 + uVar11);
            return pcVar8;
          }
          pcVar5 = ppuVar12[1];
          ppuVar12 = ppuVar12 + 1;
        } while( true );
      }
      goto LAB_1005f8b0;
    }
    if (cVar6 == '.') {
      cVar1 = pcVar4[1];
      goto joined_r0x1005f882;
    }
    if (((cVar6 < 'a') || ('z' < cVar6)) &&
       ((((cVar6 < 'A' || ('Z' < cVar6)) && (cVar6 != '_')) && ((cVar6 != '/' && (cVar6 != '\\')))))
       ) goto LAB_1005f961;
    do {
      DAT_101aac74 = pcVar5;
      if ((int)uVar11 < 0x3ff) {
        pcVar8[uVar11] = cVar6;
        uVar11 = uVar11 + 1;
      }
      cVar6 = pcVar4[1];
      pcVar4 = pcVar4 + 1;
      pcVar5 = DAT_101aac74;
    } while (((('`' < cVar6) && (cVar6 < '{')) || (('@' < cVar6 && (cVar6 < '[')))) ||
            ((cVar6 == '_' || (('/' < cVar6 && (cVar6 < ':'))))));
  }
  else {
LAB_1005f8b0:
    do {
      DAT_101aac74 = pcVar5;
      pcVar9 = pcVar4;
      if ((int)uVar11 < 0x3ff) {
        pcVar8[uVar11] = cVar6;
        uVar11 = uVar11 + 1;
      }
      cVar6 = pcVar9[1];
      pcVar4 = pcVar9 + 1;
      pcVar5 = DAT_101aac74;
    } while ((('/' < cVar6) && (cVar6 < ':')) || (cVar6 == '.'));
    if ((cVar6 == 'e') || (cVar6 == 'E')) {
      if ((int)uVar11 < 0x3ff) {
        pcVar8[uVar11] = cVar6;
        uVar11 = uVar11 + 1;
      }
      cVar6 = pcVar9[2];
      pcVar4 = pcVar9 + 2;
      if ((cVar6 == '-') || (cVar6 == '+')) {
        if ((int)uVar11 < 0x3ff) {
          pcVar8[uVar11] = cVar6;
          uVar11 = uVar11 + 1;
        }
        cVar6 = pcVar9[3];
        pcVar4 = pcVar9 + 3;
      }
      do {
        if ((int)uVar11 < 0x3ff) {
          pcVar8[uVar11] = cVar6;
          uVar11 = uVar11 + 1;
        }
        cVar6 = pcVar4[1];
        pcVar4 = pcVar4 + 1;
      } while (('/' < cVar6) && (cVar6 < ':'));
    }
  }
  if (uVar11 == 0x400) {
    uVar11 = 0;
  }
LAB_1005fa2d:
  pcVar8[uVar11] = '\0';
  *param_1 = (int)pcVar4;
  return pcVar8;
LAB_1005f7fa:
  if ((&DAT_101a6ab6)[iVar7] != '\0') {
    pcVar8[uVar11] = '\"';
    pcVar8[uVar11 + 1] = '\0';
    *param_1 = (int)pcVar4;
    return pcVar8;
  }
  goto LAB_1005fa2d;
}


