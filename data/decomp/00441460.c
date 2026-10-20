
void FUN_00441460(void)

{
  int iVar1;
  
  for (iVar1 = DAT_01244d70; iVar1 != 0; iVar1 = *(int *)(iVar1 + 0x24)) {
    *(undefined1 *)(iVar1 + 8) = 1;
  }
  FUN_0047a5b0("Showing all textures...\n");
  DAT_0123348c = DAT_0123348c | 0x10;
  return;
}

