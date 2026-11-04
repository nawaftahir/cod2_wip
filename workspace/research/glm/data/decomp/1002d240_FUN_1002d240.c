// 1002d240 size=400 FUN_1002d240

void FUN_1002d240(int param_1)

{
  int in_EAX;
  undefined4 *puVar1;
  undefined4 *puVar2;
  undefined4 *in_ECX;
  int iVar3;
  int iVar4;
  
  iVar4 = 0;
  if (3 < in_EAX) {
    puVar2 = in_ECX + 0xe;
    puVar1 = (undefined4 *)(param_1 + 0x14);
    iVar3 = (in_EAX - 4U >> 2) + 1;
    iVar4 = iVar3 * 4;
    do {
      puVar1[-5] = puVar2[-2];
      puVar1[-4] = puVar2[-1];
      puVar1[-3] = *puVar2;
      puVar1[-2] = *in_ECX;
      puVar1[-1] = puVar2[-0xd];
      *puVar1 = puVar2[-0xc];
      puVar1[1] = puVar2[-0xb];
      puVar1[2] = puVar2[-7];
      puVar1[3] = puVar2[-3];
      puVar1[4] = puVar2[0xe];
      puVar1[5] = puVar2[0xf];
      puVar1[6] = puVar2[0x10];
      puVar1[7] = puVar2[2];
      puVar1[8] = puVar2[3];
      puVar1[9] = puVar2[4];
      puVar1[10] = puVar2[5];
      puVar1[0xb] = puVar2[9];
      puVar1[0xc] = puVar2[0xd];
      puVar1[0xd] = puVar2[0x1e];
      puVar1[0xe] = puVar2[0x1f];
      puVar1[0xf] = puVar2[0x20];
      puVar1[0x10] = puVar2[0x12];
      puVar1[0x11] = puVar2[0x13];
      puVar1[0x12] = puVar2[0x14];
      puVar1[0x13] = puVar2[0x15];
      puVar1[0x14] = puVar2[0x19];
      puVar1[0x15] = puVar2[0x1d];
      puVar1[0x16] = puVar2[0x2e];
      puVar1[0x17] = puVar2[0x2f];
      puVar1[0x18] = puVar2[0x30];
      puVar1[0x19] = puVar2[0x22];
      puVar1[0x1a] = puVar2[0x23];
      puVar1[0x1b] = puVar2[0x24];
      puVar1[0x1c] = puVar2[0x25];
      puVar1[0x1d] = puVar2[0x29];
      puVar1[0x1e] = puVar2[0x2d];
      in_ECX = in_ECX + 0x40;
      puVar2 = puVar2 + 0x40;
      puVar1 = puVar1 + 0x24;
      iVar3 = iVar3 + -1;
    } while (iVar3 != 0);
  }
  if (iVar4 < in_EAX) {
    puVar1 = in_ECX + 0xe;
    puVar2 = (undefined4 *)(param_1 + 0x14 + iVar4 * 0x24);
    iVar4 = in_EAX - iVar4;
    do {
      puVar2[-5] = puVar1[-2];
      puVar2[-4] = puVar1[-1];
      puVar2[-3] = *puVar1;
      puVar2[-2] = *in_ECX;
      puVar2[-1] = puVar1[-0xd];
      *puVar2 = puVar1[-0xc];
      puVar2[1] = puVar1[-0xb];
      puVar2[2] = puVar1[-7];
      puVar2[3] = puVar1[-3];
      in_ECX = in_ECX + 0x10;
      puVar1 = puVar1 + 0x10;
      puVar2 = puVar2 + 9;
      iVar4 = iVar4 + -1;
    } while (iVar4 != 0);
  }
  return;
}


