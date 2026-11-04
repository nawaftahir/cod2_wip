// 1006541e size=1733 FUN_1006541e

undefined4 FUN_1006541e(int *param_1,int param_2,int param_3)

{
  byte bVar1;
  int iVar2;
  char *pcVar3;
  int *piVar4;
  undefined4 *puVar5;
  int *piVar6;
  int in_ECX;
  int iVar7;
  int iVar8;
  uint uVar9;
  uint uVar10;
  char cVar11;
  uint uVar12;
  byte *pbVar13;
  undefined4 *puVar14;
  int *piVar15;
  char *pcVar16;
  byte *pbVar17;
  undefined4 *puVar18;
  bool bVar19;
  undefined1 local_44 [32];
  int *local_24;
  int local_20;
  int *local_1c;
  int *local_18;
  int *local_14;
  int local_10;
  int local_c;
  int local_8;
  
  local_20 = 0;
  local_10 = 0;
  if (param_2 == 0) {
    piVar6 = &local_10;
    for (; param_3 != 0; param_3 = *(int *)(param_3 + 0xc)) {
      local_8 = in_ECX;
      iVar2 = FUN_1006506e(0x30);
      if (iVar2 == 0) {
        iVar2 = 0;
      }
      else {
        iVar2 = FUN_10082a7b(param_3 + 0x10);
      }
      *piVar6 = iVar2;
      if (iVar2 == 0) {
        return 0;
      }
      piVar6 = (int *)(iVar2 + 0xc);
      in_ECX = local_8;
    }
    *piVar6 = *(int *)(in_ECX + 100);
    *(int *)(in_ECX + 100) = local_10;
  }
  else {
    iVar2 = *(int *)(in_ECX + 100);
    local_8 = in_ECX;
    if (iVar2 == 0) {
      pcVar3 = (char *)**(undefined4 **)(in_ECX + 0x26c);
      pcVar16 = (char *)(*(undefined4 **)(in_ECX + 0x26c))[1];
      if (pcVar3 < pcVar16) {
        do {
          cVar11 = *pcVar3;
          if ((cVar11 != ' ') && ((cVar11 < '\t' || ('\r' < cVar11)))) break;
          pcVar3 = pcVar3 + 1;
        } while (pcVar3 < *(char **)(*(int *)(in_ECX + 0x26c) + 4));
        if ((pcVar3 < pcVar16) && (*pcVar3 != '(')) {
          return 0;
        }
      }
      piVar6 = (int *)(in_ECX + 0x278);
      local_14 = piVar6;
      iVar2 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),piVar6);
      if (iVar2 < 0) {
        return 0;
      }
      if (*piVar6 != 1) {
        return 0;
      }
      local_1c = (int *)(local_8 + 0x280);
      iVar2 = 2;
      bVar19 = true;
      pcVar3 = (char *)local_1c;
      pcVar16 = "(";
      do {
        if (iVar2 == 0) break;
        iVar2 = iVar2 + -1;
        bVar19 = *pcVar3 == *pcVar16;
        pcVar3 = pcVar3 + 1;
        pcVar16 = pcVar16 + 1;
      } while (bVar19);
      if (!bVar19) {
        return 0;
      }
    }
    else {
      local_14 = (int *)(in_ECX + 0x278);
      piVar6 = (int *)(iVar2 + 0x10);
      piVar4 = local_14;
      for (iVar7 = 8; iVar7 != 0; iVar7 = iVar7 + -1) {
        *piVar4 = *piVar6;
        piVar6 = piVar6 + 1;
        piVar4 = piVar4 + 1;
      }
      if (*local_14 != 1) {
        return 0;
      }
      local_1c = (int *)(in_ECX + 0x280);
      iVar7 = 2;
      bVar19 = true;
      pcVar3 = (char *)local_1c;
      pcVar16 = "(";
      do {
        if (iVar7 == 0) break;
        iVar7 = iVar7 + -1;
        bVar19 = *pcVar3 == *pcVar16;
        pcVar3 = pcVar3 + 1;
        pcVar16 = pcVar16 + 1;
      } while (bVar19);
      if (!bVar19) {
        return 0;
      }
      *(undefined4 *)(in_ECX + 100) = *(undefined4 *)(iVar2 + 0xc);
      *(undefined4 *)(iVar2 + 0xc) = 0;
    }
    local_18 = (int *)0x0;
    local_24 = &local_20;
    local_c = 1;
    iVar2 = local_8;
    do {
      piVar6 = local_14;
      iVar7 = *(int *)(iVar2 + 100);
      if (iVar7 == 0) {
        iVar7 = FUN_100686c0(*(undefined4 *)(iVar2 + 0x298),local_14);
        iVar2 = local_8;
        if (iVar7 < 0) {
          return 0;
        }
      }
      else {
        piVar4 = (int *)(iVar7 + 0x10);
        piVar15 = local_14;
        for (iVar8 = 8; iVar8 != 0; iVar8 = iVar8 + -1) {
          *piVar15 = *piVar4;
          piVar4 = piVar4 + 1;
          piVar15 = piVar15 + 1;
        }
        *(undefined4 *)(iVar2 + 100) = *(undefined4 *)(iVar7 + 0xc);
        *(undefined4 *)(iVar7 + 0xc) = 0;
      }
      piVar4 = local_24;
      if (*piVar6 == 0xd) {
        FUN_10067c3e(iVar2 + 0x18,param_1,0x5eb,"unexpected end of file in macro expansion");
        return 0;
      }
      if (*local_24 == 0) {
        iVar2 = FUN_1006506e(0x14);
        if (iVar2 == 0) {
          iVar2 = 0;
        }
        else {
          iVar2 = FUN_10082872(0,0,&DAT_1010c874);
        }
        *piVar4 = iVar2;
        if (iVar2 == 0) {
          return 0;
        }
        local_18 = (int *)(iVar2 + 8);
        iVar2 = local_8;
      }
      if ((((local_c == 1) && (*piVar6 == 1)) &&
          (((char)*local_1c == ',' || ((char)*local_1c == ')')))) &&
         (*(char *)(iVar2 + 0x281) == '\0')) {
        local_24 = (int *)(*piVar4 + 0xc);
      }
      else {
        iVar2 = FUN_1006506e(0x30);
        if (iVar2 == 0) {
          iVar2 = 0;
        }
        else {
          iVar2 = FUN_10082a7b(piVar6);
        }
        *local_18 = iVar2;
        if (iVar2 == 0) {
          return 0;
        }
        local_18 = (int *)(iVar2 + 0xc);
        iVar2 = local_8;
      }
      if ((*piVar6 == 1) && (*(char *)(iVar2 + 0x281) == '\0')) {
        cVar11 = (char)*local_1c;
        if (cVar11 == '(') {
LAB_1006567e:
          local_c = local_c + 1;
        }
        else {
          if (cVar11 != ')') {
            if (cVar11 == '[') goto LAB_1006567e;
            if (cVar11 != ']') {
              if (cVar11 == '{') goto LAB_1006567e;
              if (cVar11 != '}') goto LAB_10065681;
            }
          }
          local_c = local_c + -1;
        }
      }
LAB_10065681:
      iVar8 = local_20;
      iVar7 = param_2;
    } while (local_c != 0);
    do {
      if ((iVar8 == 0) || (*(int *)(iVar8 + 8) == 0)) break;
      iVar7 = *(int *)(iVar7 + 0xc);
      iVar8 = *(int *)(iVar8 + 0xc);
    } while (iVar7 != 0);
    if ((iVar7 != 0) || (iVar8 != 0)) {
      FUN_10067c3e(iVar2 + 0x18,param_1,0x5ec,"not enough actual parameters for macro \'%s\'",
                   *(undefined4 *)((int)param_1 + 8));
      return 0;
    }
    param_1 = &local_10;
    local_c = 0;
    local_14 = (int *)0x0;
    local_1c = (int *)0x0;
    for (local_24 = (int *)param_3; local_24 != (int *)0x0;
        local_24 = *(int **)((int)local_24 + 0xc)) {
      piVar6 = (int *)((int)local_24 + 0x10);
      local_18 = param_1;
      if ((local_c == 0) && (local_14 == (int *)0x0)) {
        if (*piVar6 != 1) {
LAB_1006572b:
          if (*piVar6 == 1) {
            iVar2 = 3;
            bVar19 = true;
            pcVar3 = (char *)((int)local_24 + 0x18);
            pcVar16 = "#@";
            do {
              if (iVar2 == 0) break;
              iVar2 = iVar2 + -1;
              bVar19 = *pcVar3 == *pcVar16;
              pcVar3 = pcVar3 + 1;
              pcVar16 = pcVar16 + 1;
            } while (bVar19);
            if (bVar19) {
              local_14 = (int *)0x1;
              local_1c = piVar6;
              goto LAB_10065947;
            }
          }
          goto LAB_1006574b;
        }
        iVar2 = 2;
        bVar19 = true;
        pcVar3 = (char *)((int)local_24 + 0x18);
        pcVar16 = "#";
        do {
          if (iVar2 == 0) break;
          iVar2 = iVar2 + -1;
          bVar19 = *pcVar3 == *pcVar16;
          pcVar3 = pcVar3 + 1;
          pcVar16 = pcVar16 + 1;
        } while (bVar19);
        if (!bVar19) goto LAB_1006572b;
        local_c = 1;
        local_1c = piVar6;
      }
      else {
LAB_1006574b:
        iVar2 = param_2;
        param_3 = local_20;
        if (*piVar6 == 9) {
          do {
            pbVar17 = *(byte **)((int)local_24 + 0x18);
            pbVar13 = *(byte **)(iVar2 + 0x18);
            do {
              bVar1 = *pbVar13;
              bVar19 = bVar1 < *pbVar17;
              if (bVar1 != *pbVar17) {
LAB_10065785:
                iVar7 = (1 - (uint)bVar19) - (uint)(bVar19 != 0);
                goto LAB_1006578a;
              }
              if (bVar1 == 0) break;
              bVar1 = pbVar13[1];
              bVar19 = bVar1 < pbVar17[1];
              if (bVar1 != pbVar17[1]) goto LAB_10065785;
              pbVar13 = pbVar13 + 2;
              pbVar17 = pbVar17 + 2;
            } while (bVar1 != 0);
            iVar7 = 0;
LAB_1006578a:
            if (iVar7 == 0) break;
            iVar2 = *(int *)(iVar2 + 0xc);
            param_3 = *(int *)(param_3 + 0xc);
          } while (iVar2 != 0);
          if (iVar2 == 0) goto LAB_100657e0;
          for (iVar2 = *(int *)(param_3 + 8); iVar2 != 0; iVar2 = *(int *)(iVar2 + 0xc)) {
            iVar7 = FUN_1006506e(0x30);
            if (iVar7 == 0) {
              iVar7 = 0;
            }
            else {
              iVar7 = FUN_10082a7b(iVar2 + 0x10);
            }
            *param_1 = iVar7;
            if (iVar7 == 0) {
              return 0;
            }
            param_1 = (int *)(iVar7 + 0xc);
          }
        }
        else {
LAB_100657e0:
          iVar2 = FUN_1006506e(0x30);
          if (iVar2 == 0) {
            iVar2 = 0;
          }
          else {
            iVar2 = FUN_10082a7b(piVar6);
          }
          *param_1 = iVar2;
          if (iVar2 == 0) {
            return 0;
          }
          param_1 = (int *)(iVar2 + 0xc);
        }
        if ((local_c != 0) || (local_14 != (int *)0x0)) {
          iVar7 = 0;
          iVar8 = 1;
          for (iVar2 = *local_18; iVar2 != 0; iVar2 = *(int *)(iVar2 + 0xc)) {
            if ((iVar7 != 0) && (iVar7 != *(int *)(iVar2 + 0x28))) {
              iVar8 = iVar8 + 1;
            }
            iVar7 = FUN_1006508a(*(undefined4 *)(iVar2 + 0x28),*(undefined4 *)(iVar2 + 0x2c),0);
            iVar8 = iVar8 + iVar7;
            iVar7 = *(int *)(iVar2 + 0x28) + *(int *)(iVar2 + 0x2c);
          }
          pcVar3 = (char *)FUN_100826bd(iVar8 + 1,1);
          if (pcVar3 == (char *)0x0) {
            return 0;
          }
          iVar8 = 0;
          param_3 = 1;
          cVar11 = ((local_c == 0) - 1U & 0xfb) + 0x27;
          *pcVar3 = cVar11;
          iVar2 = param_3;
          for (iVar7 = *local_18; iVar7 != 0; iVar7 = *(int *)(iVar7 + 0xc)) {
            param_3 = iVar2;
            if ((iVar8 != 0) && (iVar8 != *(int *)(iVar7 + 0x28))) {
              param_3 = iVar2 + 1;
              pcVar3[iVar2] = ' ';
            }
            iVar2 = FUN_1006508a(*(undefined4 *)(iVar7 + 0x28),*(undefined4 *)(iVar7 + 0x2c),
                                 pcVar3 + param_3);
            iVar2 = param_3 + iVar2;
            iVar8 = *(int *)(iVar7 + 0x2c) + *(int *)(iVar7 + 0x28);
          }
          pcVar3[iVar2] = cVar11;
          FUN_10067704();
          iVar7 = local_8;
          iVar2 = FUN_1006771f(pcVar3,iVar2 + 1,local_1c[4],local_1c[5],local_8,local_8 + 0x18);
          if ((iVar2 < 0) ||
             (iVar2 = FUN_100686c0(*(undefined4 *)(iVar7 + 0x298),local_44), iVar2 < 0))
          goto LAB_10065ab6;
          iVar2 = FUN_1006506e(0x30);
          if (iVar2 == 0) {
            iVar2 = 0;
          }
          else {
            iVar2 = FUN_10082a7b(local_44);
          }
          *local_18 = iVar2;
          if (iVar2 == 0) goto LAB_10065ab6;
          local_14 = (int *)0x0;
          local_c = 0;
          param_1 = (int *)(iVar2 + 0xc);
          FUN_1006771e();
        }
      }
LAB_10065947:
      iVar2 = local_8;
    }
    piVar6 = &local_10;
    iVar7 = local_10;
    while (iVar7 != 0) {
      iVar2 = *piVar6;
      iVar7 = *(int *)(iVar2 + 0xc);
      if (iVar7 == 0) {
        local_20 = 0;
      }
      else {
        local_20 = *(int *)(iVar7 + 0xc);
      }
      piVar4 = (int *)(-(uint)(iVar7 != 0) & iVar7 + 0x10U);
      uVar12 = -(uint)(local_20 != 0) & local_20 + 0x10U;
      if (((iVar7 != 0) && (local_20 != 0)) && (*piVar4 == 1)) {
        iVar7 = 3;
        bVar19 = true;
        piVar4 = piVar4 + 2;
        pcVar3 = "##";
        do {
          if (iVar7 == 0) break;
          iVar7 = iVar7 + -1;
          bVar19 = (char)*piVar4 == *pcVar3;
          piVar4 = (int *)((int)piVar4 + 1);
          pcVar3 = pcVar3 + 1;
        } while (bVar19);
        if (bVar19) {
          local_24 = (int *)(*(int *)(iVar2 + 0x2c) + *(int *)(uVar12 + 0x1c));
          puVar5 = (undefined4 *)FUN_100826bd(local_24,1);
          if (puVar5 == (undefined4 *)0x0) {
            return 0;
          }
          uVar10 = *(uint *)(iVar2 + 0x2c);
          puVar14 = *(undefined4 **)(iVar2 + 0x28);
          puVar18 = puVar5;
          for (uVar9 = uVar10 >> 2; uVar9 != 0; uVar9 = uVar9 - 1) {
            *puVar18 = *puVar14;
            puVar14 = puVar14 + 1;
            puVar18 = puVar18 + 1;
          }
          for (uVar10 = uVar10 & 3; uVar10 != 0; uVar10 = uVar10 - 1) {
            *(undefined1 *)puVar18 = *(undefined1 *)puVar14;
            puVar14 = (undefined4 *)((int)puVar14 + 1);
            puVar18 = (undefined4 *)((int)puVar18 + 1);
          }
          uVar10 = *(uint *)(uVar12 + 0x1c);
          puVar14 = *(undefined4 **)(uVar12 + 0x18);
          puVar18 = (undefined4 *)(*(int *)(iVar2 + 0x2c) + (int)puVar5);
          for (uVar9 = uVar10 >> 2; uVar9 != 0; uVar9 = uVar9 - 1) {
            *puVar18 = *puVar14;
            puVar14 = puVar14 + 1;
            puVar18 = puVar18 + 1;
          }
          for (uVar10 = uVar10 & 3; uVar10 != 0; uVar10 = uVar10 - 1) {
            *(undefined1 *)puVar18 = *(undefined1 *)puVar14;
            puVar14 = (undefined4 *)((int)puVar14 + 1);
            puVar18 = (undefined4 *)((int)puVar18 + 1);
          }
          FUN_10067704();
          iVar7 = FUN_1006771f(puVar5,local_24,*(undefined4 *)(iVar2 + 0x20),
                               *(undefined4 *)(iVar2 + 0x24),local_8,local_8 + 0x18);
          if ((iVar7 < 0) ||
             (iVar7 = FUN_100686c0(*(undefined4 *)(local_8 + 0x298),iVar2 + 0x10), iVar7 < 0)) {
LAB_10065ab6:
            FUN_1006771e();
            return 0;
          }
          *(undefined4 *)(iVar2 + 0xc) = *(undefined4 *)(local_20 + 0xc);
          *(undefined4 *)(local_20 + 0xc) = 0;
          FUN_1006771e();
        }
      }
      piVar6 = (int *)(*piVar6 + 0xc);
      iVar2 = local_8;
      iVar7 = *piVar6;
    }
    *piVar6 = *(int *)(iVar2 + 100);
    *(int *)(iVar2 + 100) = local_10;
  }
  return 1;
}


