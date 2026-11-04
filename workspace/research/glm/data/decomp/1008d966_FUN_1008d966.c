// 1008d966 size=1841 FUN_1008d966

undefined4 FUN_1008d966(uint *param_1,uint *param_2,int param_3)

{
  uint *puVar1;
  uint *puVar2;
  uint uVar3;
  int iVar4;
  float10 fVar5;
  uint uVar6;
  int iVar7;
  uint *puVar8;
  uint *puVar9;
  int *piVar10;
  uint uVar11;
  int in_ECX;
  int *piVar12;
  int *piVar13;
  uint uVar14;
  undefined *puVar15;
  uint uVar16;
  float10 fVar17;
  double dVar18;
  
  iVar7 = *(int *)(in_ECX + 0x14);
  uVar11 = *(uint *)(*(int *)(iVar7 + param_3 * 4) + 0x30);
  puVar1 = *(uint **)(iVar7 + (int)param_2 * 4);
  puVar2 = *(uint **)(iVar7 + uVar11 * 4);
  uVar16 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar1[1] * 4) + 4);
  if ((uVar16 & 1) == 0) {
    return 0;
  }
  if ((uVar16 & 0x1000) != 0) {
    return 0;
  }
  uVar16 = *puVar2;
  uVar3 = *puVar1;
  uVar14 = uVar3 & 0x40;
  puVar15 = (undefined *)(*param_1 & 0xfff00000);
  if (puVar15 == (undefined *)0x10000000) {
    *puVar1 = uVar3 | uVar16 & 0x1f;
    goto LAB_1008e08b;
  }
  uVar6 = uVar16 & 0x40 | uVar3;
  *puVar1 = uVar6;
  if (((uVar3 & 0xe000000) == 0) &&
     ((((puVar15 == (undefined *)0x10100000 || (puVar15 == &DAT_10300000)) ||
       (puVar15 == &DAT_10400000)) ||
      ((puVar15 == (undefined *)0x10d00000 || (puVar15 == (undefined *)0x10e00000)))))) {
    *puVar1 = *puVar2 & 0xe000000 | uVar6;
  }
  uVar3 = 4;
  if (puVar15 == (undefined *)0x10100000) {
    *puVar1 = *puVar1 | (uVar16 & 0x1f) >> 1 & 4 | (uVar16 & 4) << 1 | uVar16 & 0x13;
  }
  else {
    if (puVar15 == &DAT_10300000) {
      if (((uVar16 & 4) == 0) || (uVar6 = uVar3, (uVar16 & 8) == 0)) {
        uVar6 = uVar16 & 0xc;
      }
    }
    else {
      uVar6 = 4;
      if (((puVar15 != &DAT_10400000) && (uVar6 = uVar3, puVar15 != &DAT_10500000)) &&
         (puVar15 != &DAT_10700000)) goto LAB_1008da87;
    }
    *puVar1 = *puVar1 | uVar6;
  }
