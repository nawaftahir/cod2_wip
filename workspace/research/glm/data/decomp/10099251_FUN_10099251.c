// 10099251 size=267 FUN_10099251

int FUN_10099251(void)

{
  int iVar1;
  int *in_ECX;
  uint uVar2;
  
  iVar1 = FUN_1008f667();
  if (((-1 < iVar1) && (iVar1 = FUN_10096f40(), -1 < iVar1)) &&
     (iVar1 = FUN_10090e95(1), -1 < iVar1)) {
    uVar2 = 0;
    do {
      iVar1 = FUN_10094eb4(1);
      if (iVar1 != 0) {
        if (iVar1 < 0) {
          return iVar1;
        }
        if (iVar1 == 1) break;
      }
      uVar2 = uVar2 + 1;
    } while (uVar2 < 0x100);
    iVar1 = FUN_1008f8a0();
    if (((-1 < iVar1) && (iVar1 = FUN_10097607(), -1 < iVar1)) &&
       ((iVar1 = (**(code **)(*in_ECX + 0x10))(), -1 < iVar1 &&
        ((iVar1 = FUN_10090e95(0), -1 < iVar1 && (iVar1 = FUN_100984ab(), -1 < iVar1)))))) {
      in_ECX[0x37] = 1;
      iVar1 = FUN_100910df();
      if ((-1 < iVar1) &&
         (((((iVar1 = FUN_10098a05(), -1 < iVar1 && (iVar1 = FUN_10089562(), -1 < iVar1)) &&
            (iVar1 = (**(code **)(*in_ECX + 0x14))(), -1 < iVar1)) &&
           ((iVar1 = (**(code **)(*in_ECX + 0x18))(), -1 < iVar1 &&
            (iVar1 = FUN_10086eae(), -1 < iVar1)))) &&
          ((iVar1 = FUN_1008d525(), -1 < iVar1 &&
           ((iVar1 = FUN_10098c39(), -1 < iVar1 && (iVar1 = FUN_1009141b(), -1 < iVar1)))))))) {
        iVar1 = 0;
      }
    }
  }
  return iVar1;
}


