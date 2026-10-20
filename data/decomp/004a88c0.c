
char * FUN_004a88c0(void)

{
  int in_EAX;
  int *piVar1;
  char *pcVar2;
  
  if (in_EAX == 0) {
    return "<NULL>";
  }
  piVar1 = (int *)FUN_004a87b0();
  pcVar2 = (char *)(piVar1 + 1);
  if (*(char *)((*piVar1 - 1U & 0xff) + (int)pcVar2) != '\0') {
    pcVar2 = "<BINARY>";
  }
  return pcVar2;
}

