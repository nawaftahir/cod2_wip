// 1002f430 size=1184 FUN_1002f430

void FUN_1002f430(int param_1,uint *param_2)

{
  int *piVar1;
  bool bVar2;
  bool bVar3;
  bool bVar4;
  uint *in_EAX;
  int iVar5;
  int iVar6;
  int in_ECX;
  int iVar7;
  uint uVar8;
  uint uVar9;
  undefined4 *puVar10;
  undefined4 *puVar11;
  uint uVar12;
  bool bVar13;
  undefined4 uVar14;
  float local_2c;
  uint local_28;
  float local_24;
  uint local_20;
  uint local_1c;
  uint local_18;
  int local_14;
  uint local_10;
  int local_c;
  int local_8;
  
  local_c = param_1;
  local_14 = 0;
  local_10 = 0x1f;
  bVar2 = false;
  bVar3 = true;
  bVar4 = true;
  local_20 = 0x7fe;
  local_28 = 0;
  local_18 = 0xffffffff;
  local_1c = 0;
  local_2c = 0.0;
  local_24 = 3.4028235e+38;
  DAT_1072de40 = (int *)&DAT_1072de48;
  DAT_1072de44 = (undefined *)0x0;
  if (param_2 == (uint *)0x0) {
    iVar5 = 1;
    param_2 = in_EAX;
  }
  else {
    param_2 = in_EAX + in_ECX * 2 + -2;
    iVar5 = -1;
  }
  uVar12 = 0;
  local_8 = in_ECX;
  if (0 < in_ECX) {
    do {
      uVar12 = *param_2;
      if (uVar12 == local_18) {
        if (!bVar2) {
          (*(code *)(&PTR_LAB_101904f8)[*(int *)param_2[1]])((int *)param_2[1]);
        }
      }
      else {
        uVar8 = uVar12 & 0x80000000;
        if (uVar8 == 0) {
          iVar7 = 4;
        }
        else {
          iVar7 = 0x13;
        }
        uVar9 = uVar12 >> iVar7 & 0xfff;
        if (0x7ff < uVar9) {
          uVar9 = 0x7fe;
        }
        if (uVar8 == 0) {
          iVar7 = 0x15;
        }
        else {
          iVar7 = 9;
        }
        iVar7 = (&DAT_101d0b08)[uVar12 >> iVar7 & 0x3ff];
        if (uVar8 == 0) {
          iVar6 = 0x10;
        }
        else {
          iVar6 = 4;
        }
        uVar8 = uVar12 >> iVar6 & 0x1f;
        iVar6 = FUN_1002f330();
        local_18 = uVar12;
        if ((((*(char *)(DAT_101ce7bc + 8) == '\0') && ((*(byte *)(iVar7 + 0x30) & 0x30) != 0)) ||
            (iVar6 == -1)) || (*(int *)(*(int *)(iVar7 + 0x38) + 4 + iVar6 * 4) == 0)) {
          bVar2 = true;
          goto LAB_1002f83f;
        }
        bVar2 = false;
        if (uVar9 == local_20) {
          bVar13 = true;
        }
        else {
          if (((uVar9 == 0x7fe) || (uVar9 == 0x7ff)) ||
             ((&DAT_1019806c)[*(int *)(uVar9 * 0x74 + DAT_1072ddc4)] != '\0')) {
            bVar4 = true;
            if (!bVar3) goto LAB_1002f5c8;
            bVar13 = true;
          }
          else {
            bVar4 = false;
LAB_1002f5c8:
            bVar13 = false;
          }
          if (uVar9 == 0x7fe) {
            local_2c = 0.0;
          }
          else {
            local_2c = *(float *)(uVar9 * 0x74 + 0x5c + DAT_1072ddc4);
          }
        }
        if (((iVar7 != local_14) || (uVar8 != local_10)) ||
           ((iVar6 != local_c || ((local_2c != local_24 || (!bVar13)))))) {
          if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
            FUN_1003a8d0();
          }
          if (local_2c != local_24) {
            FUN_1002f2a0(DAT_1072ddbc - local_2c);
          }
          FUN_1003a5f0(uVar8);
          local_24 = local_2c;
          local_14 = iVar7;
          local_10 = uVar8;
          local_c = iVar6;
        }
        if (uVar9 != local_20) {
          if ((uVar9 == 0x7fe) || (uVar9 == 0x7ff)) {
            DAT_1072de40 = (int *)&DAT_1072de48;
LAB_1002f6ca:
            DAT_1072de44 = (undefined *)0x0;
          }
          else {
            DAT_1072de40 = (int *)(uVar9 * 0x74 + DAT_1072ddc4);
            if (1 < *DAT_1072de40) goto LAB_1002f6ca;
            DAT_1072de44 = &DAT_107305e8 + uVar9 * 0x68;
          }
          local_20 = uVar9;
          if (bVar4) {
            if (!bVar3) {
              FUN_1003e4b0();
            }
            bVar3 = bVar4;
            if (local_28 != 0) {
              FUN_1003e800(0,0x3f800000);
              local_28 = 0;
            }
            goto LAB_1002f829;
          }
          if (bVar3) {
            puVar10 = (undefined4 *)(&DAT_1072dee0 + DAT_10730550 * 0xcd0);
            puVar11 = (undefined4 *)(&DAT_1072ebb0 + DAT_10730550 * 0xcd0);
            for (iVar7 = 0x334; iVar7 != 0; iVar7 = iVar7 + -1) {
              *puVar11 = *puVar10;
              puVar10 = puVar10 + 1;
              puVar11 = puVar11 + 1;
            }
            DAT_10730550 = DAT_10730550 + 1;
          }
          piVar1 = DAT_1072de40 + 0xe;
          FUN_1005a3a0(DAT_1072de40[0xe]);
          FUN_1003de30(*piVar1);
          local_1c = DAT_1072de40[1] & 0x18;
          bVar3 = bVar4;
          if (local_28 == local_1c) goto LAB_1002f829;
          if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
            FUN_1002df40();
          }
                    /* WARNING: Could not find normalized switch variable to match jumptable */
          switch(local_1c) {
          case 0:
            uVar14 = 0x3f800000;
            break;
          default:
            goto switchD_1002f7b4_caseD_1;
          case 8:
            FUN_1003e250(*(undefined4 *)(DAT_1072ddc8 + 0x148));
            uVar14 = 0x3e4ccccd;
            break;
          case 0x10:
          case 0x18:
            uVar14 = 0x3f000000;
          }
          FUN_1003e800(0,uVar14);
switchD_1002f7b4_caseD_1:
                    /* WARNING: This code block may not be properly labeled as switch case */
          bVar13 = local_28 == 8;
          local_28 = local_1c;
          if (bVar13) {
            *(float *)(&DAT_1072e258 + DAT_10730550 * 0xcd0) = --*(float *)(DAT_1072ddc8 + 0xc0);
            FUN_1003e130();
          }
        }
LAB_1002f829:
        (*(code *)(&PTR_LAB_101904f8)[*(int *)param_2[1]])((int *)param_2[1]);
      }
LAB_1002f83f:
      param_2 = param_2 + iVar5 * 2;
      local_8 = local_8 + -1;
      uVar12 = local_1c;
    } while (local_8 != 0);
  }
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  if ((uVar12 != 0) && (FUN_1003e800(0,0x3f800000), uVar12 == 8)) {
    *(float *)(&DAT_1072e258 + DAT_10730550 * 0xcd0) = --*(float *)(DAT_1072ddc8 + 0xc0);
    FUN_1003e130();
  }
  if (!bVar3) {
    FUN_1003e4b0();
  }
  DAT_1072de40 = (int *)0x0;
  DAT_1072de44 = (undefined *)0x0;
  return;
}


