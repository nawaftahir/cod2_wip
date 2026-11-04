// 1000a7f0 size=69 FUN_1000a7f0

void FUN_1000a7f0(void)

{
  int iVar1;
  int iVar2;
  
  DAT_101ce580 = 0;
  if ((DAT_101d1b9c != 0) && (iVar1 = 0, 0 < *(int *)(DAT_101d1b9c + 0xfc))) {
    iVar2 = 0;
    do {
      *(undefined4 *)(*(int *)(DAT_101d1b9c + 0x100) + 0x38 + iVar2) = 0;
      iVar1 = iVar1 + 1;
      iVar2 = iVar2 + 0x3c;
    } while (iVar1 < *(int *)(DAT_101d1b9c + 0xfc));
  }
  return;
}


