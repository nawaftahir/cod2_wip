
int __fastcall FUN_00496590(char *param_1,char *param_2)

{
  char cVar1;
  char cVar2;
  int in_EAX;
  
  while( true ) {
    cVar1 = *param_2;
    cVar2 = *param_1;
    param_2 = param_2 + 1;
    param_1 = param_1 + 1;
    if (in_EAX == 0) {
      return 0;
    }
    if (cVar1 != cVar2) break;
    in_EAX = in_EAX + -1;
    if (cVar1 == '\0') {
      return 0;
    }
  }
  return (uint)(cVar2 <= cVar1) * 2 + -1;
}

