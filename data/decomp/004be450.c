
void __thiscall FUN_004be450(int *param_1,char *param_2)

{
  char cVar1;
  char *pcVar2;
  char *local_8;
  int local_4;
  
  pcVar2 = param_2;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  local_4 = (int)pcVar2 - (int)(param_2 + 1);
  local_8 = param_2;
  (**(code **)(*param_1 + 4))(&local_8);
  return;
}

