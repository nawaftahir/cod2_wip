extern int FUN_100463d0();
extern int FUN_100464c0();


void FUN_10046690(int *param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = param_1[0x51];
  iVar2 = *(int *)(iVar1 + 0x10);
  if (iVar2 == 0) {
    FUN_100463d0();
    FUN_100464c0();
    if ((char)param_1[0x2e] == '\0') {
      (**(void **)param_1[0x56])(param_1);
      (**(void **)param_1[0x57])(param_1);
      (**(void **)param_1[0x53])(param_1,0);
    }
    (**(void **)param_1[0x58])(param_1);
    (**(void **)param_1[0x59])(param_1,*(unsigned char *)((int)param_1 + 0xba));
    (**(void **)param_1[0x54])(param_1,(*(int *)(iVar1 + 0x18) < 2) - 1U & 3);
    (**(void **)param_1[0x52])(param_1,0);
    *(unsigned char *)(iVar1 + 0xc) = *(char *)((int)param_1 + 0xba) == '\0';
  }
  else {
    if (iVar2 == 1) {
      FUN_100463d0();
      FUN_100464c0();
      if (((param_1[0x4d] != 0) || (param_1[0x4f] == 0)) || (*(char *)((int)param_1 + 0xb9) != '\0')
         ) {
        (**(void **)param_1[0x59])(param_1,1);
        (**(void **)param_1[0x54])(param_1,2);
        *(unsigned char *)(iVar1 + 0xc) = 0;
        goto LAB_100467f7;
      }
      *(unsigned int *)(iVar1 + 0x10) = 2;
      *(int *)(iVar1 + 0x14) = *(int *)(iVar1 + 0x14) + 1;
    }
    else if (iVar2 != 2) {
      *(unsigned int *)(*param_1 + 0x14) = 0x30;
      (**(void **)*param_1)(param_1);
      goto LAB_100467f7;
    }
    if (*(char *)((int)param_1 + 0xba) == '\0') {
      FUN_100463d0();
      FUN_100464c0();
    }
    (**(void **)param_1[0x59])(param_1,0);
    (**(void **)param_1[0x54])(param_1,2);
    if (*(int *)(iVar1 + 0x1c) == 0) {
      (**(void **)(param_1[0x55] + 4))(param_1);
    }
    (**(void **)(param_1[0x55] + 8))(param_1);
    *(unsigned char *)(iVar1 + 0xc) = 0;
  }
LAB_100467f7:
  *(unsigned char *)(iVar1 + 0xd) = *(int *)(iVar1 + 0x14) == *(int *)(iVar1 + 0x18) + -1;
  if (param_1[2] != 0) {
    *(int *)(param_1[2] + 0xc) = *(int *)(iVar1 + 0x14);
    *(unsigned int *)(param_1[2] + 0x10) = *(unsigned int *)(iVar1 + 0x18);
  }
  return;
}


