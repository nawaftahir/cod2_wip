// 10011fe0 size=74 FUN_10011fe0

int FUN_10011fe0(void)

{
  int iVar1;
  int unaff_EBX;
  int iVar2;
  int unaff_EDI;
  ushort local_200 [256];
  
  iVar1 = FUN_10011f10();
  iVar2 = 0;
  if (0 < unaff_EBX) {
    do {
      iVar1 = (uint)local_200[*(byte *)(iVar2 + unaff_EDI)] * -0x7f807f01;
      *(char *)(iVar2 + unaff_EDI) =
           (char)(((uint)local_200[*(byte *)(iVar2 + unaff_EDI)] * 0xff) / 0xffff);
      iVar2 = iVar2 + 1;
    } while (iVar2 < unaff_EBX);
  }
  return iVar1;
}


