// 1009b490 size=291 FUN_1009b490

int FUN_1009b490(undefined4 param_1,undefined4 param_2)

{
  bool bVar1;
  int iVar2;
  uint uVar3;
  undefined1 local_60 [20];
  undefined4 local_4c;
  undefined1 local_3c [20];
  undefined4 local_28;
  int local_18;
  undefined4 local_14;
  uint local_10;
  uint local_c;
  int local_8;
  
  uVar3 = 0;
  local_18 = 0;
  local_c = FUN_10099b4f(param_1);
  local_10 = FUN_10099b4f(param_2);
  iVar2 = FUN_10099bdd(param_1,param_2);
  if (iVar2 == 0) {
    bVar1 = false;
    local_8 = 0;
    FUN_10082e0f();
    FUN_10082e0f();
    if (local_c != 0) {
      while (uVar3 < local_10) {
        iVar2 = FUN_10099f62(param_1,uVar3,local_3c);
        if (((iVar2 < 0) || (iVar2 = FUN_10099f62(param_2,uVar3,local_60), iVar2 < 0)) ||
           (iVar2 = FUN_1009a02d(local_3c,local_60,&local_14), iVar2 < 0)) {
          bVar1 = true;
          local_8 = 1;
        }
        else {
          iVar2 = FUN_10099846(local_28,local_14);
          if (iVar2 != 0) {
            bVar1 = true;
          }
          iVar2 = FUN_10099846(local_14,local_4c);
          if (iVar2 != 0) {
            local_8 = 1;
          }
        }
        if (((bVar1) && (local_8 != 0)) || (uVar3 = uVar3 + 1, local_c <= uVar3)) break;
      }
    }
    if (local_10 < local_c) {
      local_18 = 4;
    }
    if (bVar1) {
      local_18 = local_18 + 0x200;
    }
    if (local_8 != 0) {
      local_18 = local_18 + 0x10000;
    }
    if (local_c < local_10) {
      local_18 = local_18 + 0x800000;
    }
  }
  else {
    local_18 = 0;
  }
  return local_18;
}


