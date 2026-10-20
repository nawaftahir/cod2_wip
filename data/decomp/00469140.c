
void FUN_00469140(void)

{
  undefined *puVar1;
  int iVar2;
  float *pfVar3;
  undefined *puVar4;
  
  DAT_0109fecc = 0;
  DAT_00591ce8 = 0x48000000;
  DAT_00591cdc = 0xc8000000;
  DAT_00591cec = 0x48000000;
  DAT_00591ce0 = 0xc8000000;
  DAT_00591cf0 = 0x48000000;
  DAT_00591ce4 = 0xc8000000;
  puVar4 = DAT_010a4490;
  if (DAT_010a4490 != &DAT_010a448c) {
    do {
      puVar1 = *(undefined **)(puVar4 + 4);
      pfVar3 = (float *)(*(int *)(puVar4 + 0x14) + 0x2c);
      iVar2 = 0;
      do {
        if ((*(float *)((int)&DAT_00591ce8 + iVar2) < pfVar3[-3]) ||
           (*pfVar3 < *(float *)((int)&DAT_00591cdc + iVar2))) goto LAB_004691f6;
        iVar2 = iVar2 + 4;
        pfVar3 = pfVar3 + 1;
      } while (iVar2 < 0xc);
      FUN_004592f0();
      if ((DAT_010a44e0 == (undefined4 *)0x0) || (DAT_010a44dc == (undefined4 *)0x0)) {
        DAT_010a44e0 = &DAT_010a44dc;
        DAT_010a44dc = &DAT_010a44dc;
      }
      FUN_00459210();
LAB_004691f6:
      puVar4 = puVar1;
    } while (puVar1 != &DAT_010a448c);
  }
  DAT_0123348c = 0xffffffff;
  return;
}

