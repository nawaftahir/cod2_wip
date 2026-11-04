
void __thiscall FUN_004be1e0(int *param_1,char *param_2,char *param_3)

{
  char cVar1;
  char *pcVar2;
  char *local_10;
  int local_c;
  char *local_8;
  int local_4;
  
  if (param_3 != (char *)0x0) {
    pcVar2 = param_3;
    do {
      cVar1 = *pcVar2;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    local_c = (int)pcVar2 - (int)(param_3 + 1);
    local_10 = param_3;
    pcVar2 = param_2;
    do {
      cVar1 = *pcVar2;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    local_4 = (int)pcVar2 - (int)(param_2 + 1);
    local_8 = param_2;
    (**(code **)(*param_1 + 8))(&local_8,&local_10);
  }
  return;
}

