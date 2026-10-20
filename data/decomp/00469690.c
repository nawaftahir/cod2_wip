
void FUN_00469690(undefined4 param_1)

{
  undefined4 *puVar1;
  char *_Str;
  int iVar2;
  long lVar3;
  int iVar4;
  undefined4 *puVar5;
  
  iVar4 = 0;
  puVar5 = DAT_010a4414;
  if (DAT_010a4414 != &DAT_010a4410) {
    do {
      _Str = (char *)FUN_00464bb0();
      if ((_Str == (char *)0x0) && (DAT_0124a323 == '\0')) {
        iVar2 = FUN_0047d980(&DAT_0054eeac,".\\map.cpp",0x31a,0,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a323 = '\x01';
        }
      }
      if ((*_Str != '\0') && (lVar3 = _atol(_Str), iVar4 < lVar3)) {
        iVar4 = lVar3;
      }
      puVar1 = puVar5 + 1;
      puVar5 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a4410);
  }
  FUN_004075c0(param_1,&DAT_00545f4c,iVar4 + 1);
  return;
}

