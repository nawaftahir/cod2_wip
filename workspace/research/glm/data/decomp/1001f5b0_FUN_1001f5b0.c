// 1001f5b0 size=84 FUN_1001f5b0

void FUN_1001f5b0(int param_1)

{
  byte bVar1;
  int iVar2;
  
  bVar1 = *(byte *)(param_1 + 0x1d);
  iVar2 = 0;
  if (bVar1 != 0) {
    do {
      if ((*(uint *)(param_1 + 0xc + (iVar2 >> 5) * 4) & 1 << ((byte)iVar2 & 0x1f)) != 0) {
        FUN_1001d720();
      }
      iVar2 = iVar2 + 1;
    } while (iVar2 < (int)(uint)bVar1);
  }
  return;
}


