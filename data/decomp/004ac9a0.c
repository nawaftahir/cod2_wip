
int __fastcall FUN_004ac9a0(undefined4 param_1)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  
  iVar2 = FUN_004abb70(param_1);
  if (iVar2 == 0) {
    return 0;
  }
  if (DAT_0059c4dc != 0) {
    cVar1 = FUN_004ac8d0();
    if (cVar1 == '\0') {
      FUN_004aa7a0();
      return 0;
    }
    uVar3 = FUN_004ac430(iVar2);
    *(undefined4 *)(iVar2 + 0x80) = uVar3;
  }
  return iVar2;
}

