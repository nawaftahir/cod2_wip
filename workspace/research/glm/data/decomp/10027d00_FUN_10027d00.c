// 10027d00 size=573 FUN_10027d00

void FUN_10027d00(float *param_1,int *param_2)

{
  float fVar1;
  int *piVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  int *piVar6;
  int *piVar7;
  float10 fVar8;
  int local_4c;
  undefined4 *local_48;
  int local_40;
  float afStack_3c [4];
  float fStack_2c;
  float fStack_28;
  float afStack_24 [4];
  float fStack_14;
  float fStack_10;
  float local_c;
  float fStack_8;
  float fStack_4;
  
  piVar2 = param_2;
  iVar3 = 0;
  do {
    param_2[iVar3 * 2] = -1;
    param_2[iVar3 * 2 + 1] = 0x4cbebc20;
    iVar3 = iVar3 + 1;
  } while (iVar3 != 0x18);
  local_4c = 0;
  if (0 < DAT_1067850c) {
    local_40 = 0;
    local_48 = &DAT_10678ac8;
    piVar6 = param_2;
    do {
      piVar7 = (int *)(local_40 + DAT_10678510);
      if (((*piVar7 == 0) && ((piVar7[1] & 8U) == 0)) && (uVar4 = piVar7[1] & 0xe00, uVar4 != 0x200)
         ) {
        (*(code *)RI_IsWorker)(*local_48,&local_c,afStack_24 + 3);
        afStack_3c[0] = afStack_24[3] - local_c;
        afStack_3c[1] = fStack_14 - fStack_8;
        afStack_3c[2] = fStack_10 - fStack_4;
        afStack_24[0] = afStack_3c[0] * afStack_3c[0];
        afStack_24[1] = afStack_3c[1] * afStack_3c[1];
        afStack_24[2] = afStack_3c[2] * afStack_3c[2];
        uVar5 = (uint)(afStack_3c[0] * afStack_3c[0] < afStack_3c[1] * afStack_3c[1]);
        if (afStack_24[uVar5] < afStack_24[2]) {
          uVar5 = 2;
        }
        fVar1 = afStack_3c[uVar5];
        if (fVar1 != 0.0) {
          afStack_3c[3] = (float)piVar7[0xf] - *param_1;
          fStack_2c = (float)piVar7[0x10] - param_1[1];
          fStack_28 = (float)piVar7[0x11] - param_1[2];
          fVar8 = (float10)FUN_1010a920();
          param_2 = (int *)((float)fVar8 / fVar1);
          if ((float)param_2 < 1e+08) {
            if (uVar4 == 0x800) {
              param_2 = (int *)0x0;
            }
            else if (uVar4 == 0x600) {
              param_2 = (int *)((float)param_2 * 0.25);
            }
            else if (uVar4 == 0x400) {
              param_2 = (int *)((float)param_2 * 4.0);
            }
            if ((float)param_2 <= (float)piVar6[1]) {
              piVar6[1] = (int)param_2;
              *piVar6 = local_4c;
              iVar3 = 0x17;
              piVar6 = piVar2;
              piVar7 = piVar2;
              do {
                if ((float)piVar6[1] < (float)piVar7[3]) {
                  piVar6 = piVar7 + 2;
                }
                iVar3 = iVar3 + -1;
                piVar7 = piVar7 + 2;
              } while (iVar3 != 0);
            }
          }
        }
      }
      local_4c = local_4c + 1;
      local_40 = local_40 + 0x74;
      local_48 = local_48 + 0xd;
    } while (local_4c < DAT_1067850c);
  }
  return;
}


