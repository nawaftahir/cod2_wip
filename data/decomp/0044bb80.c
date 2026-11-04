
void FUN_0044bb80(void)

{
  int in_EAX;
  int iVar1;
  tagRECT local_14;
  
  GetClientRect(*(HWND *)(in_EAX + 0x1c),&local_14);
  iVar1 = FUN_00464770(0);
  if ((*(int *)(iVar1 + 8) != 0) && (DAT_010a44b8 != &DAT_010a44b4)) {
    iVar1 = __stricmp(*(char **)(*(int *)(*(int *)(DAT_010a44b8[2] + 8) + 0x50) + 4),"worldspawn");
    if (iVar1 == 0) {
      FUN_0047a5b0("Can not create a fixed size entity with brushes selected\n");
      return;
    }
  }
  FUN_004433b0();
  FUN_00443a90();
  if (DAT_010a44b8 == &DAT_010a44b4) {
    FUN_0044b9b0();
  }
  FUN_0044b380();
  FUN_00444150();
  return;
}

