
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_0043cd60(void)

{
  float fVar1;
  undefined4 *puVar2;
  float10 fVar3;
  
  if (DAT_010a44b8 == &DAT_010a44b4) {
    return (float10)_DAT_00556a70;
  }
  fVar3 = (float10)FUN_0043cc70();
  fVar1 = (float)fVar3;
  if (fVar1 != _DAT_00556a70) {
    puVar2 = (undefined4 *)DAT_010a44b8[1];
    while( true ) {
      if (puVar2 == &DAT_010a44b4) {
        return (float10)fVar1;
      }
      fVar3 = (float10)FUN_0043cc70();
      if ((float10)fVar1 != fVar3) break;
      puVar2 = (undefined4 *)puVar2[1];
    }
    return (float10)_DAT_00556a70;
  }
  return (float10)_DAT_00556a70;
}

