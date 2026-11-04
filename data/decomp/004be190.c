
void __thiscall FUN_004be190(int *param_1,char *param_2,undefined4 param_3)

{
  char cVar1;
  char *pcVar2;
  char *local_28;
  int local_24;
  undefined1 local_20 [32];
  
  FUN_004bf160(param_3);
  pcVar2 = param_2;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  local_24 = (int)pcVar2 - (int)(param_2 + 1);
  local_28 = param_2;
  (**(code **)(*param_1 + 8))(&local_28,local_20);
  return;
}

