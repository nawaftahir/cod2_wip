extern int FUN_1004f0e0();


unsigned int FUN_1004f600(int *param_1)

{
  char cVar1;
  
  if ((param_1[0x61] == 0) && (cVar1 = FUN_1004f0e0(param_1), cVar1 == '\0')) {
    return 0;
  }
  if (param_1[0x61] == *(int *)(param_1[0x67] + 0x10) + 0xd0) {
    *(unsigned int *)(*param_1 + 0x14) = 0x62;
    *(unsigned int *)(*param_1 + 0x18) = *(unsigned int *)(param_1[0x67] + 0x10);
    (**(void **)(*param_1 + 4))(param_1,3);
    param_1[0x61] = 0;
  }
  else {
    cVar1 = (**(void **)(param_1[8] + 0x14))(param_1,*(int *)(param_1[0x67] + 0x10));
    if (cVar1 == '\0') {
      return 0;
    }
  }
  *(unsigned int *)(param_1[0x67] + 0x10) = *(int *)(param_1[0x67] + 0x10) + 1U & 7;
  return 1;
}


