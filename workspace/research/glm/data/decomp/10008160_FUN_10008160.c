// 10008160 size=451 FUN_10008160

void FUN_10008160(int param_1,undefined4 param_2,undefined4 param_3,int param_4)

{
  char cVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int local_8;
  
  cVar1 = FUN_100064b0(param_4);
  if (cVar1 == '\0') {
    cVar1 = FUN_100065c0(param_4);
    if (cVar1 == '\0') {
      if ((DAT_101ce5ee != '\0') && (iVar5 = 0, 0 < *(int *)(param_1 + 0x20))) {
        do {
          FUN_10009480(*(undefined4 *)(*(int *)(param_1 + 0x24) + iVar5 * 4));
          iVar5 = iVar5 + 1;
        } while (iVar5 < *(int *)(param_1 + 0x20));
      }
      local_8 = 0;
      if (0 < *(int *)(param_1 + 0x18)) {
        iVar5 = *(int *)(param_1 + 0x1c) * 4;
        iVar4 = *(int *)(param_1 + 0x1c) * 0xc;
        iVar2 = DAT_101d7e98;
        iVar3 = DAT_10678500;
        do {
          if (*(int *)(iVar5 + iVar2) != iVar3) {
            *(int *)(iVar5 + iVar2) = iVar3;
            FUN_10024380(*(undefined4 *)(*(int *)(DAT_101d1b9c + 0x14) + 8 + iVar4));
            iVar2 = DAT_101d7e98;
            iVar3 = DAT_10678500;
          }
          local_8 = local_8 + 1;
          iVar5 = iVar5 + 4;
          iVar4 = iVar4 + 0xc;
        } while (local_8 < *(int *)(param_1 + 0x18));
        return;
      }
    }
    else if (*(int *)(param_1 + 0x28) == 0) {
      if ((DAT_101ce5ee != '\0') && (iVar5 = 0, 0 < *(int *)(param_1 + 0x20))) {
        do {
          FUN_10009570(*(undefined4 *)(*(int *)(param_1 + 0x24) + iVar5 * 4),param_2,param_3,
                       param_4 + 1);
          iVar5 = iVar5 + 1;
        } while (iVar5 < *(int *)(param_1 + 0x20));
      }
      local_8 = 0;
      if (0 < *(int *)(param_1 + 0x18)) {
        do {
          FUN_100080d0(param_2,param_3);
          local_8 = local_8 + 1;
        } while (local_8 < *(int *)(param_1 + 0x18));
      }
    }
    else {
      local_8 = 0;
      if (0 < *(int *)(param_1 + 0x28)) {
        iVar5 = 0;
        do {
          FUN_10008160(*(int *)(param_1 + 0x2c) + iVar5,param_2,param_3,param_4 + 1);
          local_8 = local_8 + 1;
          iVar5 = iVar5 + 0x30;
        } while (local_8 < *(int *)(param_1 + 0x28));
        return;
      }
    }
  }
  return;
}


