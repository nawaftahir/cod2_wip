// 10004dc0 size=371 FUN_10004dc0

void FUN_10004dc0(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  int in_EAX;
  float fVar5;
  float *extraout_ECX;
  float fVar6;
  float fVar7;
  int unaff_ESI;
  float10 fVar8;
  float10 fVar9;
  float10 fVar10;
  float10 fVar11;
  undefined1 local_3c [12];
  undefined1 local_30 [4];
  float local_2c;
  undefined1 *local_20;
  undefined1 *local_1c;
  float local_c;
  float local_8;
  float local_4;
  
  fVar8 = (float10)(*(float *)(in_EAX + 0x78) * 0.017453292);
  fVar11 = (float10)fcos(fVar8);
  fVar9 = (float10)fsin(fVar8);
  local_20 = local_3c;
  local_2c = *(float *)(in_EAX + 0x74) * 0.017453292;
  local_1c = local_30;
  fVar8 = (float10)fcos((float10)local_2c);
  fVar10 = (float10)fsin((float10)local_2c);
  local_c = (float)fVar8 * (float)fVar11;
  local_8 = (float)fVar8 * (float)fVar9;
  local_4 = -(float)fVar10;
  if (*(float *)(in_EAX + 0x40) != 0.0) {
    fVar11 = (float10)FUN_1005df00();
    if ((float10)0.0 != fVar11) {
      fVar7 = *(float *)(in_EAX + 0x40);
      fVar5 = fVar7 * *extraout_ECX;
      fVar6 = fVar7 * extraout_ECX[1];
      fVar7 = fVar7 * extraout_ECX[2];
      goto LAB_10004eb4;
    }
  }
  fVar5 = 0.0;
  fVar6 = 0.0;
  fVar7 = 0.0;
LAB_10004eb4:
  fVar4 = (1.0 - *(float *)(in_EAX + 0x50)) *
          (*(float *)(in_EAX + 0x54) - *(float *)(in_EAX + 0x40));
  fVar1 = *(float *)(in_EAX + 0x58);
  fVar2 = *(float *)(in_EAX + 0x5c);
  fVar3 = *(float *)(in_EAX + 0x60);
  if (unaff_ESI != 0) {
    *(float *)(unaff_ESI + 4) = local_c;
    *(float *)(unaff_ESI + 8) = local_8;
    *(float *)(unaff_ESI + 0xc) = local_4;
    *(undefined4 *)(unaff_ESI + 0x10) = 0;
    *(float *)(unaff_ESI + 0x14) = fVar4 * fVar1;
    *(float *)(unaff_ESI + 0x18) = fVar4 * fVar2;
    *(float *)(unaff_ESI + 0x1c) = fVar4 * fVar3;
    *(float *)(unaff_ESI + 0x20) = fVar5;
    *(float *)(unaff_ESI + 0x24) = fVar6;
    *(float *)(unaff_ESI + 0x28) = fVar7;
  }
  return;
}


