// 10034ec0 size=282 FUN_10034ec0

void FUN_10034ec0(undefined4 param_1,undefined4 *param_2)

{
  undefined4 uVar1;
  int iVar2;
  int unaff_EBX;
  undefined4 *unaff_ESI;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  iVar2 = FUN_10034ca0(param_1,param_2[unaff_EBX],param_2[unaff_EBX]);
  uVar1 = (&DAT_101d1bac)[iVar2];
  unaff_ESI[5] = iVar2;
  *unaff_ESI = uVar1;
  unaff_ESI[unaff_EBX + 6] = local_40;
  unaff_ESI[7 - unaff_EBX] = 0;
  unaff_ESI[9] = local_20;
  unaff_ESI[8] = 0;
  unaff_ESI[unaff_EBX + 10] = local_3c;
  unaff_ESI[0xb - unaff_EBX] = 0;
  unaff_ESI[0xd] = local_1c;
  unaff_ESI[0xc] = 0;
  unaff_ESI[unaff_EBX + 0xe] = local_38;
  unaff_ESI[0xf - unaff_EBX] = 0;
  unaff_ESI[0x11] = local_18;
  unaff_ESI[0x10] = 0;
  unaff_ESI[unaff_EBX + 0x12] = local_34;
  unaff_ESI[0x13 - unaff_EBX] = 0;
  unaff_ESI[0x15] = local_14;
  unaff_ESI[0x14] = 0;
  unaff_ESI[unaff_EBX + 0x16] = local_30;
  unaff_ESI[0x17 - unaff_EBX] = 0;
  unaff_ESI[0x19] = local_10;
  unaff_ESI[0x18] = 0;
  unaff_ESI[unaff_EBX + 0x1a] = local_2c;
  unaff_ESI[0x1b - unaff_EBX] = 0;
  unaff_ESI[0x1d] = local_c;
  unaff_ESI[0x1c] = 0;
  unaff_ESI[unaff_EBX + 0x1e] = local_28;
  unaff_ESI[0x1f - unaff_EBX] = 0;
  unaff_ESI[0x20] = 0;
  unaff_ESI[0x21] = local_8;
  unaff_ESI[unaff_EBX + 0x22] = local_24;
  unaff_ESI[0x23 - unaff_EBX] = 0;
  unaff_ESI[0x25] = local_4;
  unaff_ESI[0x24] = 0;
  unaff_ESI[1] = 0x3f800000;
  unaff_ESI[2] = 0x3f800000;
  unaff_ESI[3] = *param_2;
  unaff_ESI[4] = param_2[1];
  return;
}


