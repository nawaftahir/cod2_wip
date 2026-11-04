
undefined4 FUN_00412060(void)

{
  char *pcVar1;
  undefined4 *in_EAX;
  int iVar2;
  int *piVar3;
  int iVar4;
  undefined **ppuVar5;
  
  pcVar1 = (char *)*in_EAX;
  if (*pcVar1 == '+') {
    iVar4 = 0;
    if (0 < DAT_00590860) {
      ppuVar5 = &PTR_s_ToggleOutlineDraw_0058fbf0;
      do {
        iVar2 = __stricmp(*ppuVar5,pcVar1 + 1);
        if (iVar2 == 0) {
          piVar3 = (int *)FUN_00501d8d();
          if (piVar3 == (int *)0x0) {
            iVar2 = 0;
          }
          else {
            iVar2 = (**(code **)(*piVar3 + 0x74))();
          }
          SendMessageA(*(HWND *)(iVar2 + 0x1c),0x111,(&DAT_0058fbfc)[iVar4 * 4],0);
          return 1;
        }
        iVar4 = iVar4 + 1;
        ppuVar5 = ppuVar5 + 4;
      } while (iVar4 < DAT_00590860);
    }
  }
  return 0;
}

