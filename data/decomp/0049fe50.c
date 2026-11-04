
undefined4 __fastcall FUN_0049fe50(char *param_1,char *param_2)

{
  char cVar1;
  char cVar2;
  int in_EAX;
  
  do {
    cVar1 = *param_2;
    cVar2 = *param_1;
    param_2 = param_2 + 1;
    param_1 = param_1 + 1;
    if (in_EAX == 0) {
      return 0;
    }
    if (cVar1 < cVar2) {
      return 0xffffffff;
    }
    if (cVar2 < cVar1) {
      return 1;
    }
    in_EAX = in_EAX + -1;
  } while (cVar1 != '\0');
  return 0;
}

