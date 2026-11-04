// 10015830 size=494 FUN_10015830

uint FUN_10015830(undefined4 param_1,int param_2,int param_3,int param_4,int param_5)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  int unaff_EBX;
  uint uVar4;
  int iVar5;
  int iVar6;
  
  uVar4 = 0;
  iVar1 = 3;
  iVar5 = 0;
  do {
    iVar1 = FUN_10015260(iVar1,uVar4 * 0x120 + unaff_EBX,(uint)(uVar4 == 0) * 0x120 + unaff_EBX,
                         *(undefined4 *)(param_2 + iVar5 * 4));
    uVar4 = uVar4 ^ 1;
    if (iVar1 == 0) {
      return 0xffffffff;
    }
    iVar5 = iVar5 + 1;
  } while (iVar5 < 6);
  if (param_3 < iVar1) {
    return 0xffffffff;
  }
  iVar5 = 0;
  *(char *)(param_5 + 6) = (char)iVar1;
  if (3 < iVar1) {
    puVar3 = (undefined4 *)(param_4 + 0x10);
    iVar6 = (iVar1 - 4U >> 2) + 1;
    iVar5 = iVar6 * 4;
    puVar2 = (undefined4 *)(uVar4 * 0x120 + 0x18 + unaff_EBX);
    do {
      puVar3[-4] = puVar2[-6];
      puVar3[-3] = puVar2[-5];
      puVar3[-2] = puVar2[-4];
      puVar3[5] = puVar2[-3];
      puVar3[6] = puVar2[-2];
      puVar3[-1] = puVar2[-1];
      *puVar3 = *puVar2;
      puVar3[1] = puVar2[1];
      puVar3[0xd] = puVar2[2];
      puVar3[0xe] = puVar2[3];
      puVar3[0xf] = puVar2[4];
      puVar3[0x16] = puVar2[5];
      puVar3[0x17] = puVar2[6];
      puVar3[0x10] = puVar2[7];
      puVar3[0x11] = puVar2[8];
      puVar3[0x12] = puVar2[9];
      puVar3[0x1e] = puVar2[10];
      puVar3[0x1f] = puVar2[0xb];
      puVar3[0x20] = puVar2[0xc];
      puVar3[0x27] = puVar2[0xd];
      puVar3[0x28] = puVar2[0xe];
      puVar3[0x21] = puVar2[0xf];
      puVar3[0x22] = puVar2[0x10];
      puVar3[0x23] = puVar2[0x11];
      puVar3[0x2f] = puVar2[0x12];
      puVar3[0x30] = puVar2[0x13];
      puVar3[0x31] = puVar2[0x14];
      puVar3[0x38] = puVar2[0x15];
      puVar3[0x39] = puVar2[0x16];
      puVar3[0x32] = puVar2[0x17];
      puVar3[0x33] = puVar2[0x18];
      puVar3[0x34] = puVar2[0x19];
      puVar2 = puVar2 + 0x20;
      puVar3 = puVar3 + 0x44;
      iVar6 = iVar6 + -1;
    } while (iVar6 != 0);
  }
  if (iVar5 < iVar1) {
    puVar2 = (undefined4 *)(iVar5 * 0x44 + 0x10 + param_4);
    puVar3 = (undefined4 *)((iVar5 + uVar4 * 9) * 0x20 + 0x18 + unaff_EBX);
    iVar1 = iVar1 - iVar5;
    do {
      puVar2[-4] = puVar3[-6];
      puVar2[-3] = puVar3[-5];
      puVar2[-2] = puVar3[-4];
      puVar2[5] = puVar3[-3];
      puVar2[6] = puVar3[-2];
      puVar2[-1] = puVar3[-1];
      *puVar2 = *puVar3;
      puVar2[1] = puVar3[1];
      puVar3 = puVar3 + 8;
      puVar2 = puVar2 + 0x11;
      iVar1 = iVar1 + -1;
    } while (iVar1 != 0);
  }
  return uVar4;
}


