


void FUN_1004fe50(int *param_1)

{
  int iVar1;
  
  iVar1 = param_1[0x62];
  if (*(char *)(iVar1 + 8) == '\0') {
    if ((*(char *)((int)param_1 + 0x52) != '\0') && (param_1[0x1f] == 0)) {
      if (((char)param_1[0x16] == '\0') || (*(char *)((int)param_1 + 0x62) == '\0')) {
        if ((char)param_1[0x18] == '\0') {
          *(unsigned int *)(*param_1 + 0x14) = 0x2e;
          (**(void **)*param_1)(param_1);
        }
        else {
          param_1[0x6c] = *(int *)(iVar1 + 0x14);
        }
      }
      else {
        param_1[0x6c] = *(int *)(iVar1 + 0x18);
        *(unsigned char *)(iVar1 + 8) = 1;
      }
    }
    (**(void **)param_1[0x69])(param_1);
    (**(void **)(param_1[100] + 8))(param_1);
    if (*(char *)((int)param_1 + 0x49) == '\0') {
      if (*(char *)(iVar1 + 0x10) == '\0') {
        (**(void **)param_1[0x6b])(param_1);
      }
      (**(void **)param_1[0x6a])(param_1);
      if (*(char *)((int)param_1 + 0x52) != '\0') {
        (**(void **)param_1[0x6c])(param_1,*(unsigned char *)(iVar1 + 8));
      }
      (**(void **)param_1[0x65])(param_1,-(*(char *)(iVar1 + 8) != '\0') & 3);
      (**(void **)param_1[99])(param_1,0);
    }
  }
  else {
    *(unsigned char *)(iVar1 + 8) = 0;
    (**(void **)param_1[0x6c])(param_1,0);
    (**(void **)param_1[0x65])(param_1,2);
    (**(void **)param_1[99])(param_1,2);
  }
  if (param_1[2] != 0) {
    *(unsigned int *)(param_1[2] + 0xc) = *(unsigned int *)(iVar1 + 0xc);
    *(unsigned int *)(param_1[2] + 0x10) = (*(char *)(iVar1 + 8) != '\0') + 1 + *(int *)(iVar1 + 0xc);
    if (((char)param_1[0x12] != '\0') && (*(char *)(param_1[0x66] + 0x11) == '\0')) {
      *(unsigned int *)(param_1[2] + 0x10) =
           *(int *)(param_1[2] + 0x10) + (*(char *)((int)param_1 + 0x62) != '\0') + 1;
    }
  }
  return;
}


