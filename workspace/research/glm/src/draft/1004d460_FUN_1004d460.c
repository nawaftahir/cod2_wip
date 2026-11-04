extern int FUN_1004cfa0();
extern int FUN_1004d400();


int FUN_1004d460(int *param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = param_1[0x66];
  if (*(char *)(iVar1 + 0x11) != '\0') {
    return 2;
  }
  iVar2 = (**(void **)(param_1[0x67] + 4))(param_1);
  if (iVar2 == 1) {
    if (*(char *)(iVar1 + 0x14) != '\0') {
      FUN_1004cfa0();
      *(unsigned char *)(iVar1 + 0x14) = 0;
      return 1;
    }
    if (*(char *)(iVar1 + 0x10) == '\0') {
      *(unsigned int *)(*param_1 + 0x14) = 0x23;
      (**(void **)*param_1)(param_1);
    }
    FUN_1004d400(param_1);
  }
  else if (iVar2 == 2) {
    *(unsigned char *)(iVar1 + 0x11) = 1;
    if (*(char *)(iVar1 + 0x14) == '\0') {
      if (param_1[0x21] < param_1[0x23]) {
        param_1[0x23] = param_1[0x21];
        return 2;
      }
    }
    else if (*(char *)(param_1[0x67] + 0xd) != '\0') {
      *(unsigned int *)(*param_1 + 0x14) = 0x3b;
      (**(void **)*param_1)(param_1);
      return 2;
    }
  }
  return iVar2;
}


