
void __fastcall FUN_00440c10(int param_1)

{
  char *pcVar1;
  undefined4 *puVar2;
  char cVar3;
  char *in_EAX;
  int iVar4;
  undefined4 *puVar5;
  char *_Str1;
  
  if (param_1 == 0) {
    cVar3 = *in_EAX;
    _Str1 = in_EAX;
    while (cVar3 != '\0') {
      if ((cVar3 == '/') || (cVar3 == '\\')) {
        _Str1 = in_EAX + 1;
      }
      pcVar1 = in_EAX + 1;
      in_EAX = in_EAX + 1;
      cVar3 = *pcVar1;
    }
    puVar5 = DAT_01244d78;
    if (DAT_01244d78 != (undefined4 *)0x0) {
      while (iVar4 = __stricmp(_Str1,(char *)*puVar5), iVar4 != 0) {
        puVar2 = puVar5 + 2;
        puVar5 = (undefined4 *)*puVar2;
        if ((undefined4 *)*puVar2 == (undefined4 *)0x0) {
          FUN_00440840();
          return;
        }
      }
    }
  }
  FUN_00440840();
  return;
}

