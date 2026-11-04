// 100a0337 size=897 FUN_100a0337

int FUN_100a0337(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  int in_ECX;
  undefined1 local_5c [16];
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_30;
  int local_1c;
  int local_18;
  int local_14;
  int local_10;
  int local_c;
  int local_8;
  
  local_18 = 0;
  iVar1 = FUN_10099913();
  local_1c = iVar1;
  FUN_1008300b();
  if (iVar1 == 0) {
    return 0;
  }
  if (param_1 == 0) {
    return 0;
  }
  local_14 = *(int *)(iVar1 + 0x18);
  local_8 = param_1 + 0x10;
  if ((*(byte *)(iVar1 + 0x10) & 0x40) != 0) {
    FUN_100994dd();
  }
  if ((*(byte *)(iVar1 + 0x10) & 1) != 0) {
    FUN_100994dd();
  }
  iVar1 = FUN_10099ad8(local_14);
  if (iVar1 == 0) {
    FUN_100994dd();
  }
  local_10 = 0;
  for (iVar1 = param_2; iVar1 != 0; iVar1 = *(int *)(iVar1 + 0xc)) {
    if ((*(int *)(iVar1 + 8) != 0) && (*(int *)(*(int *)(iVar1 + 8) + 4) == 6)) {
      iVar2 = *(int *)(iVar1 + 0xc);
      if ((iVar2 == 0) || (*(int *)(*(int *)(iVar2 + 8) + 4) != 0xc)) {
        if (local_10 != 0) {
          FUN_100994dd();
        }
      }
      else {
        local_10 = 1;
        iVar1 = iVar2;
      }
    }
  }
  iVar1 = FUN_1006506e(0x14);
  if (iVar1 == 0) {
    local_10 = 0;
  }
  else {
    local_10 = FUN_10082872(0,0,"Stmts");
  }
  if (local_10 == 0) {
    return 0;
  }
  iVar1 = FUN_1006506e(0x30);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10082c4b(2,0,0,0);
  }
  if (iVar1 == 0) {
    return 0;
  }
  *(int *)(local_10 + 8) = iVar1;
  local_c = iVar1;
  iVar2 = FUN_10082816(param_1);
  *(int *)(iVar1 + 0x14) = iVar2;
  if (iVar2 == 0) {
    return 0;
  }
  iVar2 = FUN_1006506e(0x40);
  if (iVar2 == 0) {
    iVar2 = 0;
  }
  else {
    iVar2 = FUN_10082eb4();
  }
  if (iVar2 == 0) {
    return 0;
  }
  *(int *)(iVar1 + 0x18) = iVar2;
  *(undefined4 *)(iVar2 + 0x18) = *(undefined4 *)(local_1c + 0x10);
  if (*(int *)(local_1c + 0x14) != 0) {
    iVar1 = FUN_10082816(*(int *)(local_1c + 0x14));
    *(int *)(iVar2 + 0x1c) = iVar1;
    if (iVar1 == 0) {
      return 0;
    }
  }
  if (local_14 != 0) {
    iVar1 = FUN_10082816(local_14);
    *(int *)(iVar2 + 0x20) = iVar1;
    if (iVar1 == 0) {
      return 0;
    }
  }
  FUN_1009991f(*(undefined4 *)(iVar2 + 0x20),1);
  if (param_3 != 0) {
    if (*(int *)(iVar2 + 0x20) == 0) {
      FUN_100994dd();
      param_3 = 0;
    }
    if (param_3 != 0) {
      iVar1 = FUN_10082816(param_3);
      *(int *)(iVar2 + 0x34) = iVar1;
      if (iVar1 == 0) {
        return 0;
      }
      do {
        iVar1 = *(int *)(param_3 + 8);
        if ((iVar1 != 0) && (*(int *)(iVar1 + 4) == 3)) {
          iVar1 = FUN_10082816(iVar1);
          *(int *)(iVar2 + 0x30) = iVar1;
          if (iVar1 == 0) {
            return 0;
          }
        }
        param_3 = *(int *)(param_3 + 0xc);
      } while (param_3 != 0);
    }
  }
  if ((param_2 != 0) && (*(int *)(param_2 + 8) != 0)) {
    iVar1 = FUN_10082816(param_2);
    *(int *)(iVar2 + 0x24) = iVar1;
    if (iVar1 == 0) {
      return 0;
    }
  }
  iVar3 = FUN_1009e0fb(2,local_8,*(undefined4 *)(iVar2 + 0x1c),*(undefined4 *)(iVar2 + 0x24),
                       *(undefined4 *)(*(int *)(in_ECX + 0x10) + 0x20),10,&param_2,&local_18);
  iVar1 = param_2;
  if (-1 < iVar3) {
    if (iVar3 == 0) {
      iVar3 = FUN_10099bdd(*(undefined4 *)(iVar2 + 0x20),*(undefined4 *)(param_2 + 0x20));
      if (iVar3 == 0) goto LAB_100a05c4;
      *(undefined4 *)(iVar2 + 0x10) = *(undefined4 *)(iVar1 + 0x10);
      *(undefined4 *)(iVar2 + 0x14) = *(undefined4 *)(iVar1 + 0x14);
      *(undefined4 *)(local_c + 0x24) = *(undefined4 *)(*(int *)(local_18 + 8) + 0x18);
    }
    else {
      *(undefined4 *)(iVar2 + 0x10) = *(undefined4 *)(in_ECX + 0x58);
      iVar3 = FUN_10099b4f(*(undefined4 *)(iVar2 + 0x20));
      *(int *)(iVar2 + 0x14) = iVar3;
      *(int *)(in_ECX + 0x58) = *(int *)(in_ECX + 0x58) + iVar3;
    }
    local_4c = *(undefined4 *)(iVar2 + 0x10);
    local_48 = *(undefined4 *)(iVar2 + 0x14);
    local_40 = 0;
    local_44 = 3;
    local_3c = FUN_10082816(*(undefined4 *)(iVar2 + 0x20));
    local_30 = FUN_10082816(param_3);
    FUN_1009991f(local_3c,0);
    uVar4 = FUN_1009e7b8(param_1,local_5c);
    *(undefined4 *)(iVar2 + 0x2c) = uVar4;
    if (iVar1 == 0) {
      iVar1 = *(int *)(in_ECX + 0x10);
      *(undefined4 *)(in_ECX + 0x10) = *(undefined4 *)(iVar1 + 0x20);
      iVar3 = FUN_1009ab7f(local_c,0);
      *(int *)(in_ECX + 0x10) = iVar1;
      if (iVar3 < 0) {
        return 0;
      }
      *(int *)(in_ECX + 0x54) = *(int *)(in_ECX + 0x54) + 1;
    }
    *(undefined4 *)(*(int *)(in_ECX + 0x10) + 0x14) = *(undefined4 *)(local_8 + 8);
    *(int *)(in_ECX + 0x18) = iVar2;
    return local_10;
  }
LAB_100a05c4:
  FUN_100994dd();
  return 0;
}


