// 100b5dbc size=321 FUN_100b5dbc

uint FUN_100b5dbc(void)

{
  uint uVar1;
  int iVar2;
  int *in_ECX;
  int iVar3;
  int local_2c [5];
  undefined4 local_18;
  int local_14;
  int local_10;
  int local_c;
  uint local_8;
  
  uVar1 = 0;
  if (in_ECX[0x56] == 0) {
    local_2c[0] = 0;
    local_2c[1] = 0;
    local_2c[2] = 0;
    local_10 = 0;
    local_14 = 0;
    local_c = 0;
    local_18 = 0;
    local_2c[3] = 0;
    local_8 = 0;
    if (in_ECX[2] != 0) {
      do {
        iVar3 = *(int *)(in_ECX[5] + local_8 * 4);
        if ((*(byte *)(*(int *)(in_ECX[4] + *(int *)(iVar3 + 4) * 4) + 4) & 0x20) != 0) {
          local_2c[4] = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(iVar3 + 0x6c));
          iVar2 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(iVar3 + 0x6c));
          if (local_2c[4] == 1) {
            if (iVar2 == 0) {
              local_2c[*(int *)(iVar3 + 0x10)] = 1;
              local_18 = *(undefined4 *)(iVar3 + 0x60);
            }
          }
          else if (local_2c[4] == 5) {
            if (((iVar2 == 0) && (*(int *)(iVar3 + 0x10) != 0)) && (local_14 == 0)) {
              FUN_1008b0b5();
              local_14 = 1;
              goto LAB_100b5e66;
            }
          }
          else if (((local_2c[4] == 0xc) && (iVar2 == 0)) &&
                  ((*(int *)(iVar3 + 0x10) != 0 && (local_10 == 0)))) {
            FUN_1008b0b5();
            local_10 = 1;
LAB_100b5e66:
            local_c = 1;
          }
        }
        local_8 = local_8 + 1;
      } while (local_8 < (uint)in_ECX[2]);
    }
    iVar3 = 0;
    uVar1 = 0;
    do {
      if (local_2c[uVar1] != 0) {
        iVar3 = iVar3 + 1;
      }
      uVar1 = uVar1 + 1;
    } while (uVar1 < 4);
    if (iVar3 != 4) {
      FUN_1008b0b5();
      local_c = 1;
    }
    uVar1 = -(uint)(local_c != 0) & 0x80004005;
  }
  return uVar1;
}


