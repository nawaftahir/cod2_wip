// 100c42fc size=354 FUN_100c42fc

undefined4 FUN_100c42fc(int *param_1,uint param_2,uint *param_3,int param_4)

{
  int *piVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  uint uVar4;
  uint local_c;
  uint local_8;
  
  uVar3 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_1 * 4) + 0x3c);
  local_c = 0;
  local_8 = 0;
  if ((uVar3 & 0x400) == 0) {
    if ((uVar3 & 0x800) == 0) {
      if ((uVar3 & 0x1000) == 0) {
        if ((uVar3 & 0x2000) == 0) {
          if ((uVar3 & 0x4000) == 0) {
            if ((char)(uVar3 >> 8) < '\0') {
              local_8 = 0xd000000;
            }
          }
          else {
            local_8 = 0xe000000;
          }
        }
        else {
          local_8 = 0xf000000;
        }
      }
      else {
        local_8 = 0x3000000;
      }
    }
    else {
      local_8 = 0x2000000;
    }
  }
  else {
    local_8 = 0x1000000;
  }
  if ((uVar3 & 0x200) != 0) {
    local_8 = CONCAT13(local_8._3_1_,0x100000);
  }
  if (param_4 == 0) {
    uVar3 = 0;
    if (param_2 != 0) {
      do {
        iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1[uVar3] * 4) + 0x10);
        uVar4 = 0;
        if (iVar2 == 0) {
          uVar4 = 0x10000;
        }
        else if (iVar2 == 1) {
          uVar4 = 0x20000;
        }
        else if (iVar2 == 2) {
          uVar4 = 0x40000;
        }
        else if (iVar2 == 3) {
          uVar4 = 0x80000;
        }
        if ((local_c & uVar4) != 0) {
          FUN_1008b0b5();
        }
        local_c = local_c | uVar4;
        uVar3 = uVar3 + 1;
      } while (uVar3 < param_2);
    }
  }
  else {
    local_c = 0xf0000;
  }
  uVar3 = 0;
  if ((*(byte *)(in_ECX + 0x6e) & 0x80) != 0) {
    if ((local_c & 0x80000) == 0) {
      local_c = 0x70000;
    }
    else if ((local_c & 0x70000) != 0) {
      local_c = 0xf0000;
    }
  }
  if ((((*(byte *)(in_ECX + 0xcc) & 1) != 0) && (*(int *)(in_ECX + 0x124) != 0)) && (param_2 != 0))
  {
    do {
      piVar1 = param_1 + uVar3;
      iVar2 = uVar3 + *(int *)(in_ECX + 0x128) * 6;
      uVar3 = uVar3 + 1;
      *(int *)(*(int *)(in_ECX + 0x124) + -0x10 + iVar2 * 4) = *piVar1;
    } while (uVar3 < param_2);
  }
  *param_3 = local_8 | local_c;
  return 0;
}


