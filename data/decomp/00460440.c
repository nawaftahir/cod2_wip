
char __fastcall FUN_00460440(int param_1)

{
  char cVar1;
  int in_EAX;
  
  if (param_1 != in_EAX) {
    cVar1 = FUN_004602e0();
    if (cVar1 == '\0') {
      cVar1 = FUN_00460400();
      return '\x01' - (cVar1 != '\0');
    }
  }
  return '\x01';
}

