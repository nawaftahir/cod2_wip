// 10023b90 size=299 FUN_10023b90

int FUN_10023b90(int param_1)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  int iVar5;
  undefined4 *puVar6;
  
  iVar1 = FUN_10023af0();
  if (iVar1 < 0) {
    return -1;
  }
  puVar3 = (undefined4 *)(iVar1 * 0x74 + DAT_10678510);
  iVar5 = *(int *)(DAT_101d1b9c + 0xf8) + param_1 * 0x60;
  puVar6 = puVar3;
  for (iVar2 = 0x1d; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  *puVar3 = 2;
  puVar3[0xf] = *(undefined4 *)(iVar5 + 4);
  puVar3[0x10] = *(undefined4 *)(iVar5 + 8);
  puVar3[0x11] = *(undefined4 *)(iVar5 + 0xc);
  puVar3[5] = *(undefined4 *)(iVar5 + 0x2c);
  puVar3[6] = *(undefined4 *)(iVar5 + 0x30);
  puVar3[7] = *(undefined4 *)(iVar5 + 0x34);
  puVar3[8] = *(undefined4 *)(iVar5 + 0x38);
  puVar3[9] = *(undefined4 *)(iVar5 + 0x3c);
  puVar3[10] = *(undefined4 *)(iVar5 + 0x40);
  puVar3[0xb] = *(undefined4 *)(iVar5 + 0x44);
  puVar3[0xc] = *(undefined4 *)(iVar5 + 0x48);
  puVar3[0xd] = *(undefined4 *)(iVar5 + 0x4c);
  iVar2 = DAT_101ce708;
  puVar3[0xe] = *(undefined4 *)(iVar5 + 0x50);
  if (*(int *)(iVar2 + 8) == 2) {
    puVar3[2] = *(int *)(DAT_101d1b9c + 300) + param_1 * 0x60;
    puVar3[3] = *(undefined4 *)(*(int *)(DAT_101d1b9c + 0x130) + param_1 * 4);
  }
  else {
    puVar3[2] = *(undefined4 *)(iVar5 + 0x54);
    puVar3[3] = *(undefined4 *)(iVar5 + 0x58);
    puVar3[4] = *(undefined4 *)(iVar5 + 0x5c);
  }
  iVar4 = iVar1 * 0x34;
  puVar6 = (undefined4 *)(&DAT_10678ac4 + iVar4);
  for (iVar2 = 0xd; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  *(undefined4 *)(&DAT_10678ad0 + iVar4) = 2;
  (&DAT_10678ac8)[iVar1 * 0xd] = *(undefined4 *)(iVar5 + 0x10);
  *(undefined4 *)(&DAT_10678ad8 + iVar4) = *(undefined4 *)(iVar5 + 0x14);
  *(undefined4 *)(&DAT_10678adc + iVar4) = *(undefined4 *)(iVar5 + 0x18);
  *(undefined4 *)(&DAT_10678ae0 + iVar4) = *(undefined4 *)(iVar5 + 0x1c);
  *(undefined4 *)(&DAT_10678ae4 + iVar4) = *(undefined4 *)(iVar5 + 0x20);
  *(undefined4 *)(&DAT_10678ae8 + iVar4) = *(undefined4 *)(iVar5 + 0x24);
  *(undefined4 *)(&DAT_10678aec + iVar4) = *(undefined4 *)(iVar5 + 0x28);
  return iVar1;
}


