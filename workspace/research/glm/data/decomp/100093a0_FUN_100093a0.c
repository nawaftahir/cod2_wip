// 100093a0 size=217 FUN_100093a0

void FUN_100093a0(void)

{
  char cVar1;
  int in_EAX;
  int iVar2;
  int iVar3;
  int iVar4;
  int local_4;
  
  iVar4 = in_EAX * 0x20 + *(int *)(DAT_101d1b9c + 0xf0);
  cVar1 = FUN_100063e0();
  if (cVar1 == '\0') {
    if ((*(byte *)(DAT_101ce6e0 + 8) & 1) != 0) {
      FUN_10005590(&DAT_10191418);
    }
    *(undefined4 *)(DAT_101d7e9c + in_EAX * 4) = DAT_10678500;
    iVar3 = 0;
    if (0 < *(int *)(iVar4 + 0x18)) {
      local_4 = *(int *)(iVar4 + 0x1c) * 4;
      iVar2 = *(int *)(iVar4 + 0x1c) * 0xc;
      do {
        *(undefined4 *)(local_4 + DAT_101d7e98) = DAT_10678500;
        FUN_10024380(*(undefined4 *)(*(int *)(DAT_101d1b9c + 0x14) + 8 + iVar2));
        iVar3 = iVar3 + 1;
        local_4 = local_4 + 4;
        iVar2 = iVar2 + 0xc;
      } while (iVar3 < *(int *)(iVar4 + 0x18));
    }
  }
  return;
}


