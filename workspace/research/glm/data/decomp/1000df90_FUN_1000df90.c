// 1000df90 size=230 FUN_1000df90

void FUN_1000df90(int param_1,int param_2,int param_3,undefined4 param_4)

{
  int iVar1;
  int local_8;
  int local_4;
  
  iVar1 = param_2 - param_1;
  do {
    iVar1 = iVar1 >> 2;
    if (iVar1 < 0x21) {
LAB_1000e027:
      if (1 < iVar1) {
        FUN_1000e280(param_1,param_2,param_4);
      }
      return;
    }
    if (param_3 < 1) {
      if (0x20 < iVar1) {
        if (4 < (int)(param_2 - param_1 & 0xfffffffcU)) {
          FUN_1000e570(param_4);
        }
        FUN_1000e240();
        return;
      }
      goto LAB_1000e027;
    }
    FUN_1000e080(&local_8,param_1,param_2,param_4);
    iVar1 = local_4;
    param_3 = param_3 / 2 + (param_3 / 2) / 2;
    if ((int)(local_8 - param_1 & 0xfffffffcU) < (int)(param_2 - local_4 & 0xfffffffcU)) {
      FUN_1000df90(param_1,local_8,param_3,param_4);
      param_1 = iVar1;
    }
    else {
      FUN_1000df90(local_4,param_2,param_3,param_4);
      param_2 = local_8;
    }
    iVar1 = param_2 - param_1;
  } while( true );
}


