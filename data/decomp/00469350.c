
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00469350(void)

{
  int iVar1;
  
  FUN_00469140();
  iVar1 = *(int *)(DAT_01233488 + 0x788);
  DAT_00591cdc = *(float *)(iVar1 + 0x70) -
                 ((float)*(int *)(iVar1 + 0x58) * (float)_DAT_00556ab8) / *(float *)(iVar1 + 0x60);
  iVar1 = *(int *)(DAT_01233488 + 0x788);
  DAT_00591ce8 = ((float)*(int *)(iVar1 + 0x58) * (float)_DAT_00556ab8) / *(float *)(iVar1 + 0x60) +
                 *(float *)(iVar1 + 0x70);
  iVar1 = *(int *)(DAT_01233488 + 0x788);
  DAT_00591ce0 = *(float *)(iVar1 + 0x74) -
                 ((float)*(int *)(iVar1 + 0x5c) * (float)_DAT_00556ab8) / *(float *)(iVar1 + 0x60);
  iVar1 = *(int *)(DAT_01233488 + 0x788);
  DAT_00591cec = ((float)*(int *)(iVar1 + 0x5c) * (float)_DAT_00556ab8) / *(float *)(iVar1 + 0x60) +
                 *(float *)(iVar1 + 0x74);
  DAT_00591ce4 = 0x48000000;
  DAT_00591cf0 = 0x48000000;
  FUN_00469210();
  return;
}