LAB_1008da87:
  uVar3 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar2[1] * 4) + 4);
  if (((uVar3 & 0x100) == 0) || (puVar2[2] != 0xffffffff)) {
    if ((((uVar16 & 1) == 0) || (puVar15 != &DAT_10400000)) &&
       (((uVar16 & 2) == 0 || (puVar15 != &DAT_10400000)))) {
      if ((uVar16 & 8) != 0) {
        if (puVar15 == &DAT_10600000) {
          if (uVar14 != 0) {
            return 0;
          }
          if ((uVar16 & 4) != 0) {
            return 0;
          }
          FUN_1008b0b5();
          return 0;
        }
        if (puVar15 == &DAT_10700000) {
          if (uVar14 != 0) {
            return 0;
          }
          FUN_1008b0b5();
          dVar18 = 0.0;
          goto LAB_1008e081;
        }
      }
      if (((uVar3 & 0x200) == 0) ||
         ((puVar15 != (undefined *)0x10d00000 && (puVar15 != (undefined *)0x10e00000)))) {
        if (uVar14 != 0) {
          return 0;
        }
        if ((uVar3 & 2) == 0) {
          return 0;
        }
        if (((((puVar15 != (undefined *)0x10100000) ||
              (puVar8 = *(uint **)(*(int *)(in_ECX + 0x18) + puVar2[0x12] * 4),
              (*puVar8 & 0xfff00000) != 0x10100000)) &&
             ((puVar15 != &DAT_10300000 ||
              (puVar8 = *(uint **)(*(int *)(in_ECX + 0x18) + puVar2[0x12] * 4),
              (undefined *)(*puVar8 & 0xfff00000) != &DAT_10300000)))) &&
            ((puVar15 != &DAT_10500000 ||
             (puVar8 = *(uint **)(*(int *)(in_ECX + 0x18) + puVar2[0x12] * 4),
             (undefined *)(*puVar8 & 0xfff00000) != &DAT_10600000)))) &&
           ((puVar15 != &DAT_10600000 ||
            (puVar8 = *(uint **)(*(int *)(in_ECX + 0x18) + puVar2[0x12] * 4),
            (undefined *)(*puVar8 & 0xfff00000) != &DAT_10500000)))) {
LAB_1008de6c:
          if ((puVar15 == &DAT_10300000) &&
             (puVar8 = *(uint **)(*(int *)(in_ECX + 0x18) + puVar2[0x12] * 4),
             (*puVar8 & 0xfff00000) == 0x20500000)) {
            uVar16 = 0;
            if (puVar8[3] != 0) {
              puVar9 = (uint *)puVar8[4];
              do {
                if (*puVar9 == uVar11) break;
                uVar16 = uVar16 + 1;
                puVar9 = puVar9 + 1;
              } while (uVar16 < puVar8[3]);
            }
            uVar3 = puVar8[3];
            param_2 = (uint *)0x0;
            piVar10 = (int *)(puVar8[2] + uVar16 * 4);
            piVar13 = (int *)(puVar8[2] + (uVar3 + uVar16) * 4);
            do {
              iVar7 = *piVar10;
              iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + iVar7 * 4);
              if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4) & 2)
                   != 0) &&
                 (puVar8 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar4 + 0x48) * 4),
                 (undefined *)(*puVar8 & 0xfff00000) == &DAT_10700000)) {
                param_1 = (uint *)0x0;
                if (puVar8[3] != 0) {
                  piVar12 = (int *)puVar8[4];
                  do {
                    if (*piVar12 == iVar7) break;
                    param_1 = (uint *)((int)param_1 + 1);
                    piVar12 = piVar12 + 1;
                  } while (param_1 < puVar8[3]);
                }
                if (*(int *)(puVar8[2] + (int)param_1 * 4) == *piVar13) {
                  puVar1[0xc] = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7 * 4) + 0x30);
                  return 0;
                }
              }
              piVar10 = piVar10 + uVar3;
              param_2 = (uint *)((int)param_2 + 1);
              piVar13 = piVar13 + -uVar3;
            } while (param_2 < 2);
          }
          if (puVar15 != &DAT_10500000) {
            return 0;
          }
          puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + puVar2[0x12] * 4);
          if ((*puVar2 & 0xfff00000) != 0x20500000) {
            return 0;
          }
          uVar16 = puVar2[3];
          param_1 = (uint *)0x0;
          if (uVar16 != 0) {
            param_2 = (uint *)puVar2[4];
            do {
              if (*param_2 == uVar11) break;
              param_1 = (uint *)((int)param_1 + 1);
              param_2 = param_2 + 1;
            } while (param_1 < uVar16);
          }
          param_2 = (uint *)0x0;
          iVar7 = *(int *)(in_ECX + 0x14);
          piVar10 = (int *)(puVar2[2] + (int)param_1 * 4);
          do {
            iVar4 = *(int *)(iVar7 + *piVar10 * 4);
            if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4) & 2) !=
                 0) && (puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar4 + 0x48) * 4),
                       (undefined *)(*puVar2 & 0xfff00000) == &DAT_10600000)) {
              param_1 = (uint *)0x0;
              if (puVar2[3] != 0) {
                piVar13 = (int *)puVar2[4];
                do {
                  if (*piVar13 == *piVar10) break;
                  param_1 = (uint *)((int)param_1 + 1);
                  piVar13 = piVar13 + 1;
                } while (param_1 < puVar2[3]);
              }
              iVar7 = *(int *)(in_ECX + 0x14);
              uVar11 = **(uint **)(iVar7 + *(int *)(puVar2[2] + (int)param_1 * 4) * 4);
              if (((uVar11 & 4) != 0) && ((uVar11 & 8) != 0)) goto LAB_1008e076;
            }
            piVar10 = piVar10 + uVar16;
            param_2 = (uint *)((int)param_2 + 1);
            if (1 < param_2) {
              return 0;
            }
          } while( true );
        }
        param_1 = (uint *)0x0;
        if (puVar8[3] != 0) {
          puVar9 = (uint *)puVar8[4];
          do {
            if (*puVar9 == uVar11) break;
            param_1 = (uint *)((int)param_1 + 1);
            puVar9 = puVar9 + 1;
          } while (param_1 < puVar8[3]);
        }
        if (puVar8[3] <= param_1) goto LAB_1008de6c;
        uVar11 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                   *(int *)(puVar8[2] + (int)param_1 * 4) * 4) + 0x30);
        goto LAB_1008e08b;
      }
    }
