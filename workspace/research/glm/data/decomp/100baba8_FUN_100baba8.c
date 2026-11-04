// 100baba8 size=360 FUN_100baba8

int FUN_100baba8(void)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  int local_8;
  
  if (((**(uint **)(in_ECX + 0x100) & 0xfff00000) == 0x11400000) &&
     ((**(uint **)(in_ECX + 0x100) & 0xfffff) == 1)) {
    if ((*(byte *)(in_ECX + 0x70) & 4) == 0) {
      FUN_1008b0b5();
      local_8 = -0x7fffbffb;
    }
    else {
      iVar3 = FUN_10085814();
      if (iVar3 == 0) {
        iVar3 = 0;
      }
      else {
        iVar3 = FUN_10085379();
      }
      if (iVar3 == 0) {
        local_8 = -0x7ff8fff2;
      }
      else {
        local_8 = FUN_1008585f(0x74500001,2,1,0);
        if (((local_8 < 0) || (local_8 = FUN_100853b0(), local_8 < 0)) ||
           (iVar4 = FUN_10086139(0,0,0,0), iVar4 == -1)) {
          FUN_1006c418();
        }
        else {
          iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
          FUN_10085c65();
          **(undefined4 **)(iVar3 + 0x10) = **(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
          **(undefined4 **)(iVar3 + 8) = **(undefined4 **)(*(int *)(in_ECX + 0x100) + 8);
          *(int *)(*(int *)(iVar3 + 8) + 4) = iVar4;
          if (*(int *)(iVar1 + 0x38) == -1) {
            uVar2 = **(undefined4 **)(*(int *)(in_ECX + 0x100) + 8);
            *(byte *)(iVar1 + 0x3e) = *(byte *)(iVar1 + 0x3e) | 8;
            *(undefined4 *)(iVar1 + 0x38) = uVar2;
          }
          else {
            *(uint *)(iVar1 + 0x3c) = *(uint *)(iVar1 + 0x3c) ^ 0x80000;
          }
          local_8 = FUN_10085abe();
          FUN_1006c418();
        }
      }
    }
  }
  else {
    local_8 = 1;
  }
  return local_8;
}


