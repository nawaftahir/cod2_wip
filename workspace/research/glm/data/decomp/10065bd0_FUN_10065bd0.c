// 10065bd0 size=182 FUN_10065bd0

void FUN_10065bd0(void)

{
  char *_Locale;
  int in_ECX;
  int *piVar1;
  char *pcVar2;
  int iVar3;
  char *pcVar4;
  bool bVar5;
  
  if (*(int *)(in_ECX + 0x3c) != 0) {
    FUN_10063e11(1);
  }
  if (*(int *)(in_ECX + 0x68) != 0) {
    FUN_10063dcf(1);
  }
  if (*(int *)(in_ECX + 0x268) != 0) {
    FUN_10063b25(1);
  }
  piVar1 = (int *)(in_ECX + 0x6c);
  iVar3 = 0x7f;
  do {
    if (*piVar1 != 0) {
      FUN_10065146(1);
    }
    piVar1 = piVar1 + 1;
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  _Locale = *(char **)(in_ECX + 0x29c);
  if (_Locale != (char *)0x0) {
    iVar3 = 2;
    bVar5 = true;
    pcVar2 = _Locale;
    pcVar4 = "C";
    do {
      if (iVar3 == 0) break;
      iVar3 = iVar3 + -1;
      bVar5 = *pcVar2 == *pcVar4;
      pcVar2 = pcVar2 + 1;
      pcVar4 = pcVar4 + 1;
    } while (bVar5);
    if (!bVar5) {
      _setlocale(4,_Locale);
    }
  }
  if (*(void **)(in_ECX + 0x29c) != (void *)0x0) {
    _free(*(void **)(in_ECX + 0x29c));
  }
  __controlfp(*(uint *)(in_ECX + 0x2a0),0xb001f);
  if (*(int *)(in_ECX + 0x2a4) != 0) {
    FUN_1006518e();
  }
  FUN_10067460();
  FUN_1008269b();
  return;
}


