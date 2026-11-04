
void FUN_0042f5d0(void)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 *puVar3;
  bool bVar4;
  
  iVar2 = DAT_011298b0;
  bVar4 = DAT_011298b0 == 0xb;
  DAT_011298b0 = 0;
  if (bVar4) {
    FUN_0041b190();
  }
  else if (iVar2 == 10) {
    FUN_0042beb0();
  }
  DAT_011298b4 = 0;
  puVar3 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      if (puVar3[8] != 0) {
        *(undefined1 *)(puVar3[8] + 6) = 0;
      }
      puVar1 = puVar3 + 1;
      puVar3 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
  }
  if (DAT_012334ba != '\0') {
    FUN_00433ad0();
  }
  if (DAT_012334b9 == '\0') {
    return;
  }
  FUN_00434040();
  return;
}

