// 1004c0e0 size=781 FUN_1004c0e0

void FUN_1004c0e0(int *param_1)

{
  int iVar1;
  ushort *puVar2;
  float *pfVar3;
  ushort *puVar4;
  int iVar5;
  double *pdVar6;
  double *pdVar7;
  int *piVar8;
  int iVar9;
  int *piVar10;
  short *psVar11;
  undefined4 *puVar12;
  code *local_14;
  int local_10;
  int local_c;
  
  local_10 = 0;
  local_14 = (code *)0x0;
  local_c = 0;
  if (0 < param_1[0xb]) {
    piVar10 = (int *)(param_1[0x69] + 0x2c);
    puVar12 = (undefined4 *)(param_1[0x33] + 0x24);
    iVar9 = 0;
    do {
      switch(*puVar12) {
      case 1:
        iVar9 = 0;
        local_14 = (code *)&LAB_10054ce0;
        local_10 = 0;
        break;
      case 2:
        iVar9 = 0;
        local_14 = FUN_10054870;
        local_10 = 0;
        break;
      default:
        *(undefined4 *)(*param_1 + 0x14) = 7;
        *(undefined4 *)(*param_1 + 0x18) = *puVar12;
        (**(code **)*param_1)(param_1);
        break;
      case 4:
        iVar9 = 0;
        local_14 = (code *)&LAB_10054550;
        local_10 = 0;
        break;
      case 8:
        iVar1 = param_1[0x13];
        if (iVar1 == 0) {
          iVar9 = 0;
          local_14 = (code *)&LAB_10054020;
          local_10 = 0;
        }
        else if (iVar1 == 1) {
          iVar9 = 1;
          local_14 = (code *)&LAB_10053c30;
          local_10 = 1;
        }
        else if (iVar1 == 2) {
          iVar9 = 2;
          local_14 = (code *)&LAB_10053800;
          local_10 = 2;
        }
        else {
          *(undefined4 *)(*param_1 + 0x14) = 0x30;
          (**(code **)*param_1)(param_1);
        }
      }
      piVar10[-10] = (int)local_14;
      if (((*(char *)(puVar12 + 3) != '\0') && (*piVar10 != iVar9)) &&
         (puVar2 = (ushort *)puVar12[10], puVar2 != (ushort *)0x0)) {
        *piVar10 = iVar9;
        if (iVar9 == 0) {
          iVar1 = puVar12[0xb];
          iVar5 = 0;
          do {
            *(uint *)(iVar1 + iVar5 * 4) = (uint)puVar2[iVar5];
            iVar5 = iVar5 + 1;
          } while (iVar5 < 0x40);
        }
        else if (iVar9 == 1) {
          piVar8 = (int *)(puVar12[0xb] + 8);
          puVar4 = puVar2 + 2;
          psVar11 = &DAT_10190d2a;
          do {
            piVar8[-2] = (int)((uint)puVar4[-2] * (int)psVar11[-1] + 0x800) >> 0xc;
            piVar8[-1] = (int)((uint)puVar4[-1] * (int)*psVar11 + 0x800) >> 0xc;
            *piVar8 = (int)((int)*(short *)((int)&DAT_10190d28 + -(int)puVar2 + (int)puVar4) *
                            (uint)*puVar4 + 0x800) >> 0xc;
            piVar8[1] = (int)((int)*(short *)((int)&DAT_10190d2a + -(int)puVar2 + (int)puVar4) *
                              (uint)puVar4[1] + 0x800) >> 0xc;
            psVar11 = psVar11 + 4;
            piVar8 = piVar8 + 4;
            puVar4 = puVar4 + 4;
            iVar9 = local_10;
          } while ((int)psVar11 < 0x10190daa);
        }
        else if (iVar9 == 2) {
          pfVar3 = (float *)puVar12[0xb];
          pdVar6 = (double *)&DAT_10190da8;
          do {
            *pfVar3 = (float)*puVar2 * (float)*pdVar6;
            pdVar7 = pdVar6 + 1;
            pfVar3[1] = (float)puVar2[1] * (float)*pdVar6 * 1.3870399;
            pfVar3[2] = (float)puVar2[2] * (float)*pdVar6 * 1.306563;
            pfVar3[3] = (float)puVar2[3] * (float)*pdVar6 * 1.1758755;
            pfVar3[4] = (float)puVar2[4] * (float)*pdVar6;
            pfVar3[5] = (float)puVar2[5] * (float)*pdVar6 * 0.78569496;
            pfVar3[6] = (float)puVar2[6] * (float)*pdVar6 * 0.5411961;
            pfVar3[7] = (float)puVar2[7] * (float)*pdVar6 * 0.27589938;
            puVar2 = puVar2 + 8;
            pfVar3 = pfVar3 + 8;
            pdVar6 = pdVar7;
          } while ((int)pdVar7 < 0x10190de8);
        }
        else {
          *(undefined4 *)(*param_1 + 0x14) = 0x30;
          (**(code **)*param_1)(param_1);
        }
      }
      local_c = local_c + 1;
      piVar10 = piVar10 + 1;
      puVar12 = puVar12 + 0x15;
    } while (local_c < param_1[0xb]);
  }
  return;
}


