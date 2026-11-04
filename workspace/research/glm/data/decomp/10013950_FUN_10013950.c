// 10013950 size=236 FUN_10013950

void FUN_10013950(int param_1,int param_2,int param_3,undefined4 param_4)

{
  int iVar1;
  int local_8;
  int local_4;
  
  iVar1 = param_2 - param_1;
  do {
    iVar1 = iVar1 >> 4;
    if (iVar1 < 0x21) {
LAB_100139e7:
      if (1 < iVar1) {
        FUN_10013e90(param_1,param_2,param_4);
      }
      return;
    }
    if (param_3 < 1) {
      if (0x20 < iVar1) {
        if (0x10 < (int)(param_2 - param_1 & 0xfffffff0U)) {
          FUN_10014040(param_4);
        }
        FUN_10013e50(param_4);
        return;
      }
      goto LAB_100139e7;
    }
    FUN_10013a40(&local_8,param_1,param_2,param_4);
    iVar1 = local_4;
    param_3 = param_3 / 2 + (param_3 / 2) / 2;
    if ((int)(local_8 - param_1 & 0xfffffff0U) < (int)(param_2 - local_4 & 0xfffffff0U)) {
      FUN_10013950(param_1,local_8,param_3,param_4);
      param_1 = iVar1;
    }
    else {
      FUN_10013950(local_4,param_2,param_3,param_4);
      param_2 = local_8;
    }
    iVar1 = param_2 - param_1;
  } while( true );
}


