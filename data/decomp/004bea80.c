
void __thiscall FUN_004bea80(int param_1,undefined4 param_2)

{
  int iVar1;
  char *pcVar2;
  int local_8;
  int local_4;
  
  if (*(char **)(param_1 + 100) != (char *)0x0) {
    pcVar2 = _strchr(*(char **)(param_1 + 100),0x25);
    *(char **)(param_1 + 100) = pcVar2;
    while (pcVar2 != (char *)0x0) {
      iVar1 = *(int *)(param_1 + 100);
      pcVar2 = (char *)(iVar1 + 1);
      *(char **)(param_1 + 100) = pcVar2;
      if (*pcVar2 != '%') break;
      pcVar2 = (char *)(iVar1 + 2);
      *(char **)(param_1 + 100) = pcVar2;
      pcVar2 = _strchr(pcVar2,0x25);
      *(char **)(param_1 + 100) = pcVar2;
    }
    if ((*(char **)(param_1 + 100) != (char *)0x0) &&
       (pcVar2 = _strchr(*(char **)(param_1 + 100),0x25), pcVar2 != (char *)0x0)) {
      local_8 = *(int *)(param_1 + 100);
      local_4 = (int)pcVar2 - local_8;
      FUN_004be7d0(&local_8,param_2);
      *(char **)(param_1 + 100) = pcVar2 + 1;
    }
  }
  return;
}

