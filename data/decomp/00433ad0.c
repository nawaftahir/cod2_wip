
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00433ad0(void)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 *puVar3;
  
  if (DAT_012334ba != '\0') {
    DAT_012334ba = 0;
    if (DAT_012335bc != 0) {
      CWnd::ShowWindow((CWnd *)&DAT_012335a0,0);
    }
    FUN_0041b190();
    return;
  }
  puVar1 = (undefined4 *)FUN_00433a80();
  if (puVar1 == (undefined4 *)0x0) {
    FUN_0047a5b0("Must bend a single patch");
    return;
  }
  if ((*(byte *)(puVar1 + 4) & 0x40) != 0) {
    FUN_0047a5b0("Patch_BendToggle: Bending of terrain curves not implemented\n");
    return;
  }
  _DAT_0109c538 = *puVar1;
  _DAT_0109c53c = puVar1[1];
  _DAT_0109c548 = puVar1[4];
  puVar1 = puVar1 + 9;
  puVar3 = &DAT_0109c55c;
  for (iVar2 = 0xe00; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = *puVar1;
    puVar1 = puVar1 + 1;
    puVar3 = puVar3 + 1;
  }
  DAT_012334ba = 1;
  DAT_005909fc = 0;
  DAT_00590a04 = 1;
  DAT_012334c0 = 1;
  FUN_00409690();
  return;
}

