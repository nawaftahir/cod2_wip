
void FUN_004b7b00(int param_1)

{
  undefined4 *puVar1;
  long lVar2;
  int iVar3;
  
  puVar1 = (undefined4 *)FUN_004be450("xfiles");
  if (puVar1 != (undefined4 *)0x0) {
    lVar2 = _atol((char *)*puVar1);
    *(long *)(param_1 + 0xb4) = lVar2;
  }
  puVar1 = (undefined4 *)FUN_004be450("server2");
  if (puVar1 == (undefined4 *)0x0) {
    puVar1 = (undefined4 *)FUN_004be450("server");
    if (puVar1 == (undefined4 *)0x0) goto LAB_004b7b57;
  }
  lVar2 = _atol((char *)*puVar1);
  *(long *)(param_1 + 0xb8) = lVar2;
LAB_004b7b57:
  puVar1 = (undefined4 *)FUN_004be450("security");
  if (puVar1 != (undefined4 *)0x0) {
    lVar2 = _atol((char *)*puVar1);
    *(long *)(param_1 + 0xc0) = lVar2;
  }
  iVar3 = FUN_004be450("nocase");
  *(uint *)(param_1 + 0xbc) = (uint)(iVar3 != 0);
  return;
}

