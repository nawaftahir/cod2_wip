extern unsigned int DAT_101ce5ec;
extern unsigned int DAT_101ce5ed;
extern unsigned int DAT_101ce5ee;
extern unsigned int DAT_101ce800;
extern int FUN_100080d0();
extern int FUN_10008160();
extern int FUN_100083a0();
extern int FUN_10009570();


void FUN_100092b0(int param_1,unsigned int param_2,unsigned int param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int local_4;
  
  if (DAT_101ce5ec != '\0') {
    iVar1 = *(int *)(param_1 + 0x1c);
    if ((*(int *)(iVar1 + 0x28) == 0) || (*(char *)(DAT_101ce800 + 8) == '\0')) {
      if ((DAT_101ce5ee != '\0') && (iVar3 = 0, 0 < *(int *)(iVar1 + 0x20))) {
        do {
          FUN_10009570(*(unsigned int *)(*(int *)(iVar1 + 0x24) + iVar3 * 4),param_2,param_3,0);
          iVar3 = iVar3 + 1;
        } while (iVar3 < *(int *)(iVar1 + 0x20));
      }
      local_4 = 0;
      if (0 < *(int *)(iVar1 + 0x18)) {
        do {
          FUN_100080d0(param_2,param_3);
          local_4 = local_4 + 1;
        } while (local_4 < *(int *)(iVar1 + 0x18));
      }
    }
    else {
      iVar3 = 0;
      if (0 < *(int *)(iVar1 + 0x28)) {
        iVar2 = 0;
        do {
          FUN_10008160(*(int *)(iVar1 + 0x2c) + iVar2,param_2,param_3,0);
          iVar3 = iVar3 + 1;
          iVar2 = iVar2 + 0x30;
        } while (iVar3 < *(int *)(iVar1 + 0x28));
      }
    }
  }
  if (DAT_101ce5ed != '\0') {
    FUN_100083a0(param_2,param_3);
  }
  return;
}


