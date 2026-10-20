
float10 FUN_004acea0(int param_1)

{
  int iVar1;
  
  iVar1 = *(short *)(param_1 + 0x7c) + -1;
  if (*(char *)(&DAT_01233438 + *(short *)(param_1 + 0x7c) * 2) == '\0') {
    return (float10)*(float *)(param_1 + 4 + iVar1 * 0x14);
  }
  return (float10)*(float *)(&DAT_01233444 + iVar1 * 8);
}

