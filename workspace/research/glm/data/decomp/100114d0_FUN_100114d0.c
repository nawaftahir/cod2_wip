// 100114d0 size=137 FUN_100114d0

void FUN_100114d0(void)

{
  int iVar1;
  undefined4 *unaff_EBX;
  undefined4 *unaff_ESI;
  undefined4 *puVar2;
  
  FUN_10011460();
  puVar2 = unaff_ESI;
  for (iVar1 = 0xe; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  *unaff_ESI = unaff_EBX[5];
  unaff_ESI[1] = unaff_EBX[6];
  iVar1 = DAT_101ce7dc;
  unaff_ESI[2] = 0x15;
  unaff_ESI[3] = 1;
  unaff_ESI[4] = DAT_101d4814;
  unaff_ESI[5] = DAT_101d4818;
  unaff_ESI[6] = 1;
  unaff_ESI[9] = 0;
  unaff_ESI[10] = 0x4b;
  unaff_ESI[0xd] = (-(uint)(*(char *)(iVar1 + 8) != '\0') & 0x80000001) + 0x80000000;
  unaff_ESI[7] = *unaff_EBX;
  unaff_ESI[0xb] = 0;
  if (*(char *)(unaff_EBX + 2) != '\0') {
    unaff_ESI[8] = 0;
    unaff_ESI[0xc] = unaff_EBX[1];
    return;
  }
  unaff_ESI[8] = 1;
  unaff_ESI[0xc] = 0;
  return;
}


