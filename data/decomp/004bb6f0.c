
void FUN_004bb6f0(char *param_1)

{
  char cVar1;
  char *pcVar2;
  char *local_8;
  int local_4;
  
  pcVar2 = param_1;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  local_4 = (int)pcVar2 - (int)(param_1 + 1);
  local_8 = param_1;
  FUN_004bbcd0(&local_8);
  return;
}

