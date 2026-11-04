
void FUN_004a8740(void)

{
  int iVar1;
  LPVOID unaff_EDI;
  
  iVar1 = 1;
  do {
    if ((*(byte *)((iVar1 >> 3) + (int)unaff_EDI) & (byte)(1 << ((byte)iVar1 & 7))) == 0) {
      FUN_004a8300(iVar1);
    }
    iVar1 = iVar1 + 1;
  } while (iVar1 < 0x10000);
  VirtualFree(unaff_EDI,0,0x8000);
  return;
}

