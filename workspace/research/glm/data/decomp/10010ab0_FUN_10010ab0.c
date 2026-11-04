// 10010ab0 size=43 FUN_10010ab0

uint FUN_10010ab0(void)

{
  char cVar1;
  char *in_EAX;
  uint uVar2;
  
  if (*in_EAX == '$') {
    uVar2 = FUN_100108a0();
    return uVar2;
  }
  uVar2 = FUN_1000cc10();
  cVar1 = FUN_1000fa40();
  return -(uint)(cVar1 != '\0') & uVar2;
}


