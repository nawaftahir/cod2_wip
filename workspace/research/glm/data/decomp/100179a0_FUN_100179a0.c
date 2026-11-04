// 100179a0 size=230 FUN_100179a0

void FUN_100179a0(int param_1,int param_2,int param_3,undefined4 param_4)

{
  int iVar1;
  int local_8;
  int local_4;
  
  iVar1 = param_2 - param_1;
  do {
    iVar1 = iVar1 >> 2;
    if (iVar1 < 0x21) {
LAB_10017a37:
      if (1 < iVar1) {
        FUN_10017c90(param_1,param_2,param_4);
      }
      return;
    }
    if (param_3 < 1) {
      if (0x20 < iVar1) {
        if (4 < (int)(param_2 - param_1 & 0xfffffffcU)) {
          FUN_10017f80(param_4);
        }
        FUN_10017c50();
        return;
      }
      goto LAB_10017a37;
    }
    FUN_10017a90(&local_8,param_1,param_2,param_4);
    iVar1 = local_4;
    param_3 = param_3 / 2 + (param_3 / 2) / 2;
    if ((int)(local_8 - param_1 & 0xfffffffcU) < (int)(param_2 - local_4 & 0xfffffffcU)) {
      FUN_100179a0(param_1,local_8,param_3,param_4);
      param_1 = iVar1;
    }
    else {
      FUN_100179a0(local_4,param_2,param_3,param_4);
      param_2 = local_8;
    }
    iVar1 = param_2 - param_1;
  } while( true );
}


