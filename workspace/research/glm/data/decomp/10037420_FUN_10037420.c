// 10037420 size=213 FUN_10037420

undefined4 FUN_10037420(undefined4 param_1,float param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  int in_ECX;
  uint uVar7;
  int iVar8;
  undefined4 *unaff_ESI;
  undefined4 *puVar9;
  float local_c;
  float local_8;
  float local_4;
  
  puVar9 = unaff_ESI;
  for (uVar7 = (uint)(in_ECX * 0x68) >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
    *puVar9 = 0;
    puVar9 = puVar9 + 1;
  }
  for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
    *(undefined1 *)puVar9 = 0;
    puVar9 = (undefined4 *)((int)puVar9 + 1);
  }
  FUN_100367b0();
  *unaff_ESI = 3;
  unaff_ESI[0x12] = 0x3f800000;
  unaff_ESI[9] = local_c * 0.5;
  unaff_ESI[10] = local_8 * 0.5;
  unaff_ESI[0xb] = local_4 * 0.5;
  fVar1 = *(float *)(DAT_101d1b9c + 200);
  fVar2 = *(float *)(DAT_101d1b9c + 0xd4);
  fVar3 = *(float *)(DAT_101d1b9c + 0xcc);
  fVar4 = *(float *)(DAT_101d1b9c + 0xd8);
  fVar5 = *(float *)(DAT_101d1b9c + 0xd0);
  fVar6 = *(float *)(DAT_101d1b9c + 0xdc);
  unaff_ESI[0x1a] = 3;
  unaff_ESI[0x2c] = 0x3f800000;
  unaff_ESI[0x23] = (param_2 * fVar1 + fVar2) * 0.5;
  unaff_ESI[0x24] = (param_2 * fVar3 + fVar4) * 0.5;
  unaff_ESI[0x25] = (param_2 * fVar5 + fVar6) * 0.5;
  return 2;
}


