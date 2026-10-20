
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00434040(void)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 *puVar3;
  
  if (DAT_012334b9 != '\0') {
    DAT_012334b9 = 0;
    if (DAT_012335bc != 0) {
      CWnd::ShowWindow((CWnd *)&DAT_012335a0,0);
    }
    FUN_0041b190();
    return;
  }
  puVar1 = (undefined4 *)FUN_00433a80();
  if (puVar1 == (undefined4 *)0x0) {
    FUN_0047a5b0("Must work with a single patch");
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
  DAT_012334b9 = 1;
  _DAT_00590a00 = 0;
  DAT_00590a04 = 1;
  DAT_012334c0 = 0;
  FUN_00409690();
  return;
}

