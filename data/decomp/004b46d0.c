
void FUN_004b46d0(int param_1,undefined4 param_2,undefined4 param_3)

{
  int iVar1;
  uint uVar2;
  char *pcVar3;
  char *pcVar4;
  undefined4 uVar5;
  undefined1 *local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  uVar2 = *(uint *)(param_1 + 0x1c) & 0xf;
  if ((uVar2 != 1) && (uVar2 != 0xc)) {
    uVar5 = *(undefined4 *)(param_1 + 0x10);
    FUN_004becd0(&DAT_005631ec);
    FUN_004beda0(uVar5);
    return;
  }
  pcVar3 = (char *)FUN_004c0fe0("P4EDITOR");
  if (pcVar3 == (char *)0x0) {
    pcVar3 = _getenv("EDITOR");
    if (pcVar3 == (char *)0x0) {
      pcVar4 = _getenv("SHELL");
      pcVar3 = "notepad";
      if (pcVar4 != (char *)0x0) {
        pcVar3 = "vi";
      }
    }
  }
  iVar1 = *(int *)(param_1 + 0x10);
  _fflush((FILE *)&DAT_0058e770);
  FUN_004c03c0();
  local_4 = 0;
  local_8 = 0;
  local_c = &DAT_00598c80;
  FUN_004bf280(pcVar3);
  if (iVar1 != 0) {
    FUN_004bf4a0(iVar1);
  }
  FUN_004bf670(&local_c,param_3);
  FUN_004c04e0();
  if (local_c != &DAT_00598c80) {
    _free(local_c);
  }
  return;
}

