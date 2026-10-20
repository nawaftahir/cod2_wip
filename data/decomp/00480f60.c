
void FUN_00480f60(void)

{
  undefined4 *puVar1;
  int in_EAX;
  undefined *puVar2;
  int iVar3;
  char *pcVar4;
  int iVar5;
  
  if (*(char *)(DAT_01143488 + 8) != '\0') {
    FUN_00408f20("    localized assets are being ignored\n");
  }
  FUN_00408f20("Current search path:\n");
  for (puVar1 = DAT_01233508; puVar1 != (undefined4 *)0x0; puVar1 = (undefined4 *)*puVar1) {
    if (((in_EAX == 0) || (puVar1[3] == 0)) || (*(char *)(DAT_01143488 + 8) == '\0')) {
      iVar3 = puVar1[1];
      if (iVar3 == 0) {
        iVar3 = puVar1[2];
        iVar5 = iVar3 + 0x100;
        pcVar4 = "%s/%s\n";
      }
      else {
        iVar5 = *(int *)(iVar3 + 0x304);
        pcVar4 = "%s (%i files)\n";
      }
      FUN_00408f20(pcVar4,iVar3,iVar5);
    }
  }
  FUN_00408f20("\nFile Handles:\n");
  iVar3 = 1;
  puVar2 = &DAT_011437f0;
  do {
    if (*(int *)(puVar2 + -0x1c) != 0) {
      FUN_00408f20("handle %i: %s\n",iVar3,puVar2);
    }
    puVar2 = puVar2 + 0x11c;
    iVar3 = iVar3 + 1;
  } while ((int)puVar2 < 0x1147dd4);
  return;
}

