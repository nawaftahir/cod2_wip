// 10018af0 size=88 FUN_10018af0

void FUN_10018af0(void)

{
  uint uVar1;
  uint *puVar2;
  int *unaff_EBX;
  int iVar3;
  
  if ((DAT_101d496c == '\0') && (iVar3 = 0, 0 < *unaff_EBX)) {
    puVar2 = (uint *)(unaff_EBX + 5);
    do {
      if ((puVar2[2] & 0x700) != 0) {
        uVar1 = (int)*puVar2 >> 8 & 7;
        if ((uVar1 != 1) && (uVar1 != 0)) {
          puVar2[2] = puVar2[2] | 0x7ff;
          *puVar2 = *puVar2 & 0xfffff911 | 0x111;
        }
      }
      iVar3 = iVar3 + 1;
      puVar2 = puVar2 + 8;
    } while (iVar3 < *unaff_EBX);
  }
  return;
}


