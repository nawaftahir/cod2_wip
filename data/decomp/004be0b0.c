
void __thiscall FUN_004be0b0(int *param_1,char *param_2,undefined4 param_3,undefined4 param_4)

{
  char cVar1;
  char *pcVar2;
  undefined4 uVar3;
  char *local_50;
  int local_4c;
  
  pcVar2 = param_2;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  local_4c = (int)pcVar2 - (int)(param_2 + 1);
  local_50 = param_2;
  uVar3 = FUN_004bdff0(&local_50,param_3);
  (**(code **)(*param_1 + 8))(uVar3,param_4);
  return;
}

