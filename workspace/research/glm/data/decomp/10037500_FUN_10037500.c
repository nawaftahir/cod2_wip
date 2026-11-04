// 10037500 size=294 FUN_10037500

int FUN_10037500(undefined4 param_1,float param_2,undefined4 *param_3)

{
  int iVar1;
  char cVar2;
  uint uVar3;
  int iVar4;
  int unaff_EBX;
  int iVar5;
  undefined4 *puVar6;
  
  puVar6 = param_3;
  for (uVar3 = (uint)(unaff_EBX * 0x68) >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
    *(undefined1 *)puVar6 = 0;
    puVar6 = (undefined4 *)((int)puVar6 + 1);
  }
  FUN_10036720();
  iVar4 = 0;
  iVar5 = 0;
  if (1 < unaff_EBX) {
    do {
      cVar2 = FUN_100368a0(param_3);
      iVar5 = iVar4;
      if (cVar2 == '\0') break;
      iVar5 = iVar4 + 1;
      iVar1 = iVar4 + 2;
      iVar4 = iVar5;
    } while (iVar1 < unaff_EBX);
  }
  param_3[iVar5 * 0x1a] = 3;
  param_3[iVar5 * 0x1a + 9] = *(float *)(DAT_101d1b9c + 0xd4) * 0.5;
  param_3[iVar5 * 0x1a + 10] = *(float *)(DAT_101d1b9c + 0xd8) * 0.5;
  param_3[iVar5 * 0x1a + 0xb] = *(float *)(DAT_101d1b9c + 0xdc) * 0.5;
  param_3[iVar5 * 0x1a + 1] = param_2 * *(float *)(DAT_101d1b9c + 200) * 0.5;
  param_3[iVar5 * 0x1a + 2] = param_2 * *(float *)(DAT_101d1b9c + 0xcc) * 0.5;
  param_3[iVar5 * 0x1a + 3] = param_2 * *(float *)(DAT_101d1b9c + 0xd0) * 0.5;
  param_3[iVar5 * 0x1a + 0x10] = -*(float *)(DAT_101d1b9c + 0xb8);
  param_3[iVar5 * 0x1a + 0x11] = -*(float *)(DAT_101d1b9c + 0xbc);
  param_3[iVar5 * 0x1a + 0x12] = -*(float *)(DAT_101d1b9c + 0xc0);
  return iVar5 + 1;
}


