// 10001050 size=472 FUN_10001050

undefined4 FUN_10001050(int param_1)

{
  int in_EAX;
  int iVar1;
  undefined4 *puVar2;
  undefined4 in_ECX;
  undefined4 *puVar3;
  int iVar4;
  int iVar5;
  
  iVar5 = *(int *)(DAT_101ce708 + 8);
  iVar1 = FUN_10004f40();
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    iVar5 = 0;
    if (3 < in_EAX) {
      iVar4 = (in_EAX - 4U >> 2) + 1;
      puVar2 = (undefined4 *)(iVar1 + 0x1c);
      puVar3 = (undefined4 *)(param_1 + 0x28);
      iVar5 = iVar4 * 4;
      do {
        puVar2[-7] = puVar3[-10];
        puVar2[-6] = puVar3[-9];
        puVar2[-5] = puVar3[-8];
        puVar2[-4] = puVar3[-4];
        puVar2[-3] = puVar3[-3];
        puVar2[-2] = puVar3[-2];
        puVar2[-1] = puVar3[-1];
        *puVar2 = *puVar3;
        puVar2[1] = puVar3[7];
        puVar2[2] = puVar3[8];
        puVar2[3] = puVar3[9];
        puVar2[4] = puVar3[0xd];
        puVar2[5] = puVar3[0xe];
        puVar2[6] = puVar3[0xf];
        puVar2[7] = puVar3[0x10];
        puVar2[8] = puVar3[0x11];
        puVar2[9] = puVar3[0x18];
        puVar2[10] = puVar3[0x19];
        puVar2[0xb] = puVar3[0x1a];
        puVar2[0xc] = puVar3[0x1e];
        puVar2[0xd] = puVar3[0x1f];
        puVar2[0xe] = puVar3[0x20];
        puVar2[0xf] = puVar3[0x21];
        puVar2[0x10] = puVar3[0x22];
        puVar2[0x11] = puVar3[0x29];
        puVar2[0x12] = puVar3[0x2a];
        puVar2[0x13] = puVar3[0x2b];
        puVar2[0x14] = puVar3[0x2f];
        puVar2[0x15] = puVar3[0x30];
        puVar2[0x16] = puVar3[0x31];
        puVar2[0x17] = puVar3[0x32];
        puVar2[0x18] = puVar3[0x33];
        puVar2 = puVar2 + 0x20;
        puVar3 = puVar3 + 0x44;
        iVar4 = iVar4 + -1;
      } while (iVar4 != 0);
    }
    if (iVar5 < in_EAX) {
      puVar2 = (undefined4 *)(iVar5 * 0x20 + 0x1c + iVar1);
      puVar3 = (undefined4 *)(iVar5 * 0x44 + 0x28 + param_1);
      iVar5 = in_EAX - iVar5;
      do {
        puVar2[-7] = puVar3[-10];
        puVar2[-6] = puVar3[-9];
        puVar2[-5] = puVar3[-8];
        puVar2[-4] = puVar3[-4];
        puVar2[-3] = puVar3[-3];
        puVar2[-2] = puVar3[-2];
        puVar2[-1] = puVar3[-1];
        *puVar2 = *puVar3;
        puVar2 = puVar2 + 8;
        puVar3 = puVar3 + 0x11;
        iVar5 = iVar5 + -1;
      } while (iVar5 != 0);
      FUN_10005020();
      return in_ECX;
    }
  }
  else {
    FUN_1005eaf0(iVar1,param_1,(((iVar5 != 2) - 1 & 0xffffffdc) + 0x44) * in_EAX);
  }
  FUN_10005020();
  return in_ECX;
}


