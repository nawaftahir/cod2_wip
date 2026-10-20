
int FUN_00467370(int param_1)

{
  undefined4 *puVar1;
  bool bVar2;
  char *_Str;
  long lVar3;
  int iVar4;
  undefined4 *puVar5;
  int iVar6;
  
  iVar4 = 0;
  iVar6 = 0;
  bVar2 = false;
  puVar5 = DAT_010a4414;
  if (DAT_010a4414 != (undefined4 *)0x0) {
    do {
      if (puVar5 == &DAT_010a4410) break;
      _Str = (char *)FUN_00464bb0();
      lVar3 = _atol(_Str);
      if (lVar3 != 0) {
        if (lVar3 < iVar4) {
          iVar4 = lVar3;
        }
        if (iVar6 < lVar3) {
          iVar6 = lVar3;
        }
        if (lVar3 == param_1) {
          bVar2 = true;
        }
      }
      puVar1 = puVar5 + 1;
      puVar5 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != (undefined4 *)0x0);
    if (bVar2) {
      return iVar6 + 1;
    }
  }
  return param_1;
}

