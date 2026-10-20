
void __fastcall FUN_004bbbf0(undefined4 *param_1)

{
  char cVar1;
  char *pcVar2;
  int iVar3;
  char *pcVar4;
  char *pcVar5;
  char *local_18;
  int local_14;
  char *local_10;
  int local_c;
  
  pcVar2 = (char *)*param_1;
  iVar3 = param_1[1];
  param_1[9] = 0;
  param_1[6] = 0;
  pcVar4 = pcVar2;
  while (local_10 = pcVar4, local_10 < pcVar2 + iVar3) {
    pcVar4 = local_10;
    do {
      cVar1 = *pcVar4;
      pcVar4 = pcVar4 + 1;
    } while (cVar1 != '\0');
    local_c = (int)pcVar4 - (int)(local_10 + 1);
    local_18 = local_10 + local_c + 5;
    local_14 = *(int *)(local_18 + -4);
    pcVar4 = local_18 + local_14 + 1;
    if (local_c == 0) {
      FUN_004c5f00(&local_18);
    }
    else {
      (**(code **)(param_1[3] + 8))(&local_10,&local_18);
    }
    if (2 < DAT_00598cdc) {
      pcVar5 = local_18;
      if (0x6d < local_14) {
        pcVar5 = "<big>";
      }
      _printf("RpcRecvBuffer %s = %s\n",local_10,pcVar5);
    }
  }
  return;
}

