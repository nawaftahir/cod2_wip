
void __fastcall FUN_004a98f0(undefined4 param_1,char *param_2,undefined4 param_3)

{
  char cVar1;
  char *pcVar2;
  
  pcVar2 = param_2;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  FUN_004a9080(param_2,param_3,pcVar2 + (1 - (int)(param_2 + 1)),6);
  return;
}

