// 10067b01 size=74 FUN_10067b01

int FUN_10067b01(char *param_1,undefined4 *param_2)

{
  int iVar1;
  int in_ECX;
  char *pcVar2;
  undefined4 uVar3;
  
  uVar3 = 5;
  if (*(char **)(in_ECX + 4) <= param_1) {
    return 0;
  }
  iVar1 = _tolower((int)*param_1);
  if (iVar1 == 0x66) {
    uVar3 = 7;
  }
  else {
    pcVar2 = param_1;
    if (iVar1 != 0x68) goto LAB_10067b37;
    uVar3 = 6;
  }
  pcVar2 = param_1 + 1;
LAB_10067b37:
  if (param_2 != (undefined4 *)0x0) {
    *param_2 = uVar3;
  }
  return (int)pcVar2 - (int)param_1;
}


