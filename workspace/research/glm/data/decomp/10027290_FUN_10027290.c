// 10027290 size=673 FUN_10027290

void FUN_10027290(float *param_1,float *param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float *pfVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  undefined4 *unaff_ESI;
  undefined4 *puVar10;
  float local_48;
  float local_44;
  float local_40;
  float afStack_3c [7];
  float local_20;
  undefined4 local_1c;
  float local_18;
  float local_14;
  float local_10;
  undefined4 local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  FUN_100271b0();
  iVar6 = DAT_101ce618;
  local_18 = -local_18;
  uVar9 = 0;
  local_14 = -local_14;
  local_10 = -local_10;
  do {
    if ((uVar9 & 1) == 0) {
      local_48 = *param_1;
    }
    else {
      local_48 = *param_2;
    }
    if ((uVar9 & 2) == 0) {
      local_44 = param_1[1];
    }
    else {
      local_44 = param_2[1];
    }
    if ((uVar9 & 4) == 0) {
      local_40 = param_1[2];
    }
    else {
      local_40 = param_2[2];
    }
    pfVar5 = &local_20;
    iVar7 = 0;
    do {
      fVar1 = local_44 * *pfVar5 + local_48 * pfVar5[-1] + local_40 * pfVar5[1];
      if ((uVar9 == 0) || (*(float *)((int)afStack_3c + iVar7 + 0xc) < fVar1)) {
        *(float *)((int)afStack_3c + iVar7 + 0xc) = fVar1;
      }
      if ((uVar9 == 0) || (fVar1 < *(float *)((int)afStack_3c + iVar7))) {
        *(float *)((int)afStack_3c + iVar7) = fVar1;
      }
      iVar7 = iVar7 + 4;
      pfVar5 = pfVar5 + 3;
    } while (iVar7 != 0xc);
    uVar9 = uVar9 + 1;
  } while (uVar9 != 8);
  iVar7 = 0;
  pfVar5 = &local_20;
  do {
    iVar8 = (iVar7 + 2) % 3;
    fVar1 = (2.0 / (afStack_3c[iVar7 + 3] - afStack_3c[iVar7])) * 0.9375;
    if (iVar8 == 2) {
      fVar1 = afStack_3c[iVar7];
      fVar2 = afStack_3c[iVar7 + 3];
      fVar3 = *pfVar5;
      unaff_ESI[0x14] = pfVar5[-1];
      fVar4 = pfVar5[1];
      unaff_ESI[0x18] = fVar3;
      unaff_ESI[0x1c] = fVar4;
      unaff_ESI[0x20] = (fVar1 + fVar2) * -0.5;
      fVar1 = 1.0 / *(float *)(iVar6 + 8);
      unaff_ESI[0x14] = fVar1 * (float)unaff_ESI[0x14];
      unaff_ESI[0x18] = fVar1 * (float)unaff_ESI[0x18];
      unaff_ESI[0x1c] = fVar1 * (float)unaff_ESI[0x1c];
      unaff_ESI[0x20] = fVar1 * (float)unaff_ESI[0x20];
    }
    else {
      unaff_ESI[iVar8 + 0x12] = fVar1 * pfVar5[-1];
      unaff_ESI[iVar8 + 0x16] = fVar1 * *pfVar5;
      unaff_ESI[iVar8 + 0x1a] = fVar1 * pfVar5[1];
      unaff_ESI[iVar8 + 0x1e] = (afStack_3c[iVar7] + afStack_3c[iVar7 + 3]) * fVar1 * -0.5;
    }
    iVar7 = iVar7 + 1;
    pfVar5 = pfVar5 + 3;
  } while (iVar7 != 3);
  unaff_ESI[0x15] = 0;
  unaff_ESI[0x19] = 0;
  unaff_ESI[0x1d] = 0;
  unaff_ESI[0x21] = 0x3f800000;
  unaff_ESI[3] = afStack_3c[6];
  unaff_ESI[4] = local_20;
  unaff_ESI[5] = local_1c;
  unaff_ESI[6] = local_18;
  unaff_ESI[7] = local_14;
  unaff_ESI[8] = local_10;
  unaff_ESI[9] = local_c;
  unaff_ESI[10] = local_8;
  unaff_ESI[0xb] = local_4;
  *unaff_ESI = 0;
  unaff_ESI[1] = 0;
  unaff_ESI[2] = 0;
  puVar10 = unaff_ESI + 0x22;
  for (iVar6 = 0x10; iVar6 != 0; iVar6 = iVar6 + -1) {
    *puVar10 = 0;
    puVar10 = puVar10 + 1;
  }
  unaff_ESI[0x2c] = 0x3f000000;
  unaff_ESI[0x30] = 0x3f000000;
  unaff_ESI[0x22] = 0x3f7bffff;
  unaff_ESI[0x27] = 0x3f7bffff;
  unaff_ESI[0x31] = 0x3f800000;
  unaff_ESI[0x52] = -(float)unaff_ESI[0x30];
  FUN_1005a880();
  FUN_1005ad00();
  unaff_ESI[0x11] = 0x3f800000;
  unaff_ESI[0xc] = 0;
  unaff_ESI[0xd] = 0;
  unaff_ESI[0xe] = 0x80;
  unaff_ESI[0xf] = 0x80;
  unaff_ESI[0x10] = 0;
  return;
}


