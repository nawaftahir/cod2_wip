// 1008501a size=149 FUN_1008501a

int FUN_1008501a(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                undefined4 param_5,undefined4 *param_6,int param_7)

{
  int iVar1;
  int iVar2;
  undefined1 local_2b4 [688];
  
  if (param_6 != (undefined4 *)0x0) {
    *param_6 = 0;
  }
  FUN_10065ae3();
  iVar1 = FUN_10066fbb(param_1,param_2,1,param_3,param_4);
  if (-1 < iVar1) {
    iVar1 = FUN_10084946(local_2b4,param_5,param_6,param_7);
    if (-1 < iVar1) {
      iVar2 = FUN_100676fc();
      if (iVar2 != 0) {
        iVar1 = -0x7789f4a7;
      }
    }
  }
  if (param_7 != 0) {
    FUN_1006768e(param_7);
  }
  FUN_10065bd0();
  return iVar1;
}


