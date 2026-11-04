// 1009e0fb size=1725 FUN_1009e0fb

undefined4
FUN_1009e0fb(int param_1,int param_2,undefined4 param_3,undefined4 param_4,int param_5,uint param_6,
            int *param_7,int *param_8)

{
  char cVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int *piVar6;
  undefined4 uVar7;
  undefined4 in_ECX;
  uint uVar8;
  int *piVar9;
  char *pcVar10;
  short *psVar11;
  char *pcVar12;
  bool bVar13;
  undefined8 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  int local_114 [64];
  int local_14;
  uint local_10;
  uint local_c;
  undefined4 local_8;
  
  if (param_7 != (int *)0x0) {
    *param_7 = 0;
  }
  if (param_8 != (int *)0x0) {
    *param_8 = 0;
  }
  local_10 = 0xffffffff;
  local_c = 0;
  local_8 = in_ECX;
  if (param_5 != 0) {
    do {
      if (local_10 == 0) break;
      local_14 = FUN_100997e2(param_2,param_5);
      while ((local_14 != 0 && (local_10 != 0))) {
        iVar5 = *(int *)(local_14 + 8);
        if (param_1 != *(int *)(iVar5 + 0x10)) {
          if ((param_6 & 5) != 0) {
            FUN_100994dd(local_8,param_2,0xbbd,"\'%s\': identifier represents a %s, not a %s",
                         *(undefined4 *)(param_2 + 8),(&PTR_DAT_10114c18)[*(int *)(iVar5 + 0x10)],
                         (&PTR_DAT_10114c18)[param_1]);
          }
          if (param_7 != (int *)0x0) {
            *param_7 = 0;
          }
          return 0x80004005;
        }
        uVar8 = 0;
        if ((param_6 & 4) != 0) {
          uVar8 = FUN_1009cac4(*(undefined4 *)(iVar5 + 0x18),param_3,param_4,param_6);
        }
        if ((param_6 & 8) != 0) {
          iVar4 = FUN_1009b381(*(undefined4 *)(iVar5 + 0x18),param_3,param_4,param_6);
          uVar8 = uVar8 + iVar4;
        }
        if (uVar8 != 0xffffffff) {
          if (uVar8 < local_10) {
            local_c = 0;
            local_10 = uVar8;
          }
          uVar2 = local_c;
          if ((uVar8 == local_10) && (local_c < 0x40)) {
            local_c = local_c + 1;
            local_114[uVar2] = iVar5;
          }
          if (((local_10 == 0) && (*(int *)(iVar5 + 0x2c) != 0)) && (*(int *)(iVar5 + 0x28) == 0)) {
            iVar4 = *(int *)(param_5 + 0x20);
            iVar3 = local_14;
            if ((iVar4 != 0) && (*(int *)(iVar4 + 0x10) == 4)) {
              for (iVar4 = FUN_100997e2(param_2,iVar4); iVar3 = local_14, iVar4 != 0;
                  iVar4 = *(int *)(iVar4 + 0xc)) {
                if (*(int *)(*(int *)(iVar4 + 8) + 0x2c) == 0) {
                  FUN_10099533(local_8,param_2,0xc06,
                               "\'%s\': loop control variable used outside for-loop scope conflicts with a previous declaration in the outer scope; most recent definition used"
                               ,*(undefined4 *)(param_2 + 8));
                  *(undefined4 *)(iVar5 + 0x28) = 1;
                  iVar3 = local_14;
                  break;
                }
              }
            }
            do {
              iVar3 = *(int *)(iVar3 + 0xc);
              if (iVar3 == 0) goto LAB_1009e272;
            } while (*(int *)(*(int *)(iVar3 + 8) + 0x2c) != 0);
            FUN_10099533(local_8,param_2,0xc06,
                         "\'%s\': loop control variable used outside for-loop scope conflicts with a previous declaration in the outer scope; most recent definition used"
                         ,*(undefined4 *)(param_2 + 8));
            *(undefined4 *)(iVar5 + 0x28) = 1;
          }
        }
LAB_1009e272:
        local_14 = *(int *)(local_14 + 0xc);
      }
      param_5 = *(int *)(param_5 + 0x20);
    } while (param_5 != 0);
    if (local_10 == 0xffffffff) goto LAB_1009e410;
    if ((param_6 & 4) != 0) {
      iVar5 = *(int *)(local_114[0] + 0x18);
      uVar8 = 1;
      if (1 < local_c) {
        do {
          uVar14 = FUN_10099bdd(*(undefined4 *)(iVar5 + 0x20),
                                *(undefined4 *)(*(int *)(local_114[uVar8] + 0x18) + 0x20));
          if (((int)uVar14 == 0) ||
             (iVar4 = FUN_1009b381(iVar5,*(undefined4 *)(iVar5 + 0x1c),
                                   *(undefined4 *)((int)((ulonglong)uVar14 >> 0x20) + 0x24),0),
             iVar4 == -1)) break;
          uVar8 = uVar8 + 1;
        } while (uVar8 < local_c);
        if (uVar8 < local_c) {
          FUN_100994dd(local_8,param_2,0xbfb,"\'%s\': ambiguous function call",
                       *(undefined4 *)(param_2 + 8));
        }
      }
    }
    if (param_7 != (int *)0x0) {
      if ((param_6 & 2) != 0) {
        *param_7 = *(int *)(local_114[0] + 0x18);
        goto LAB_1009e384;
      }
      if (*(int *)(local_114[0] + 0x18) == 0) goto LAB_1009e384;
      iVar5 = FUN_10082816(*(int *)(local_114[0] + 0x18));
      *param_7 = iVar5;
      if (iVar5 != 0) goto LAB_1009e384;
      goto LAB_1009e77c;
    }
LAB_1009e384:
    uVar8 = 0;
    if (param_8 != (int *)0x0) {
      param_7 = (int *)0x0;
      piVar9 = (int *)&param_7;
      if (local_c != 0) {
        do {
          iVar5 = FUN_1006506e(0x14);
          if (iVar5 == 0) {
            iVar5 = 0;
          }
          else {
            iVar5 = FUN_10082872(0,0,"Values");
          }
          *piVar9 = iVar5;
          if (iVar5 == 0) goto LAB_1009e77c;
          iVar5 = FUN_1006506e(0x40);
          if (iVar5 == 0) {
            iVar5 = 0;
          }
          else {
            iVar5 = FUN_100833a3(2,*(undefined4 *)(local_114[uVar8] + 0x24),param_2);
          }
          *(int *)(*piVar9 + 8) = iVar5;
          if (iVar5 == 0) goto LAB_1009e77c;
          piVar9 = (int *)(*piVar9 + 0xc);
          uVar8 = uVar8 + 1;
        } while (uVar8 < local_c);
      }
      *param_8 = (int)param_7;
    }
    goto LAB_1009e788;
  }
LAB_1009e410:
  piVar9 = param_7;
  if (((param_6 & 2) != 0) || (param_8 != (int *)0x0)) goto LAB_1009e78c;
  if (param_1 == 0) {
    iVar5 = __stricmp(*(char **)(param_2 + 8),"dword");
    if (iVar5 == 0) {
      uVar7 = 4;
LAB_1009e458:
      if (piVar9 != (int *)0x0) {
        iVar5 = FUN_1006506e(0x24);
        if (iVar5 == 0) {
LAB_1009e475:
          iVar5 = 0;
        }
        else {
          uVar17 = 1;
          uVar16 = 1;
          uVar15 = 0;
LAB_1009e4e6:
          iVar5 = FUN_10082e36(uVar15,uVar7,uVar16,uVar17,0);
        }
        *piVar9 = iVar5;
        goto LAB_1009e47b;
      }
    }
    else {
      iVar5 = __stricmp(*(char **)(param_2 + 8),"float");
      if (iVar5 == 0) {
        uVar7 = 0xb;
        goto LAB_1009e458;
      }
      iVar5 = __stricmp(*(char **)(param_2 + 8),"vector");
      if (iVar5 == 0) {
        if (piVar9 == (int *)0x0) goto LAB_1009e788;
        iVar5 = FUN_1006506e(0x24);
        if (iVar5 != 0) {
          uVar17 = 4;
          uVar16 = 1;
          uVar7 = 0xb;
          uVar15 = 1;
          goto LAB_1009e4e6;
        }
        goto LAB_1009e475;
      }
      iVar5 = __stricmp(*(char **)(param_2 + 8),"matrix");
      if (iVar5 == 0) {
        if (piVar9 == (int *)0x0) goto LAB_1009e788;
        iVar5 = FUN_1006506e(0x24);
        if (iVar5 == 0) goto LAB_1009e475;
        uVar17 = 4;
        uVar16 = 4;
        uVar7 = 0xb;
        uVar15 = 2;
        goto LAB_1009e4e6;
      }
      iVar5 = __stricmp(*(char **)(param_2 + 8),"string");
      if (iVar5 != 0) {
        iVar5 = __stricmp(*(char **)(param_2 + 8),"texture");
        if (iVar5 == 0) {
          uVar7 = 0xf;
          goto LAB_1009e549;
        }
        iVar5 = __stricmp(*(char **)(param_2 + 8),"pixelshader");
        if (iVar5 == 0) {
          uVar7 = 0x19;
          goto LAB_1009e549;
        }
        iVar5 = __stricmp(*(char **)(param_2 + 8),"vertexshader");
        if (iVar5 == 0) {
          uVar7 = 0x1a;
          goto LAB_1009e549;
        }
        piVar9 = *(int **)(param_2 + 8);
        piVar6 = piVar9;
        do {
          iVar5 = *piVar6;
          piVar6 = (int *)((int)piVar6 + 1);
        } while ((char)iVar5 != '\0');
        uVar8 = (int)piVar6 - (int)((int)piVar9 + 1);
        iVar5 = 3;
        if ((uVar8 < 4) || (*piVar9 != 0x6c6f6f62)) {
          if (2 < uVar8) {
            bVar13 = true;
            piVar6 = piVar9;
            pcVar10 = "int";
            do {
              if (iVar5 == 0) break;
              iVar5 = iVar5 + -1;
              bVar13 = (char)*piVar6 == *pcVar10;
              piVar6 = (int *)((int)piVar6 + 1);
              pcVar10 = pcVar10 + 1;
            } while (bVar13);
            if (bVar13) {
              piVar9 = (int *)((int)piVar9 + 3);
              uVar7 = 4;
              iVar5 = uVar8 - 3;
              goto LAB_1009e623;
            }
          }
          if ((uVar8 < 4) || (*piVar9 != 0x666c6168)) {
            if (4 < uVar8) {
              iVar5 = 5;
              bVar13 = true;
              piVar6 = piVar9;
              pcVar10 = "float";
              do {
                if (iVar5 == 0) break;
                iVar5 = iVar5 + -1;
                bVar13 = (char)*piVar6 == *pcVar10;
                piVar6 = (int *)((int)piVar6 + 1);
                pcVar10 = pcVar10 + 1;
              } while (bVar13);
              if (bVar13) {
                piVar9 = (int *)((int)piVar9 + 5);
                uVar7 = 0xb;
                iVar5 = uVar8 - 5;
                goto LAB_1009e623;
              }
            }
            if (uVar8 < 6) goto LAB_1009e78c;
            iVar5 = 3;
            bVar13 = true;
            piVar6 = piVar9;
            psVar11 = (short *)"double";
            do {
              if (iVar5 == 0) break;
              iVar5 = iVar5 + -1;
              bVar13 = (short)*piVar6 == *psVar11;
              piVar6 = (int *)((int)piVar6 + 2);
              psVar11 = psVar11 + 1;
            } while (bVar13);
            if (!bVar13) goto LAB_1009e78c;
            piVar9 = (int *)((int)piVar9 + 6);
            uVar7 = 0xc;
            iVar5 = uVar8 - 6;
          }
          else {
            piVar9 = piVar9 + 1;
            uVar7 = 10;
            iVar5 = uVar8 - 4;
          }
        }
        else {
          uVar7 = 0;
          piVar9 = piVar9 + 1;
          iVar5 = uVar8 - 4;
        }
LAB_1009e623:
        if (iVar5 != 1) {
          if (((((iVar5 != 3) || ((char)*piVar9 < '1')) || ('4' < (char)*piVar9)) ||
              ((*(char *)((int)piVar9 + 1) != 'x' || (*(char *)((int)piVar9 + 2) < '1')))) ||
             ('4' < *(char *)((int)piVar9 + 2))) {
LAB_1009e78c:
            if ((param_6 & 1) != 0) {
              FUN_100994dd(local_8,param_2,0xbbc,"undeclared identifier \'%s\'",
                           *(undefined4 *)(param_2 + 8));
            }
            return 1;
          }
          if (param_7 == (int *)0x0) goto LAB_1009e788;
          iVar5 = FUN_1006506e(0x24);
          if (iVar5 == 0) goto LAB_1009e6c9;
          cVar1 = *(char *)((int)piVar9 + 2);
          iVar5 = (char)*piVar9 + -0x30;
          uVar15 = 2;
LAB_1009e65d:
          iVar5 = FUN_10082e36(uVar15,uVar7,iVar5,cVar1 + -0x30,0);
LAB_1009e6cb:
          *param_7 = iVar5;
          goto LAB_1009e47b;
        }
        if (((char)*piVar9 < '1') || ('4' < (char)*piVar9)) goto LAB_1009e78c;
        if (param_7 != (int *)0x0) {
          iVar5 = FUN_1006506e(0x24);
          if (iVar5 != 0) {
            cVar1 = (char)*piVar9;
            iVar5 = 1;
            uVar15 = 1;
            goto LAB_1009e65d;
          }
LAB_1009e6c9:
          iVar5 = 0;
          goto LAB_1009e6cb;
        }
        goto LAB_1009e788;
      }
      uVar7 = 0xe;
LAB_1009e549:
      piVar9 = param_7;
      if (param_7 == (int *)0x0) goto LAB_1009e788;
      iVar5 = FUN_1006506e(0x24);
      if (iVar5 == 0) {
        iVar5 = 0;
      }
      else {
        iVar5 = FUN_10082e36(3,uVar7,1,1,0);
      }
      *piVar9 = iVar5;
LAB_1009e47b:
      if (iVar5 == 0) goto LAB_1009e77c;
    }
LAB_1009e788:
    uVar7 = 0;
  }
  else {
    if (param_1 != 1) goto LAB_1009e78c;
    iVar5 = 5;
    bVar13 = true;
    pcVar10 = *(char **)(param_2 + 8);
    pcVar12 = "NULL";
    do {
      if (iVar5 == 0) break;
      iVar5 = iVar5 + -1;
      bVar13 = *pcVar10 == *pcVar12;
      pcVar10 = pcVar10 + 1;
      pcVar12 = pcVar12 + 1;
    } while (bVar13);
    if (!bVar13) goto LAB_1009e78c;
    if (param_7 == (int *)0x0) goto LAB_1009e788;
    iVar5 = FUN_1006506e(0x40);
    if (iVar5 == 0) {
      iVar5 = 0;
    }
    else {
      iVar5 = FUN_1008300b();
    }
    if (iVar5 != 0) {
      *(undefined4 *)(iVar5 + 0x14) = 1;
      *(undefined4 *)(iVar5 + 0x18) = 0;
      *(undefined4 *)(iVar5 + 0x1c) = 0x202;
      iVar4 = FUN_1006506e(0x24);
      if (iVar4 == 0) {
        iVar4 = 0;
      }
      else {
        iVar4 = FUN_10082e36(3,0xd,1,1,0x200);
      }
      *(int *)(iVar5 + 0x20) = iVar4;
      if (iVar4 != 0) {
        iVar4 = FUN_1006506e(0x40);
        if (iVar4 == 0) {
          iVar4 = 0;
        }
        else {
          iVar4 = FUN_10083442(5,0,0,param_2);
        }
        *(int *)(iVar5 + 0x24) = iVar4;
        if (iVar4 != 0) {
          *param_7 = iVar5;
          goto LAB_1009e788;
        }
      }
    }
LAB_1009e77c:
    uVar7 = 0x8007000e;
  }
  return uVar7;
}