LAB_1008e076:
    dVar18 = 0.0;
  }
  else {
    if (puVar15 < (undefined *)0x10800001) {
      if (puVar15 == (undefined *)0x10800000) {
        fVar17 = (float10)fsin((float10)*(double *)(puVar2 + 8));
      }
      else if (puVar15 == (undefined *)0x10100000) {
        fVar17 = -(float10)*(double *)(puVar2 + 8);
      }
      else if (puVar15 == &DAT_10300000) {
        if ((uVar14 == 0) && (*(double *)(puVar2 + 8) == 0.0)) {
LAB_1008dcc1:
          fVar17 = (float10)0;
        }
        else {
          fVar17 = (float10)1 / (float10)*(double *)(puVar2 + 8);
        }
      }
      else if (puVar15 == &DAT_10400000) {
        iVar7 = FUN_100f8c58(*(undefined8 *)(puVar2 + 8));
        if (iVar7 == 0) goto LAB_1008dcc1;
        fVar17 = (float10)FUN_100f6670(*(undefined8 *)(puVar2 + 8));
        fVar17 = (float10)*(double *)(puVar2 + 8) - fVar17;
      }
      else if (puVar15 == &DAT_10500000) {
        fVar17 = (float10)FUN_100f8f20();
      }
      else if (puVar15 == &DAT_10600000) {
        if ((uVar14 == 0) && (*(double *)(puVar2 + 8) == 0.0)) {
          return 0;
        }
        if (*(double *)(puVar2 + 8) < 0.0) goto LAB_1008dcb2;
        fVar17 = (float10)log2((float10)*(double *)(puVar2 + 8));
        fVar5 = (float10)log2((float10)2.0);
        fVar17 = ((float10)0.6931471805599453 * fVar17) / ((float10)0.6931471805599453 * fVar5);
      }
      else {
        if (puVar15 != &DAT_10700000) {
          return 0;
        }
        if ((uVar14 == 0) && (*(double *)(puVar2 + 8) < 0.0)) {
LAB_1008dcb2:
          FUN_1008b0b5();
          goto LAB_1008dcc1;
        }
        fVar17 = (float10)1.0 / SQRT((float10)*(double *)(puVar2 + 8));
      }
    }
    else if (puVar15 == (undefined *)0x10900000) {
      fVar17 = (float10)fcos((float10)*(double *)(puVar2 + 8));
    }
    else if (puVar15 == (undefined *)0x10a00000) {
      if ((uVar14 == 0) && ((*(double *)(puVar2 + 8) < -1.0 || (1.0 < *(double *)(puVar2 + 8)))))
      goto LAB_1008dcb2;
      fVar17 = (float10)FUN_100f8d40();
    }
    else if (puVar15 == (undefined *)0x10b00000) {
      if ((uVar14 == 0) && ((*(double *)(puVar2 + 8) < -1.0 || (1.0 < *(double *)(puVar2 + 8)))))
      goto LAB_1008dcb2;
      fVar17 = (float10)FUN_100f8e10();
    }
    else {
      if (puVar15 != (undefined *)0x10c00000) {
        if ((puVar15 != (undefined *)0x10d00000) && (puVar15 != (undefined *)0x10e00000)) {
          return 0;
        }
        goto LAB_1008dcc1;
      }
      fVar17 = (float10)fpatan((float10)*(double *)(puVar2 + 8),(float10)1);
    }
    dVar18 = (double)fVar17;
  }
LAB_1008e081:
  uVar11 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,dVar18);
LAB_1008e08b:
  puVar1[0xc] = uVar11;
  return 0;
}


