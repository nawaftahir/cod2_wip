// 10028cd0 size=826 FUN_10028cd0

float * FUN_10028cd0(void)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  undefined1 *unaff_ESI;
  float10 fVar4;
  float10 fVar5;
  float10 fVar6;
  float local_28;
  float local_20 [2];
  int local_18;
  float local_14;
  undefined8 local_c;
  
  uVar3 = DAT_101d1b2c;
  if (**(char **)(DAT_10696be0 + 8) != '\0') {
    uVar3 = FUN_10017100(6);
  }
  iVar2 = DAT_10696c2c;
  *(undefined4 *)(unaff_ESI + 4) = uVar3;
  iVar1 = DAT_10696c24;
  *(undefined4 *)(unaff_ESI + 0xc) = *(undefined4 *)(iVar2 + 8);
  uVar3 = DAT_101d1b2c;
  if (**(char **)(iVar1 + 8) != '\0') {
    uVar3 = FUN_10017100(6);
  }
  iVar2 = DAT_10696c1c;
  iVar1 = DAT_10696bdc;
  *(undefined4 *)(unaff_ESI + 8) = uVar3;
  *(float *)(unaff_ESI + 0x10) = *(float *)(iVar1 + 8) * 0.5;
  local_14 = *(float *)(iVar2 + 8) * 0.017453292;
  fVar4 = (float10)FUN_1010acc0();
  iVar2 = DAT_10696c20;
  iVar1 = DAT_10696c0c;
  *(float *)(unaff_ESI + 0x14) = (float)fVar4;
  *(float *)(unaff_ESI + 0x18) = *(float *)(iVar2 + 8) * 0.5;
  local_14 = *(float *)(iVar1 + 8) * 0.017453292;
  fVar4 = (float10)FUN_1010acc0();
  iVar2 = DAT_10696c04;
  iVar1 = DAT_10696bf8;
  *(float *)(unaff_ESI + 0x1c) = (float)fVar4;
  *(undefined4 *)(unaff_ESI + 0x20) = *(undefined4 *)(iVar2 + 8);
  iVar2 = DAT_10696c00;
  *(int *)(unaff_ESI + 0x24) = (int)ROUND(*(float *)(iVar1 + 8) * 1000.0 + 9.313226e-10);
  iVar1 = DAT_10696be4;
  local_c = 0x3e10000000000000;
  local_18 = (int)ROUND(*(float *)(iVar2 + 8) * 1000.0 + 9.313226e-10);
  *(int *)(unaff_ESI + 0x28) = local_18;
  local_14 = *(float *)(iVar1 + 8) * 0.017453292;
  fVar4 = (float10)FUN_1010acc0();
  iVar1 = DAT_10696c10;
  *(float *)(unaff_ESI + 0x2c) = (float)fVar4;
  local_14 = *(float *)(iVar1 + 8) * 0.017453292;
  fVar4 = (float10)FUN_1010acc0();
  iVar1 = DAT_10696c08;
  *(float *)(unaff_ESI + 0x30) = (float)fVar4;
  *(undefined4 *)(unaff_ESI + 0x34) = *(undefined4 *)(iVar1 + 8);
  iVar1 = DAT_10696be8;
  *(int *)(unaff_ESI + 0x38) = (int)ROUND(*(float *)(DAT_10696bfc + 8) * 1000.0 + 9.313226e-10);
  iVar2 = DAT_10696c18;
  local_c = 0x3e10000000000000;
  local_18 = (int)ROUND(*(float *)(iVar1 + 8) * 1000.0 + 9.313226e-10);
  *(int *)(unaff_ESI + 0x3c) = local_18;
  local_14 = *(float *)(iVar2 + 8) * 0.017453292;
  fVar4 = (float10)FUN_1010acc0();
  iVar1 = DAT_10696c14;
  *(float *)(unaff_ESI + 0x40) = (float)fVar4;
  local_14 = *(float *)(iVar1 + 8) * 0.017453292;
  fVar4 = (float10)FUN_1010acc0();
  iVar2 = DAT_10696c30;
  iVar1 = DAT_10696bf0;
  *(float *)(unaff_ESI + 0x44) = (float)fVar4;
  *(undefined4 *)(unaff_ESI + 0x48) = *(undefined4 *)(iVar2 + 8);
  iVar2 = DAT_10696bf4;
  *(int *)(unaff_ESI + 0x4c) = (int)ROUND(*(float *)(iVar1 + 8) * 1000.0 + 9.313226e-10);
  iVar1 = DAT_10696bec;
  *(int *)(unaff_ESI + 0x50) = (int)ROUND(*(float *)(iVar2 + 8) * 1000.0 + 9.313226e-10);
  fVar4 = (float10)((*(float **)(iVar1 + 8))[1] * 0.017453292);
  fcos(fVar4);
  fVar5 = (float10)fsin(fVar4);
  fVar6 = (float10)(**(float **)(iVar1 + 8) * 0.017453292);
  fVar4 = (float10)fcos(fVar6);
  fsin(fVar6);
  if ((float *)(unaff_ESI + 0x54) != (float *)0x0) {
    *(float *)(unaff_ESI + 0x54) = (float)fVar4 * local_28;
    *(float *)(unaff_ESI + 0x58) = (float)fVar4 * (float)fVar5;
    *(float *)(unaff_ESI + 0x5c) = -local_20[0];
  }
  *unaff_ESI = 1;
  return local_20;
}


