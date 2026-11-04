// 100862e1 size=37 FUN_100862e1

char * FUN_100862e1(int param_1)

{
  char *pcVar1;
  int in_ECX;
  
  pcVar1 = "input";
  if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(param_1 + 4) * 4) + 4) & 0x20) != 0) {
    pcVar1 = "output";
  }
  return pcVar1;
}


