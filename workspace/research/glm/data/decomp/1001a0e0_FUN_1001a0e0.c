// 1001a0e0 size=104 FUN_1001a0e0

bool FUN_1001a0e0(void)

{
  short *psVar1;
  undefined1 uVar2;
  char cVar3;
  undefined2 *in_EAX;
  int in_ECX;
  
  psVar1 = *(short **)(in_ECX + 0xc);
  *(undefined1 *)(in_ECX + 4) = 0;
  if (*psVar1 == 1) {
    *(char *)(in_ECX + 5) = (char)psVar1[4];
  }
  else {
    *(undefined1 *)(in_ECX + 5) = 1;
  }
  switch(psVar1[1]) {
  case 3:
    uVar2 = FUN_10019ed0();
    return (bool)uVar2;
  default:
    return false;
  case 10:
  case 0xc:
  case 0xd:
  case 0xe:
    *in_EAX = 3;
    cVar3 = FUN_10019700();
    return cVar3 != '\0';
  }
}


