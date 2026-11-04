// 100623e3 size=228 FUN_100623e3

int FUN_100623e3(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                uint param_5,undefined4 *param_6,int param_7)

{
  int iVar1;
  int iVar2;
  undefined1 local_338 [816];
  int *local_8;
  
  local_8 = (int *)0x0;
  FUN_10065ae3();
  if (param_6 != (undefined4 *)0x0) {
    *param_6 = 0;
  }
  if ((param_5 & 0xfffffffc) == 0) {
    iVar2 = FUN_10066fbb(param_1,param_2,0,param_3,param_4);
    if (-1 < iVar2) {
      FUN_10068c26();
      iVar2 = FUN_1006be48(local_338,param_5,0,&local_8);
      FUN_1006b285();
      if (-1 < iVar2) {
        iVar1 = FUN_100676fc();
        if (iVar1 == 0) {
          if (param_6 != (undefined4 *)0x0) {
            *param_6 = local_8;
            local_8 = (int *)0x0;
          }
        }
        else {
          iVar2 = -0x7789f4a7;
        }
      }
    }
  }
  else {
    iVar2 = -0x7789f794;
  }
  if (param_7 != 0) {
    FUN_1006768e(param_7);
  }
  if (local_8 != (int *)0x0) {
    (**(code **)(*local_8 + 8))(local_8);
    local_8 = (int *)0x0;
  }
  FUN_10065bd0();
  return iVar2;
}


