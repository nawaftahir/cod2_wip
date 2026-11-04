// 10034fe0 size=448 FUN_10034fe0

void FUN_10034fe0(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined4 uVar1;
  float fVar2;
  float *pfVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  undefined4 *unaff_ESI;
  float *pfVar6;
  undefined4 *local_3c;
  float *local_38;
  int local_34;
  float *local_30;
  int local_2c;
  undefined4 *local_28;
  float local_24;
  float local_20;
  float local_1c [4];
  float local_c [3];
  
  FUN_10034ca0(param_1);
  FUN_10034ca0(param_1,param_2,param_4);
  local_38 = (float *)(unaff_ESI + 0xd);
  local_3c = unaff_ESI + 0xc;
  local_28 = unaff_ESI + 0xb;
  local_30 = (float *)(unaff_ESI + 10);
  local_2c = 0;
  pfVar6 = (float *)(unaff_ESI + 9);
  puVar5 = unaff_ESI + 8;
  puVar4 = unaff_ESI + 7;
  pfVar3 = (float *)(unaff_ESI + 6);
  local_34 = 0;
  do {
    *puVar4 = *(undefined4 *)((int)local_1c + local_34);
    *pfVar3 = -local_24;
    fVar2 = local_1c[2] * *(float *)((int)local_c + local_34);
    *local_30 = local_24;
    uVar1 = *(undefined4 *)((int)local_1c + local_34);
    *pfVar6 = fVar2;
    *local_28 = uVar1;
    *local_3c = 0;
    *local_38 = fVar2;
    pfVar3[8] = -local_20;
    puVar4[8] = *(undefined4 *)((int)local_1c + local_34);
    fVar2 = local_1c[3] * *(float *)((int)local_c + local_34);
    local_30[8] = local_20;
    pfVar6[8] = fVar2;
    local_28[8] = *(undefined4 *)((int)local_1c + local_34);
    local_3c[8] = 0;
    local_38[8] = fVar2;
    *puVar5 = 0;
    local_2c = local_2c + 2;
    local_30 = local_30 + 0x10;
    local_28 = local_28 + 0x10;
    local_3c = local_3c + 0x10;
    local_38 = local_38 + 0x10;
    local_34 = local_34 + 4;
    puVar5[8] = 0;
    pfVar3 = pfVar3 + 0x10;
    puVar4 = puVar4 + 0x10;
    puVar5 = puVar5 + 0x10;
    pfVar6 = pfVar6 + 0x10;
  } while (local_34 < 8);
  uVar1 = (&DAT_101d1bac)[local_2c * 2];
  unaff_ESI[5] = local_2c * 2;
  unaff_ESI[1] = 0x3f800000;
  unaff_ESI[2] = 0x3f800000;
  *unaff_ESI = uVar1;
  unaff_ESI[3] = param_3;
  unaff_ESI[4] = param_4;
  return;
}


