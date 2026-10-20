
void FUN_00469210(void)

{
  undefined4 *puVar1;
  int iVar2;
  float *pfVar3;
  undefined4 *puVar4;
  
  DAT_0109fecc = 1;
  puVar4 = DAT_010a44e0;
  if (DAT_010a44e0 != &DAT_010a44dc) {
    do {
      puVar1 = (undefined4 *)puVar4[1];
      pfVar3 = (float *)(puVar4[5] + 0x2c);
      iVar2 = 0;
      do {
        if ((*(float *)((int)&DAT_00591ce8 + iVar2) < pfVar3[-3]) ||
           (*pfVar3 < *(float *)((int)&DAT_00591cdc + iVar2))) {
          FUN_004592f0();
          FUN_00459210();
          break;
        }
        iVar2 = iVar2 + 4;
        pfVar3 = pfVar3 + 1;
      } while (iVar2 < 0xc);
      puVar4 = puVar1;
    } while (puVar1 != &DAT_010a44dc);
  }
  DAT_0123348c = 0xffffffff;
  return;
}

