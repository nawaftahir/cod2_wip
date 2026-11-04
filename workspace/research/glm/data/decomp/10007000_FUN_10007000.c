// 10007000 size=1065 FUN_10007000

int FUN_10007000(int param_1,int param_2,int param_3,int param_4)

{
  int *piVar1;
  float fVar2;
  float fVar3;
  undefined4 *puVar4;
  float *in_ECX;
  float *pfVar5;
  float *in_EDX;
  int iVar6;
  int *piVar7;
  float *pfVar8;
  int iVar9;
  int local_80;
  float local_6c [12];
  float local_3c [9];
  float local_18;
  float local_14;
  float local_10;
  float local_c;
  float local_8;
  float local_4;
  
  fVar2 = *in_EDX;
  fVar3 = in_ECX[1];
  local_3c[2] = 1.0 / (fVar2 * DAT_101ce5bc[3] + fVar3 * DAT_101ce5bc[7] + DAT_101ce5bc[0xf]);
  local_3c[0] = (fVar2 * *DAT_101ce5bc + fVar3 * DAT_101ce5bc[4] + DAT_101ce5bc[0xc]) * local_3c[2];
  local_3c[1] = (fVar2 * DAT_101ce5bc[1] + fVar3 * DAT_101ce5bc[5] + DAT_101ce5bc[0xd]) *
                local_3c[2];
  local_3c[2] = local_3c[2] *
                (fVar2 * DAT_101ce5bc[2] + fVar3 * DAT_101ce5bc[6] + DAT_101ce5bc[0xe]);
  fVar2 = *in_EDX;
  fVar3 = in_EDX[1];
  local_3c[5] = 1.0 / (fVar2 * DAT_101ce5bc[3] + fVar3 * DAT_101ce5bc[7] + DAT_101ce5bc[0xf]);
  local_3c[3] = (fVar2 * *DAT_101ce5bc + fVar3 * DAT_101ce5bc[4] + DAT_101ce5bc[0xc]) * local_3c[5];
  local_3c[4] = (fVar2 * DAT_101ce5bc[1] + fVar3 * DAT_101ce5bc[5] + DAT_101ce5bc[0xd]) *
                local_3c[5];
  local_3c[5] = local_3c[5] *
                (fVar2 * DAT_101ce5bc[2] + fVar3 * DAT_101ce5bc[6] + DAT_101ce5bc[0xe]);
  fVar2 = *in_ECX;
  fVar3 = in_EDX[1];
  local_3c[8] = 1.0 / (fVar2 * DAT_101ce5bc[3] + fVar3 * DAT_101ce5bc[7] + DAT_101ce5bc[0xf]);
  local_3c[6] = (fVar2 * *DAT_101ce5bc + fVar3 * DAT_101ce5bc[4] + DAT_101ce5bc[0xc]) * local_3c[8];
  local_3c[7] = (fVar2 * DAT_101ce5bc[1] + fVar3 * DAT_101ce5bc[5] + DAT_101ce5bc[0xd]) *
                local_3c[8];
  local_3c[8] = local_3c[8] *
                (fVar2 * DAT_101ce5bc[2] + fVar3 * DAT_101ce5bc[6] + DAT_101ce5bc[0xe]);
  fVar2 = *in_ECX;
  fVar3 = in_ECX[1];
  local_10 = 1.0 / (fVar2 * DAT_101ce5bc[3] + fVar3 * DAT_101ce5bc[7] + DAT_101ce5bc[0xf]);
  local_18 = (fVar2 * *DAT_101ce5bc + fVar3 * DAT_101ce5bc[4] + DAT_101ce5bc[0xc]) * local_10;
  local_14 = (fVar2 * DAT_101ce5bc[1] + fVar3 * DAT_101ce5bc[5] + DAT_101ce5bc[0xd]) * local_10;
  local_10 = local_10 * (fVar2 * DAT_101ce5bc[2] + fVar3 * DAT_101ce5bc[6] + DAT_101ce5bc[0xe]);
  local_c = local_3c[0];
  local_8 = local_3c[1];
  local_4 = local_3c[2];
  FUN_10005ee0(4,local_6c);
  pfVar8 = (float *)(param_1 + 4);
  local_80 = 0;
  iVar9 = 0;
  do {
    fVar2 = *(float *)((int)local_6c + iVar9 + 4);
    pfVar8[-1] = *(float *)((int)local_6c + iVar9);
    pfVar8[1] = *(float *)((int)local_6c + iVar9 + 8);
    *pfVar8 = fVar2;
    if (param_4 == 0) {
      iVar6 = 0;
      if (0 < param_2) {
        pfVar5 = (float *)(param_3 + 4);
        do {
          if (*(float *)(DAT_101ce6a0 + 8) <
              *pfVar5 * *pfVar8 + pfVar5[1] * pfVar8[1] + pfVar5[-1] * pfVar8[-1]) {
            if ((*(byte *)(DAT_101ce6e0 + 8) & 2) != 0) {
              piVar1 = (int *)(DAT_101da9c8 + 0x249d4c);
              if (*(int *)(DAT_101da9c8 + 0x249d4c) + 1 <= *(int *)(DAT_101da9c8 + 0x249d50)) {
                piVar7 = (int *)(DAT_101da9c8 + 0x249d48);
                if (*(int *)(DAT_101da9c8 + 0x249d48) == 0) {
                  iVar6 = (*(code *)RI_Z_MallocInternal)(*(int *)(DAT_101da9c8 + 0x249d50) * 0x2c);
                  *piVar7 = iVar6;
                }
                puVar4 = (undefined4 *)(*piVar1 * 0x2c + *piVar7);
                *puVar4 = *(undefined4 *)((int)local_3c + iVar9);
                puVar4[1] = *(undefined4 *)((int)local_3c + iVar9 + 4);
                puVar4[2] = *(undefined4 *)((int)local_3c + iVar9 + 8);
                puVar4[3] = *(undefined4 *)((int)local_3c + iVar9 + 0xc);
                puVar4[4] = *(undefined4 *)((int)local_3c + iVar9 + 0x10);
                puVar4[5] = *(undefined4 *)((int)local_3c + iVar9 + 0x14);
                puVar4[6] = 0;
                puVar4[7] = 0x3f000000;
                puVar4[8] = 0x3f000000;
                puVar4[9] = 0x3f800000;
                puVar4[10] = 0;
                *piVar1 = *piVar1 + 1;
              }
            }
            goto LAB_10007371;
          }
          iVar6 = iVar6 + 1;
          pfVar5 = pfVar5 + 3;
        } while (iVar6 < param_2);
      }
    }
    if (*(int *)(DAT_101ce6e0 + 8) != 0) {
      piVar1 = (int *)(DAT_101da9c8 + 0x249d4c);
      if (*(int *)(DAT_101da9c8 + 0x249d4c) + 1 <= *(int *)(DAT_101da9c8 + 0x249d50)) {
        piVar7 = (int *)(DAT_101da9c8 + 0x249d48);
        if (*(int *)(DAT_101da9c8 + 0x249d48) == 0) {
          iVar6 = (*(code *)RI_Z_MallocInternal)(*(int *)(DAT_101da9c8 + 0x249d50) * 0x2c);
          *piVar7 = iVar6;
        }
        puVar4 = (undefined4 *)(*piVar1 * 0x2c + *piVar7);
        *puVar4 = *(undefined4 *)((int)local_3c + iVar9);
        puVar4[1] = *(undefined4 *)((int)local_3c + iVar9 + 4);
        puVar4[2] = *(undefined4 *)((int)local_3c + iVar9 + 8);
        puVar4[3] = *(undefined4 *)((int)local_3c + iVar9 + 0xc);
        puVar4[4] = *(undefined4 *)((int)local_3c + iVar9 + 0x10);
        puVar4[5] = *(undefined4 *)((int)local_3c + iVar9 + 0x14);
        puVar4[6] = 0;
        puVar4[7] = 0x3f400000;
        puVar4[8] = 0x3f400000;
        puVar4[9] = 0x3f800000;
        puVar4[10] = 0;
        *piVar1 = *piVar1 + 1;
      }
    }
    pfVar8[2] = 0.001 - (*(float *)((int)local_3c + iVar9 + 4) * *pfVar8 +
                        *(float *)((int)local_3c + iVar9) * pfVar8[-1] +
                        *(float *)((int)local_3c + iVar9 + 8) * pfVar8[1]);
    *(byte *)(pfVar8 + 3) = ((int)pfVar8[-1] < 1) - 1U & 0xc;
    *(byte *)((int)pfVar8 + 0xd) = (((int)*pfVar8 < 1) - 1U & 0xc) + 4;
    *(byte *)((int)pfVar8 + 0xe) = (((int)pfVar8[1] < 1) - 1U & 0xc) + 8;
    local_80 = local_80 + 1;
    *(undefined1 *)((int)pfVar8 + 0xf) = 0xff;
    pfVar8 = pfVar8 + 5;
LAB_10007371:
    iVar9 = iVar9 + 0xc;
    if (0x2f < iVar9) {
      return local_80;
    }
  } while( true );
}


