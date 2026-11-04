// 10015ba0 size=1686 R_SetViewport

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

int R_SetViewport(float *param_1,float *param_2,float *param_3,float param_4,int param_5,int param_6
                 ,int param_7,int param_8,undefined4 param_9)

{
  uint uVar1;
  ushort *puVar2;
  undefined4 *puVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  int iVar10;
  uint uVar11;
  int iVar12;
  float *pfVar13;
  int iVar14;
  uint uVar15;
  int iVar16;
  float *pfVar17;
  int iVar18;
  int local_4310;
  undefined4 *local_430c;
  int local_42fc;
  int *local_42f8;
  int local_42e4;
  int local_42e0;
  float local_42dc;
  int local_42d8;
  float local_42d4;
  float local_42d0;
  float local_42cc;
  float local_42c8;
  float local_42c4;
  float local_42c0;
  int local_42bc;
  float local_42b8 [12];
  float local_4288;
  float local_4284;
  float local_4280;
  float local_427c;
  float local_4278;
  float local_4274;
  float local_4270 [4];
  float local_4260;
  float local_425c;
  undefined1 local_4258 [12];
  undefined1 local_424c [12];
  undefined4 local_4240;
  undefined4 local_423c;
  undefined4 local_4238;
  undefined4 local_4234;
  undefined4 local_4230;
  undefined4 local_422c;
  undefined4 local_4228;
  undefined4 local_4224;
  undefined4 local_4220;
  undefined4 local_421c;
  undefined4 local_4218;
  undefined4 local_4214;
  undefined4 local_4210;
  undefined4 local_420c;
  undefined4 local_4208;
  undefined4 local_4204;
  undefined4 local_4200;
  undefined4 local_41fc;
  undefined4 local_41f8;
  undefined4 local_41f4;
  undefined4 local_41f0;
  undefined4 local_41ec;
  undefined4 local_41e8;
  undefined4 local_41e4;
  int local_4000 [4095];
  undefined4 uStack_4;
  
  uStack_4 = 0x10015baa;
  FUN_10015a20(param_1,param_4);
  DAT_101d4d20 = DAT_101d4d20 + 1;
  local_42e0 = 0;
  FUN_10015740(*(undefined4 *)(DAT_101d1b9c + 0xc),local_4258,local_424c,local_4000,0x1000,
               &local_42e0);
  iVar10 = (int)local_42b8 - (int)param_1;
  pfVar17 = param_1 + 1;
  uVar15 = 0;
  pfVar13 = local_42b8;
  do {
    uVar1 = uVar15 + 1;
    uVar11 = uVar1 & 0x80000003;
    if ((int)uVar11 < 0) {
      uVar11 = (uVar11 - 1 | 0xfffffffc) + 1;
    }
    fVar4 = param_1[uVar11 * 3];
    fVar5 = pfVar17[-1];
    fVar6 = param_1[uVar11 * 3 + 1];
    fVar7 = *pfVar17;
    fVar8 = param_1[uVar11 * 3 + 2];
    fVar9 = pfVar17[1];
    *pfVar13 = (fVar6 - fVar7) * param_3[2] - (fVar8 - fVar9) * param_3[1];
    *(float *)(iVar10 + (int)pfVar17) = (fVar8 - fVar9) * *param_3 - (fVar4 - fVar5) * param_3[2];
    *(float *)((int)local_42b8 + -(int)param_1 + 4 + (int)pfVar17) =
         (fVar4 - fVar5) * param_3[1] - (fVar6 - fVar7) * *param_3;
    FUN_100590b0();
    local_4270[uVar15] =
         pfVar17[-1] * *pfVar13 +
         *(float *)((int)&local_42c0 + -(int)param_1 + (int)(pfVar17 + 3)) * pfVar17[1] +
         *pfVar17 * *(float *)(iVar10 + (int)pfVar17);
    pfVar17 = pfVar17 + 3;
    uVar15 = uVar1;
    pfVar13 = pfVar13 + 3;
  } while ((int)uVar1 < 4);
  local_4288 = *param_3;
  local_4284 = param_3[1];
  local_4280 = param_3[2];
  local_4260 = (local_4288 * *param_1 + local_4280 * param_1[2] + local_4284 * param_1[1]) - param_4
  ;
  local_427c = -*param_3;
  local_4278 = -param_3[1];
  local_4274 = -param_3[2];
  iVar10 = 0;
  local_42e4 = 0;
  local_4310 = 0;
  local_42fc = 0;
  local_425c = (local_427c * *param_1 + local_4278 * param_1[1] + local_4274 * param_1[2]) - param_4
  ;
  local_42dc = 0.5 / param_4;
  if (0 < local_42e0) {
    local_42f8 = local_4000;
    do {
      if ((*(byte *)(*(int *)*local_42f8 + 0x30) & 0x30) == 0) {
        iVar18 = ((int *)*local_42f8)[2];
        iVar16 = *(int *)(iVar18 + 0x1c) * 0x44 + *(int *)(DAT_101d1b9c + 0x2c);
        local_42d8 = 0;
        if (*(short *)(iVar18 + 0x22) != 0) {
          local_430c = (undefined4 *)(param_8 + iVar10 * 0xc);
          local_42bc = iVar18;
          do {
            puVar2 = (ushort *)(*(int *)(iVar18 + 0x24) + local_42d8 * 2);
            iVar12 = (uint)puVar2[1] * 0x44;
            iVar14 = (uint)*puVar2 * 0x44;
            fVar4 = *(float *)(iVar14 + iVar16) - *(float *)(iVar12 + iVar16);
            fVar5 = *(float *)(iVar14 + 4 + iVar16) - *(float *)(iVar12 + 4 + iVar16);
            iVar10 = local_42d8 * 2 + 4;
            fVar6 = *(float *)(iVar14 + iVar16 + 8) - *(float *)(iVar12 + iVar16 + 8);
            iVar12 = (uint)*(ushort *)(*(int *)(iVar18 + 0x24) + 2 + local_42d8 * 2) * 0x44;
            iVar14 = (uint)*(ushort *)(iVar10 + *(int *)(iVar18 + 0x24)) * 0x44;
            local_42c8 = *(float *)(iVar14 + iVar16) - *(float *)(iVar12 + iVar16);
            local_42c4 = *(float *)(iVar14 + 4 + iVar16) - *(float *)(iVar12 + 4 + iVar16);
            local_42c0 = *(float *)(iVar14 + iVar16 + 8) - *(float *)(iVar12 + iVar16 + 8);
            fVar7 = local_42c0 * fVar5 - local_42c4 * fVar6;
            fVar6 = fVar6 * local_42c8 - local_42c0 * fVar4;
            fVar4 = local_42c4 * fVar4 - fVar5 * local_42c8;
            fVar5 = fVar7 * *param_3 + fVar6 * param_3[1] + fVar4 * param_3[2];
            if ((0.0 <= fVar5) &&
               ((fVar7 * fVar7 + fVar6 * fVar6 + fVar4 * fVar4) * 0.25 <= fVar5 * fVar5)) {
              iVar18 = *(int *)(iVar18 + 0x24);
              iVar12 = (uint)*(ushort *)(iVar18 + local_42d8 * 2) * 0x44;
              local_4240 = *(undefined4 *)(iVar12 + iVar16);
              iVar12 = iVar12 + iVar16;
              iVar10 = (uint)*(ushort *)(iVar10 + iVar18) * 0x44;
              local_423c = *(undefined4 *)(iVar12 + 4);
              local_4238 = *(undefined4 *)(iVar12 + 8);
              local_4234 = *(undefined4 *)(iVar12 + 0x24);
              local_4230 = *(undefined4 *)(iVar12 + 0x28);
              local_422c = *(undefined4 *)(iVar12 + 0xc);
              local_4228 = *(undefined4 *)(iVar12 + 0x10);
              local_4224 = *(undefined4 *)(iVar12 + 0x14);
              puVar3 = (undefined4 *)
                       ((uint)*(ushort *)(iVar18 + 2 + local_42d8 * 2) * 0x44 + iVar16);
              local_4220 = *puVar3;
              local_421c = puVar3[1];
              local_4218 = puVar3[2];
              local_4214 = puVar3[9];
              local_4210 = puVar3[10];
              local_420c = puVar3[3];
              local_4208 = puVar3[4];
              local_4204 = puVar3[5];
              local_4200 = *(undefined4 *)(iVar10 + iVar16);
              iVar10 = iVar10 + iVar16;
              local_41fc = *(undefined4 *)(iVar10 + 4);
              local_41f8 = *(undefined4 *)(iVar10 + 8);
              local_41f4 = *(undefined4 *)(iVar10 + 0x24);
              local_41f0 = *(undefined4 *)(iVar10 + 0x28);
              local_41ec = *(undefined4 *)(iVar10 + 0xc);
              local_41e8 = *(undefined4 *)(iVar10 + 0x10);
              local_41e4 = *(undefined4 *)(iVar10 + 0x14);
              pfVar17 = (float *)(local_42e4 * 0x44 + param_6);
              iVar10 = FUN_10015830(local_42b8,local_4270,param_5 - local_42e4,pfVar17,local_430c);
              iVar18 = local_42bc;
              if (-1 < iVar10) {
                iVar10 = 0;
                if (*(char *)((int)local_430c + 6) != '\0') {
                  pfVar13 = pfVar17 + 5;
                  do {
                    local_42d4 = *pfVar17 - *param_2;
                    iVar10 = iVar10 + 1;
                    pfVar17 = pfVar17 + 0x11;
                    local_42d0 = pfVar13[-4] - param_2[1];
                    local_42cc = pfVar13[-3] - param_2[2];
                    pfVar13[2] = (local_42d4 * param_3[3] +
                                 local_42d0 * param_3[4] + local_42cc * param_3[5]) * local_42dc +
                                 0.5;
                    pfVar13[3] = (local_42d0 * param_3[7] +
                                 local_42cc * param_3[8] + local_42d4 * param_3[6]) * local_42dc +
                                 0.5;
                    pfVar13[6] = pfVar13[-1] * param_3[5] - *pfVar13 * param_3[4];
                    pfVar13[7] = param_3[3] * *pfVar13 - param_3[5] * pfVar13[-2];
                    pfVar13[8] = param_3[4] * pfVar13[-2] - pfVar13[-1] * param_3[3];
                    pfVar13[9] = pfVar13[7] * *pfVar13 - pfVar13[-1] * pfVar13[8];
                    pfVar13[10] = pfVar13[8] * pfVar13[-2] - *pfVar13 * pfVar13[6];
                    pfVar13[0xb] = pfVar13[-1] * pfVar13[6] - pfVar13[7] * pfVar13[-2];
                    pfVar13 = pfVar13 + 0x11;
                  } while (iVar10 < (int)(uint)*(byte *)((int)local_430c + 6));
                }
                *local_430c = param_9;
                *(undefined2 *)(local_430c + 1) = *(undefined2 *)(*local_42f8 + 4);
                local_430c[2] = local_42e4;
                local_42e4 = local_42e4 + (uint)*(byte *)((int)local_430c + 6);
                local_430c = local_430c + 3;
                local_4310 = local_4310 + 1;
                if (local_4310 == param_7) {
                  return local_4310;
                }
                if (param_5 + -3 < local_42e4) {
                  return local_4310;
                }
              }
            }
            local_42d8 = local_42d8 + 3;
            iVar10 = local_4310;
          } while (local_42d8 < (int)(uint)*(ushort *)(iVar18 + 0x22));
        }
      }
      local_42fc = local_42fc + 1;
      local_42f8 = local_42f8 + 1;
    } while (local_42fc < local_42e0);
  }
  return iVar10;
}


