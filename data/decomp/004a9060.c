
void FUN_004a9060(byte param_1)

{
  int iVar1;
  
  iVar1 = FUN_004a87b0();
  if ((param_1 & *(byte *)(iVar1 + 1)) == 0) {
    *(byte *)(iVar1 + 1) = *(byte *)(iVar1 + 1) | param_1;
    *(short *)(iVar1 + 2) = *(short *)(iVar1 + 2) + 1;
  }
  return;
}

