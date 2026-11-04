// 100627c0 size=305 FUN_100627c0

int FUN_100627c0(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                undefined4 param_5,uint param_6,undefined4 *param_7,int param_8,undefined4 *param_9)

{
  int iVar1;
  int iVar2;
  undefined1 local_374 [872];
  int *local_c;
  int *local_8;
  
  local_8 = (int *)0x0;
  local_c = (int *)0x0;
  FUN_10065ae3();
  if (param_7 != (undefined4 *)0x0) {
    *param_7 = 0;
  }
  if (param_9 != (undefined4 *)0x0) {
    *param_9 = 0;
  }
  if ((param_6 & 0xfffff9c0) == 0) {
    iVar1 = FUN_10066f3d(param_1,1,param_2,param_3);
    if (-1 < iVar1) {
      FUN_1006c39d();
      iVar1 = FUN_1007d48d(local_374,0,param_4,0,param_5,param_6 | 0x100,&local_8,&local_c);
      if (iVar1 < 0) {
        FUN_1006ddb3();
      }
      else {
        FUN_1006ddb3();
        iVar2 = FUN_100676fc();
        if (iVar2 == 0) {
          if (param_7 != (undefined4 *)0x0) {
            *param_7 = local_8;
            local_8 = (int *)0x0;
          }
          if (param_9 != (undefined4 *)0x0) {
            *param_9 = local_c;
            local_c = (int *)0x0;
          }
        }
        else {
          param_7 = (undefined4 *)0x88760b59;
          iVar1 = (int)param_7;
        }
      }
    }
  }
  else {
    param_7 = (undefined4 *)0x8876086c;
    iVar1 = (int)param_7;
  }
  param_7 = (undefined4 *)iVar1;
  if (param_8 != 0) {
    FUN_1006768e(param_8);
  }
  if (local_c != (int *)0x0) {
    (**(code **)(*local_c + 8))(local_c);
    local_c = (int *)0x0;
  }
  if (local_8 != (int *)0x0) {
    (**(code **)(*local_8 + 8))(local_8);
    local_8 = (int *)0x0;
  }
  FUN_10065bd0();
  return (int)param_7;
}


