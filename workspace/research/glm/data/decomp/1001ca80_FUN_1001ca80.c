// 1001ca80 size=320 FUN_1001ca80

void FUN_1001ca80(int param_1,int param_2,int param_3,undefined4 param_4)

{
  int iVar1;
  int local_8;
  int local_4;
  
  iVar1 = param_2 - param_1;
  do {
    iVar1 = iVar1 / 0xc;
    if (iVar1 < 0x21) {
LAB_1001cb5c:
      if (1 < iVar1) {
        FUN_1001cfd0(param_1,param_2,param_4);
      }
      return;
    }
    if (param_3 < 1) {
      if (0x20 < iVar1) {
        if (1 < (param_2 - param_1) / 0xc) {
          FUN_1001d170(param_4);
        }
        FUN_1001cf30(param_4);
        return;
      }
      goto LAB_1001cb5c;
    }
    FUN_1001cbc0(&local_8,param_1,param_2,param_4);
    iVar1 = local_4;
    param_3 = param_3 / 2 + (param_3 / 2) / 2;
    if ((local_8 - param_1) / 0xc < (param_2 - local_4) / 0xc) {
      FUN_1001ca80(param_1,local_8,param_3,param_4);
      param_1 = iVar1;
    }
    else {
      FUN_1001ca80(local_4,param_2,param_3,param_4);
      param_2 = local_8;
    }
    iVar1 = param_2 - param_1;
  } while( true );
}


