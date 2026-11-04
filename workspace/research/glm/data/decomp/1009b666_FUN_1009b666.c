// 1009b666 size=824 FUN_1009b666

undefined4 FUN_1009b666(undefined1 *param_1,undefined1 *param_2,int param_3)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  undefined1 *puVar5;
  undefined1 *puVar6;
  bool bVar7;
  undefined1 local_50 [16];
  undefined4 local_40;
  undefined4 local_38;
  undefined4 local_34;
  undefined1 local_2c [16];
  undefined4 local_1c;
  undefined4 local_14;
  undefined4 local_10;
  
  if (param_3 == 0) {
    if (param_1 == (undefined1 *)0x0) {
      if (param_2 != (undefined1 *)0x0) {
        return 0;
      }
      return 1;
    }
  }
  else if (param_1 == (undefined1 *)0x0) {
    return 1;
  }
  if (param_2 == (undefined1 *)0x0) {
    return 0;
  }
  FUN_10082e0f();
  FUN_10082e0f();
  puVar6 = param_1;
  if (*(int *)(param_1 + 4) != 9) {
    local_40 = 4;
    local_38 = 1;
    local_34 = FUN_10099b4f(param_1);
    puVar6 = local_50;
    if ((param_3 != 0) && (iVar3 = FUN_10099ad8(param_1), iVar3 != 0)) {
      local_40 = 1;
    }
  }
  puVar5 = param_2;
  if (*(int *)(param_2 + 4) != 9) {
    local_1c = 4;
    local_14 = 1;
    local_10 = FUN_10099b4f(param_2);
    puVar5 = local_2c;
    if ((param_3 != 0) && (iVar3 = FUN_10099ad8(param_2), iVar3 != 0)) {
      local_1c = 1;
    }
  }
  iVar3 = *(int *)(puVar6 + 0x10);
  if ((iVar3 == 4) || (iVar1 = *(int *)(puVar5 + 0x10), iVar1 == 4)) {
    uVar4 = *(int *)(puVar6 + 0x1c) * *(int *)(puVar6 + 0x18);
    uVar2 = *(int *)(puVar5 + 0x1c) * *(int *)(puVar5 + 0x18);
    if (param_3 == 0) {
      if (iVar3 != *(int *)(puVar5 + 0x10)) {
        return 0;
      }
      if (uVar4 - uVar2 != 0) {
        return 0;
      }
      uVar2 = 0;
      if (uVar4 == 0) {
        return 1;
      }
      do {
        iVar3 = FUN_10099f62(param_1,uVar2,local_50);
        if (iVar3 < 0) {
          return 0;
        }
        iVar3 = FUN_10099f62(param_2,uVar2,local_2c);
        if (iVar3 < 0) {
          return 0;
        }
        iVar3 = FUN_10099bdd(local_50,local_2c);
        if (iVar3 == 0) {
          return 0;
        }
        uVar2 = uVar2 + 1;
      } while (uVar2 < uVar4);
      return 1;
    }
    if (uVar2 <= uVar4 && uVar4 - uVar2 != 0) {
      return 0;
    }
    uVar2 = 0;
    if (uVar4 != 0) {
      do {
        iVar3 = FUN_10099f62(param_1,uVar2,local_50);
        if (iVar3 < 0) {
          return 0;
        }
        iVar3 = FUN_10099f62(param_2,uVar2,local_2c);
        if (iVar3 < 0) {
          return 0;
        }
        iVar3 = FUN_1009b666(local_50,local_2c,1);
        if (iVar3 == 0) {
          return 0;
        }
        uVar2 = uVar2 + 1;
      } while (uVar2 < uVar4);
    }
    return 1;
  }
  if (iVar3 != 0) {
    if (iVar3 != 1) {
      if (iVar3 == 2) {
        if (iVar1 == 0) {
          return 1;
        }
        if (iVar1 != 1) {
          if (iVar1 == 2) {
            if (*(uint *)(puVar5 + 0x18) < *(uint *)(puVar6 + 0x18)) {
              return 0;
            }
            goto LAB_1009b811;
          }
          goto joined_r0x1009b825;
        }
        uVar2 = *(uint *)(puVar6 + 0x18);
        if ((uVar2 == 1) && (*(uint *)(puVar5 + 0x1c) < *(uint *)(puVar6 + 0x1c))) {
          return 0;
        }
        iVar3 = *(int *)(puVar6 + 0x1c);
        if ((iVar3 == 1) && (*(uint *)(puVar5 + 0x1c) < uVar2)) {
          return 0;
        }
        if (uVar2 == 1) {
          return 1;
        }
        if (iVar3 == 1) {
          return 1;
        }
        bVar7 = uVar2 * iVar3 - *(int *)(puVar5 + 0x1c) == 0;
      }
      else {
        if (iVar3 != 3) {
          return 1;
        }
        if (iVar1 != 3) {
          return 0;
        }
        iVar3 = *(int *)(puVar5 + 0x14);
        if (iVar3 == 0xd) {
          return 1;
        }
        if (iVar3 == 0xf) {
          iVar3 = *(int *)(puVar6 + 0x14);
          if (iVar3 == 0xf) {
            return 1;
          }
          if (iVar3 == 0x10) {
            return 1;
          }
          if (iVar3 == 0x11) {
            return 1;
          }
          if (iVar3 == 0x12) {
            return 1;
          }
          bVar7 = iVar3 == 0x13;
        }
        else if (iVar3 == 0x14) {
          iVar3 = *(int *)(puVar6 + 0x14);
          if (iVar3 == 0x14) {
            return 1;
          }
          if (iVar3 == 0x15) {
            return 1;
          }
          if (iVar3 == 0x16) {
            return 1;
          }
          if (iVar3 == 0x17) {
            return 1;
          }
          bVar7 = iVar3 == 0x18;
        }
        else {
          bVar7 = *(int *)(puVar6 + 0x14) == iVar3;
        }
      }
LAB_1009b8b0:
      if (!bVar7) {
        return 0;
      }
      return 1;
    }
    if (iVar1 == 0) {
      return 1;
    }
    if (iVar1 == 1) {
LAB_1009b811:
      if (*(uint *)(puVar5 + 0x1c) < *(uint *)(puVar6 + 0x1c)) {
        return 0;
      }
      return 1;
    }
    if (iVar1 == 2) {
      uVar2 = *(uint *)(puVar5 + 0x18);
      if ((uVar2 == 1) && (*(uint *)(puVar5 + 0x1c) < *(uint *)(puVar6 + 0x1c))) {
        return 0;
      }
      iVar3 = *(int *)(puVar5 + 0x1c);
      if ((iVar3 == 1) && (uVar2 < *(uint *)(puVar6 + 0x1c))) {
        return 0;
      }
      if (uVar2 == 1) {
        return 1;
      }
      if (iVar3 == 1) {
        return 1;
      }
      bVar7 = uVar2 * iVar3 - *(int *)(puVar6 + 0x1c) == 0;
      goto LAB_1009b8b0;
    }
  }
joined_r0x1009b825:
  if (iVar1 == 3) {
    return 0;
  }
  return 1;
}


