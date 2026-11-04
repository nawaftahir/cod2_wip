// 10018b50 size=147 FUN_10018b50

void FUN_10018b50(void)

{
  uint uVar1;
  uint *puVar2;
  int iVar3;
  int *unaff_EDI;
  
  if (DAT_101d496d != '\0') {
    if ((DAT_101d496c == '\0') && (iVar3 = 0, 0 < *unaff_EDI)) {
      puVar2 = (uint *)(unaff_EDI + 5);
      do {
        if ((puVar2[2] & 0x7000000) != 0) {
          uVar1 = (int)*puVar2 >> 0x18 & 7;
          if ((uVar1 != 1) && (uVar1 != 0)) {
            puVar2[2] = puVar2[2] | 0x7ff0000;
            *puVar2 = *puVar2 & 0xf911ffff | 0x1110000;
          }
        }
        iVar3 = iVar3 + 1;
        puVar2 = puVar2 + 8;
      } while (iVar3 < *unaff_EDI);
    }
    return;
  }
  unaff_EDI[7] = unaff_EDI[7] | 0x7ff0000;
  unaff_EDI[1] = 0;
  unaff_EDI[2] = 0;
  unaff_EDI[3] = 0;
  unaff_EDI[4] = 0;
  *unaff_EDI = 1;
  unaff_EDI[5] = unaff_EDI[5] & 0xf812ffffU | 0x120000;
  return;
}


