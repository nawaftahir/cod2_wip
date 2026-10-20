
void FUN_00441600(void)

{
  int iVar1;
  int iVar2;
  
  DAT_01128da0 = 0;
  DAT_01234d65 = 0;
  DAT_01234d64 = 0;
  DAT_01234d66 = 0;
  for (iVar1 = DAT_01244d70; iVar1 != 0; iVar1 = *(int *)(iVar1 + 0x24)) {
    *(undefined1 *)(iVar1 + 8) = 0;
  }
  SendMessageA(DAT_010bcd70,0x401,0,0x549598);
  FUN_004414a0(&DAT_010a44dc);
  FUN_004414a0(&DAT_010a44b4);
  _qsort(&DAT_01234d70,DAT_01234d6c,4,FUN_004405d0);
  DAT_0123348c = DAT_0123348c | 0x10;
  iVar2 = 0;
  for (iVar1 = DAT_01244d70; iVar1 != 0; iVar1 = *(int *)(iVar1 + 0x24)) {
    if (*(char *)(iVar1 + 8) != '\0') {
      iVar2 = iVar2 + 1;
    }
  }
  FUN_0047a5b0("%d textures in use\n",iVar2);
  return;
}

