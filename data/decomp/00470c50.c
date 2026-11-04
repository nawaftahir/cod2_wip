
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00470c50(void)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  float10 fVar3;
  float local_24 [7];
  float local_8;
  
  if (*(int *)(DAT_01233b64 + 0x248) != 0) {
    FUN_00470c00();
    return;
  }
  FUN_00470a50();
  iVar1 = 0;
  do {
    local_8 = ((*(float *)((int)local_24 + iVar1 + 0xc) + *(float *)((int)local_24 + iVar1)) *
              _DAT_00556b30) / (float)DAT_010bcd2c;
    fVar3 = (float10)FUN_004d7630((double)local_8);
    local_24[6] = (float)fVar3;
    iVar2 = iVar1 + 4;
    *(float *)(iVar1 + in_EAX) = (float)DAT_010bcd2c * local_24[6];
    iVar1 = iVar2;
  } while (iVar2 < 0xc);
  return;
}

