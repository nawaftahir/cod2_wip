// 1002c570 size=165 FUN_1002c570

void FUN_1002c570(int param_1)

{
  int iVar1;
  byte bVar2;
  int unaff_ESI;
  int iVar3;
  
  iVar1 = *(int *)(unaff_ESI + 0x10);
  bVar2 = 0;
  if (iVar1 != 1) {
    do {
      bVar2 = bVar2 + 1;
    } while (iVar1 != 1 << (bVar2 & 0x1f));
  }
  bVar2 = 0;
  if (*(int *)(unaff_ESI + 0xc) != 1) {
    do {
      bVar2 = bVar2 + 1;
    } while (*(int *)(unaff_ESI + 0xc) != 1 << (bVar2 & 0x1f));
  }
  iVar3 = 0;
  if (0 < iVar1) {
    do {
      FUN_1005ee60(param_1 + *(int *)(unaff_ESI + 0xc) * iVar3 * 8,1,&DAT_101d7a10,&DAT_101d7210);
      iVar3 = iVar3 + 1;
    } while (iVar3 < *(int *)(unaff_ESI + 0x10));
  }
  iVar1 = *(int *)(unaff_ESI + 0xc);
  iVar3 = 0;
  if (0 < iVar1) {
    do {
      FUN_1005ee60(param_1,iVar1,&DAT_101d7a10,&DAT_101d7210);
      iVar1 = *(int *)(unaff_ESI + 0xc);
      iVar3 = iVar3 + 1;
      param_1 = param_1 + 8;
    } while (iVar3 < iVar1);
  }
  return;
}


