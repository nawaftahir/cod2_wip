// 10015090 size=68 FUN_10015090

char * FUN_10015090(void)

{
  char cVar1;
  undefined1 *in_EAX;
  char *pcVar2;
  undefined4 uVar3;
  undefined4 *unaff_EBX;
  
  *(undefined1 *)(unaff_EBX + 1) = *in_EAX;
  pcVar2 = in_EAX + 1;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  if ((int)pcVar2 - (int)(in_EAX + 2) != 0) {
    uVar3 = FUN_1000d200(1);
    *unaff_EBX = uVar3;
    return in_EAX + 1 + ((int)pcVar2 - (int)(in_EAX + 2)) + 1;
  }
  *unaff_EBX = 0;
  return in_EAX + 2;
}


