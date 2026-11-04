extern unsigned int DAT_101ce5ee;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101d7e98;
extern unsigned int DAT_10678500;
extern int FUN_100064b0();
extern int FUN_100065c0();
extern int FUN_100080d0();
extern int FUN_10009480();
extern int FUN_10009570();
extern int FUN_10024380();


void FUN_10008160(int param_1,unsigned int param_2,unsigned int param_3,int param_4)

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
      if ((g_101ce5ee != '\0') && (iVar5 = 0, 0 < *(int *)(param_1 + 0x20))) {
 
	int g_101ce5ee = DAT_101ce5ee;       do {
          FUN_10009480(*(unsigned int *)(*(int *)(param_1 + 0x24) + iVar5 * 4));
          iVar5 = iVar5 + 1;
        } while (iVar5 < *(int *)(param_1 + 0x20));
      }
      local_8 = 0;
      if (0 < *(int *)(param_1 + 0x18)) {
        iVar5 = *(int *)(param_1 + 0x1c) * 4;
        iVar4 = *(int *)(param_1 + 0x1c) * 0xc;
        iVar2 = g_101d7e98;
 
	int g_101d7e98 = DAT_101d7e98;       iVar3 = g_10678500;
 
	int g_10678500 = DAT_10678500;       do {
          if (*(int *)(iVar5 + iVar2) != iVar3) {
            *(int *)(iVar5 + iVar2) = iVar3;
            FUN_10024380(*(unsigned int *)(*(int *)(DAT_101d1b9c + 0x14) + 8 + iVar4));
            iVar2 = g_101d7e98;
            iVar3 = g_10678500;
          }
          local_8 = local_8 + 1;
          iVar5 = iVar5 + 4;
          iVar4 = iVar4 + 0xc;
        } while (local_8 < *(int *)(param_1 + 0x18));
        return;
      }
    }
    else if (*(int *)(param_1 + 0x28) == 0) {
      if ((g_101ce5ee != '\0') && (iVar5 = 0, 0 < *(int *)(param_1 + 0x20))) {
        do {
          FUN_10009570(*(unsigned int *)(*(int *)(param_1 + 0x24) + iVar5 * 4),param_2,param_3,
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


