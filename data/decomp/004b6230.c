
undefined4 * __fastcall FUN_004b6230(int param_1)

{
  int iVar1;
  char *pcVar2;
  
  if (*(int *)(param_1 + 0x144) == 0) {
    iVar1 = FUN_004c0fe0("P4USER");
    if (iVar1 == 0) {
      iVar1 = FUN_004c3b40(param_1 + 0x140);
      if (iVar1 == 0) {
        *(undefined4 *)(param_1 + 0x144) = 0;
        FUN_004bf280("nouser");
      }
    }
    else {
      *(undefined4 *)(param_1 + 0x144) = 0;
      FUN_004bf280(iVar1);
    }
  }
  pcVar2 = _strchr(*(char **)(param_1 + 0x140),0x20);
  while (pcVar2 != (char *)0x0) {
    *pcVar2 = '_';
    pcVar2 = _strchr(*(char **)(param_1 + 0x140),0x20);
  }
  return (undefined4 *)(param_1 + 0x140);
}

