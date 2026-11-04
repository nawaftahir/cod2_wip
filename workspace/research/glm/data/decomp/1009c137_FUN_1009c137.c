// 1009c137 size=1169 FUN_1009c137

int FUN_1009c137(int *param_1,char *param_2)

{
  int iVar1;
  byte bVar2;
  char cVar3;
  char cVar4;
  int *piVar5;
  int *piVar6;
  int iVar7;
  char *pcVar8;
  int iVar9;
  byte *pbVar10;
  int iVar11;
  char *pcVar12;
  int iVar13;
  undefined4 in_ECX;
  int iVar14;
  char *pcVar15;
  byte *pbVar16;
  uint uVar17;
  int *piVar18;
  int *piVar19;
  bool bVar20;
  int *local_1c;
  int local_14;
  uint local_10;
  int local_c;
  char *local_8;
  
  iVar7 = (int)param_2;
  if (param_2 == (char *)0x0) {
    return 0;
  }
  if (*(int *)((int)param_2 + 4) != 3) {
    return 0;
  }
  if (param_1 == (int *)0x0) {
    return 0;
  }
  if (param_1[1] != 0xd) {
    return 0;
  }
  iVar11 = param_1[4];
  iVar1 = (int)param_2 + 0x10;
  iVar9 = FUN_1006506e(0x50);
  if (iVar9 == 0) {
    local_c = 0;
  }
  else {
    local_c = FUN_10083255(0,0x17,0,0,1,iVar1);
  }
  if (local_c == 0) {
    return 0;
  }
  if (iVar11 != 0) {
    if (*(int *)(iVar11 + 4) == 1) {
      param_2 = (char *)0x0;
      do {
        iVar9 = *(int *)(iVar11 + 8);
        if ((iVar9 != 0) && (*(int *)(iVar9 + 4) == 6)) {
          iVar13 = *(int *)(iVar9 + 0x18);
          pbVar16 = *(byte **)(*(int *)(iVar9 + 0x14) + 0x18);
          pbVar10 = *(byte **)(iVar7 + 0x18);
          do {
            bVar2 = *pbVar10;
            bVar20 = bVar2 < *pbVar16;
            if (bVar2 != *pbVar16) {
LAB_1009c1f9:
              iVar9 = (1 - (uint)bVar20) - (uint)(bVar20 != 0);
              goto LAB_1009c1fe;
            }
            if (bVar2 == 0) break;
            bVar2 = pbVar10[1];
            bVar20 = bVar2 < pbVar16[1];
            if (bVar2 != pbVar16[1]) goto LAB_1009c1f9;
            pbVar10 = pbVar10 + 2;
            pbVar16 = pbVar16 + 2;
          } while (bVar2 != 0);
          iVar9 = 0;
LAB_1009c1fe:
          if (iVar9 == 0) {
            if (*(int *)(iVar13 + 0x20) != 0) {
              iVar11 = (**(code **)(**(int **)(iVar13 + 0x20) + 4))();
              *(int *)(local_c + 0x10) = iVar11;
              if (iVar11 == 0) {
                return 0;
              }
            }
            iVar11 = FUN_1006506e(0x40);
            if (iVar11 == 0) {
              iVar11 = 0;
            }
            else {
              iVar11 = FUN_100833a3(2,param_2,iVar1);
            }
            *(int *)(local_c + 0x24) = iVar11;
            goto LAB_1009c59a;
          }
          iVar9 = FUN_10099b4f(*(undefined4 *)(iVar13 + 0x20));
          param_2 = (char *)((int)param_2 + iVar9);
        }
        iVar11 = *(int *)(iVar11 + 0xc);
      } while (iVar11 != 0);
    }
    else if (*(int *)(iVar11 + 4) == 9) {
      piVar5 = *(int **)(iVar11 + 0x18);
      pcVar15 = *(char **)((int)param_2 + 0x18);
      piVar6 = *(int **)(iVar11 + 0x1c);
      uVar17 = *(uint *)(iVar11 + 0x20) & 0x200;
      pcVar8 = pcVar15;
      do {
        pcVar12 = pcVar8;
        pcVar8 = pcVar12 + 1;
      } while (*pcVar12 != '\0');
      cVar3 = *pcVar15;
      if (cVar3 == '_') {
        if (*(int *)(iVar11 + 0x10) != 2) goto LAB_1009c21f;
        if ((pcVar12 <= pcVar15 + 1) || (local_14 = 3, pcVar15[1] != 'm')) {
          local_14 = 2;
        }
      }
      else {
        if (cVar3 < 'a') goto LAB_1009c21f;
        if (((cVar3 < 'c') || (cVar3 == 'g')) || (cVar3 == 'r')) {
          if ((*(int *)(iVar11 + 0x10) != 0) && (*(int *)(iVar11 + 0x10) != 1)) goto LAB_1009c21f;
          local_14 = 1;
        }
        else {
          if (((cVar3 < 'w') || ('z' < cVar3)) ||
             ((*(int *)(iVar11 + 0x10) != 0 && (*(int *)(iVar11 + 0x10) != 1)))) goto LAB_1009c21f;
          local_14 = 0;
        }
      }
      local_10 = 0;
      local_1c = (int *)(local_c + 0x24);
      if (pcVar15 < pcVar12) {
        param_2 = pcVar15 + 2;
        local_8 = pcVar15 + 3;
        piVar18 = param_1;
        piVar19 = param_1;
        do {
          if (3 < local_10) break;
          if (local_14 == 0) {
            cVar3 = *pcVar15;
            if (cVar3 == 'w') {
LAB_1009c47a:
              piVar19 = (int *)0x3;
            }
            else if (cVar3 == 'x') {
LAB_1009c458:
              piVar19 = (int *)0x0;
            }
            else {
              if (cVar3 != 'y') {
                if (cVar3 == 'z') goto LAB_1009c476;
                goto LAB_1009c21f;
              }
LAB_1009c45c:
              piVar19 = (int *)0x1;
            }
LAB_1009c47d:
            piVar18 = (int *)0x0;
            pcVar15 = pcVar15 + 1;
            local_8 = local_8 + 1;
            param_2 = param_2 + 1;
          }
          else {
            if (local_14 == 1) {
              cVar3 = *pcVar15;
              if (cVar3 == 'a') goto LAB_1009c47a;
              if (cVar3 == 'b') {
LAB_1009c476:
                piVar19 = (int *)0x2;
                goto LAB_1009c47d;
              }
              if (cVar3 == 'g') goto LAB_1009c45c;
              if (cVar3 == 'r') goto LAB_1009c458;
              goto LAB_1009c21f;
            }
            if (local_14 == 2) {
              if (((((pcVar12 <= param_2) || (*pcVar15 != '_')) || (cVar3 = pcVar15[1], cVar3 < '1')
                   ) || (('9' < cVar3 || (cVar4 = *param_2, cVar4 < '1')))) || ('9' < cVar4))
              goto LAB_1009c21f;
              local_8 = local_8 + 3;
              piVar18 = (int *)(cVar3 + -0x31);
              piVar19 = (int *)(cVar4 + -0x31);
              pcVar15 = pcVar15 + 3;
              param_2 = param_2 + 3;
            }
            else if (local_14 == 3) {
              if ((((pcVar12 <= local_8) || (*pcVar15 != '_')) ||
                  ((pcVar15[1] != 'm' ||
                   (((cVar3 = *param_2, cVar3 < '0' || ('9' < cVar3)) ||
                    (cVar4 = *local_8, cVar4 < '0')))))) || ('9' < cVar4)) goto LAB_1009c21f;
              local_8 = local_8 + 4;
              piVar18 = (int *)(cVar3 + -0x30);
              piVar19 = (int *)(cVar4 + -0x30);
              pcVar15 = pcVar15 + 4;
              param_2 = param_2 + 4;
            }
          }
          if ((piVar5 <= piVar18) || (piVar6 <= piVar19)) goto LAB_1009c21f;
          iVar9 = FUN_1006506e(0x14);
          if (iVar9 == 0) {
            iVar9 = 0;
          }
          else {
            iVar9 = FUN_10082872(0,0,"Swizzle");
          }
          *local_1c = iVar9;
          if (iVar9 == 0) {
            return 0;
          }
          iVar9 = FUN_1006506e(0x40);
          if (iVar9 == 0) {
            iVar9 = 0;
          }
          else {
            iVar9 = FUN_100833a3(2,(int *)((int)piVar18 * (int)piVar6 + (int)piVar19),iVar1);
          }
          *(int *)(*local_1c + 8) = iVar9;
          if (iVar9 == 0) {
            return 0;
          }
          local_1c = (int *)(*local_1c + 0xc);
          local_10 = local_10 + 1;
        } while (pcVar15 < pcVar12);
        if ((pcVar15 < pcVar12) || (4 < local_10)) goto LAB_1009c21f;
      }
      iVar9 = *(int *)(local_c + 0x24);
      do {
        iVar13 = iVar9;
        if ((iVar13 == 0) || (uVar17 != 0)) goto LAB_1009c561;
        iVar9 = *(int *)(iVar13 + 0xc);
        if (iVar9 != 0) {
          iVar14 = iVar9;
          do {
            if (*(int *)(*(int *)(iVar13 + 8) + 0x18) == *(int *)(*(int *)(iVar14 + 8) + 0x18)) {
              uVar17 = 1;
              break;
            }
            iVar14 = *(int *)(iVar14 + 0xc);
          } while (iVar14 != 0);
        }
      } while( true );
    }
  }
  goto LAB_1009c21f;
LAB_1009c561:
  iVar9 = FUN_1006506e(0x24);
  if (iVar9 == 0) {
    iVar11 = 0;
  }
  else {
    iVar11 = FUN_10082e36(local_10 != 1,*(undefined4 *)(iVar11 + 0x14),1,local_10,
                          -(uint)(uVar17 != 0) & 0x200);
  }
  *(int *)(local_c + 0x10) = iVar11;
LAB_1009c59a:
  if (iVar11 == 0) {
    return 0;
  }
  iVar11 = (**(code **)(*param_1 + 4))();
  *(int *)(local_c + 0x20) = iVar11;
  if (iVar11 != 0) {
    FUN_1009a568(local_c);
    return local_c;
  }
LAB_1009c21f:
  FUN_100994dd(in_ECX,iVar1,0xbca,"invalid subscript \'%s\'",*(undefined4 *)(iVar7 + 0x18));
  return 0;
}


