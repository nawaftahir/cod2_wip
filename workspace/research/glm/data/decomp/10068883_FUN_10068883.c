// 10068883 size=583 FUN_10068883

undefined4 FUN_10068883(char *param_1,undefined1 *param_2,byte *param_3)

{
  char cVar1;
  int iVar2;
  long lVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  char *pcVar7;
  char *pcVar8;
  bool bVar9;
  char local_20 [27];
  byte local_5;
  
  cVar1 = *param_1;
  pcVar7 = param_1;
  while ((cVar1 != '\0' && (iVar2 = _isalpha((int)*pcVar7), iVar2 != 0))) {
    pcVar7 = pcVar7 + 1;
    cVar1 = *pcVar7;
  }
  if (*pcVar7 == '\0') {
    local_5 = 0;
  }
  else {
    lVar3 = _atol(pcVar7);
    local_5 = (byte)lVar3;
  }
  if (0xf < local_5) {
    *param_2 = 0;
    *param_3 = 0xff;
    return 0x80004005;
  }
  uVar6 = (int)pcVar7 - (int)param_1;
  if ((uVar6 == 0) || (0x14 < uVar6)) {
    return 0x80004005;
  }
  cVar1 = *pcVar7;
  if (cVar1 != '\0') {
    do {
      iVar2 = _isdigit((int)cVar1);
      if (iVar2 == 0) break;
      pcVar7 = pcVar7 + 1;
      cVar1 = *pcVar7;
    } while (cVar1 != '\0');
    if (*pcVar7 != '\0') {
      return 0x80004005;
    }
  }
  if (*param_1 != '\0') {
    iVar2 = -(int)param_1;
    do {
      iVar4 = _isalpha((int)*param_1);
      if (iVar4 == 0) break;
      iVar4 = _toupper((int)*param_1);
      param_1[(int)(local_20 + iVar2)] = (char)iVar4;
      param_1 = param_1 + 1;
    } while (*param_1 != '\0');
  }
  iVar2 = 9;
  bVar9 = true;
  local_20[uVar6] = '\0';
  iVar4 = iVar2;
  pcVar7 = local_20;
  pcVar8 = "POSITION";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar9 = *pcVar7 == *pcVar8;
    pcVar7 = pcVar7 + 1;
    pcVar8 = pcVar8 + 1;
  } while (bVar9);
  if (bVar9) {
    iVar4 = 0;
  }
  else {
    iVar4 = 0xc;
    bVar9 = true;
    pcVar7 = local_20;
    pcVar8 = "BLENDWEIGHT";
    do {
      if (iVar4 == 0) break;
      iVar4 = iVar4 + -1;
      bVar9 = *pcVar7 == *pcVar8;
      pcVar7 = pcVar7 + 1;
      pcVar8 = pcVar8 + 1;
    } while (bVar9);
    if (bVar9) {
      iVar4 = 1;
    }
    else {
      iVar4 = 0xd;
      bVar9 = true;
      pcVar7 = local_20;
      pcVar8 = "BLENDINDICES";
      do {
        if (iVar4 == 0) break;
        iVar4 = iVar4 + -1;
        bVar9 = *pcVar7 == *pcVar8;
        pcVar7 = pcVar7 + 1;
        pcVar8 = pcVar8 + 1;
      } while (bVar9);
      if (bVar9) {
        iVar4 = 2;
      }
      else {
        iVar4 = 7;
        bVar9 = true;
        pcVar7 = local_20;
        pcVar8 = "NORMAL";
        do {
          if (iVar4 == 0) break;
          iVar4 = iVar4 + -1;
          bVar9 = *pcVar7 == *pcVar8;
          pcVar7 = pcVar7 + 1;
          pcVar8 = pcVar8 + 1;
        } while (bVar9);
        if (bVar9) {
          iVar4 = 3;
        }
        else {
          iVar4 = 6;
          bVar9 = true;
          iVar5 = iVar4;
          pcVar7 = local_20;
          pcVar8 = "PSIZE";
          do {
            if (iVar5 == 0) break;
            iVar5 = iVar5 + -1;
            bVar9 = *pcVar7 == *pcVar8;
            pcVar7 = pcVar7 + 1;
            pcVar8 = pcVar8 + 1;
          } while (bVar9);
          if (bVar9) {
            iVar4 = 4;
          }
          else {
            bVar9 = true;
            iVar5 = iVar2;
            pcVar7 = local_20;
            pcVar8 = "TEXCOORD";
            do {
              if (iVar5 == 0) break;
              iVar5 = iVar5 + -1;
              bVar9 = *pcVar7 == *pcVar8;
              pcVar7 = pcVar7 + 1;
              pcVar8 = pcVar8 + 1;
            } while (bVar9);
            if (bVar9) {
              iVar4 = 5;
            }
            else {
              iVar5 = 8;
              bVar9 = true;
              pcVar7 = local_20;
              pcVar8 = "TANGENT";
              do {
                if (iVar5 == 0) break;
                iVar5 = iVar5 + -1;
                bVar9 = *pcVar7 == *pcVar8;
                pcVar7 = pcVar7 + 1;
                pcVar8 = pcVar8 + 1;
              } while (bVar9);
              if (!bVar9) {
                bVar9 = true;
                iVar4 = iVar2;
                pcVar7 = local_20;
                pcVar8 = "BINORMAL";
                do {
                  if (iVar4 == 0) break;
                  iVar4 = iVar4 + -1;
                  bVar9 = *pcVar7 == *pcVar8;
                  pcVar7 = pcVar7 + 1;
                  pcVar8 = pcVar8 + 1;
                } while (bVar9);
                if (bVar9) {
                  iVar4 = 7;
                }
                else {
                  iVar4 = 0xb;
                  bVar9 = true;
                  iVar5 = iVar4;
                  pcVar7 = local_20;
                  pcVar8 = "TESSFACTOR";
                  do {
                    if (iVar5 == 0) break;
                    iVar5 = iVar5 + -1;
                    bVar9 = *pcVar7 == *pcVar8;
                    pcVar7 = pcVar7 + 1;
                    pcVar8 = pcVar8 + 1;
                  } while (bVar9);
                  if (bVar9) {
                    iVar4 = 8;
                  }
                  else {
                    iVar5 = 10;
                    bVar9 = true;
                    pcVar7 = local_20;
                    pcVar8 = "POSITIONT";
                    do {
                      if (iVar5 == 0) break;
                      iVar5 = iVar5 + -1;
                      bVar9 = *pcVar7 == *pcVar8;
                      pcVar7 = pcVar7 + 1;
                      pcVar8 = pcVar8 + 1;
                    } while (bVar9);
                    if (bVar9) {
                      iVar4 = 9;
                    }
                    else {
                      iVar5 = 6;
                      bVar9 = true;
                      pcVar7 = local_20;
                      pcVar8 = "COLOR";
                      do {
                        if (iVar5 == 0) break;
                        iVar5 = iVar5 + -1;
                        bVar9 = *pcVar7 == *pcVar8;
                        pcVar7 = pcVar7 + 1;
                        pcVar8 = pcVar8 + 1;
                      } while (bVar9);
                      if (!bVar9) {
                        iVar5 = 4;
                        bVar9 = true;
                        pcVar7 = local_20;
                        pcVar8 = "FOG";
                        do {
                          if (iVar5 == 0) break;
                          iVar5 = iVar5 + -1;
                          bVar9 = *pcVar7 == *pcVar8;
                          pcVar7 = pcVar7 + 1;
                          pcVar8 = pcVar8 + 1;
                        } while (bVar9);
                        if (bVar9) goto LAB_10068aad;
                        iVar4 = 6;
                        bVar9 = true;
                        pcVar7 = local_20;
                        pcVar8 = "DEPTH";
                        do {
                          if (iVar4 == 0) break;
                          iVar4 = iVar4 + -1;
                          bVar9 = *pcVar7 == *pcVar8;
                          pcVar7 = pcVar7 + 1;
                          pcVar8 = pcVar8 + 1;
                        } while (bVar9);
                        if (bVar9) {
                          iVar4 = 0xc;
                          goto LAB_10068aad;
                        }
                        iVar4 = 7;
                        bVar9 = true;
                        pcVar7 = local_20;
                        pcVar8 = "SAMPLE";
                        do {
                          if (iVar4 == 0) break;
                          iVar4 = iVar4 + -1;
                          bVar9 = *pcVar7 == *pcVar8;
                          pcVar7 = pcVar7 + 1;
                          pcVar8 = pcVar8 + 1;
                        } while (bVar9);
                        if (bVar9) {
                          iVar4 = 0xd;
                          goto LAB_10068aad;
                        }
                        iVar4 = 8;
                        bVar9 = true;
                        pcVar7 = local_20;
                        pcVar8 = "DIFFUSE";
                        do {
                          if (iVar4 == 0) break;
                          iVar4 = iVar4 + -1;
                          bVar9 = *pcVar7 == *pcVar8;
                          pcVar7 = pcVar7 + 1;
                          pcVar8 = pcVar8 + 1;
                        } while (bVar9);
                        if (bVar9) {
                          local_5 = 0;
                        }
                        else {
                          bVar9 = true;
                          pcVar7 = local_20;
                          pcVar8 = "SPECULAR";
                          do {
                            if (iVar2 == 0) break;
                            iVar2 = iVar2 + -1;
                            bVar9 = *pcVar7 == *pcVar8;
                            pcVar7 = pcVar7 + 1;
                            pcVar8 = pcVar8 + 1;
                          } while (bVar9);
                          if (!bVar9) {
                            return 0x80004005;
                          }
                          local_5 = 1;
                        }
                      }
                      iVar4 = 10;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LAB_10068aad:
  *param_2 = (char)iVar4;
  *param_3 = local_5;
  return 0;
}


