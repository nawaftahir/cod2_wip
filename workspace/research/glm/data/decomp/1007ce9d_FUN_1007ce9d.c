// 1007ce9d size=257 FUN_1007ce9d

uint FUN_1007ce9d(int param_1)

{
  uint uVar1;
  int iVar2;
  void *_Memory;
  int in_ECX;
  int iVar3;
  uint uVar4;
  uint local_8;
  
  if (*(int *)(param_1 + 4) == 0xd) {
    uVar4 = *(int *)(param_1 + 0x18) * *(int *)(param_1 + 0x14);
    _Memory = operator_new(uVar4 * 4);
    if (_Memory == (void *)0x0) {
      local_8 = -0x7ff8fff2;
    }
    else {
      local_8 = FUN_1006c566(_Memory,uVar4);
      if (((-1 < (int)local_8) && (local_8 = FUN_1007b5eb(param_1,_Memory,0), -1 < (int)local_8)) &&
         (local_8 = FUN_1006e308(param_1,uVar4 & 0xfffff | 0x10000000,_Memory,_Memory,0,0),
         -1 < (int)local_8)) {
        local_8 = 0;
        if (uVar4 != 0) {
          do {
            uVar1 = *(uint *)((int)_Memory + local_8 * 4);
            iVar2 = *(int *)(in_ECX + 8);
            if (uVar1 < *(uint *)(iVar2 + 8)) {
              iVar3 = *(int *)(*(int *)(iVar2 + 0x14) + uVar1 * 4);
            }
            else {
              iVar3 = 0;
            }
            if (iVar3 != 0) {
              *(undefined4 *)(iVar3 + 4) = *(undefined4 *)(iVar2 + 0x84);
            }
            local_8 = local_8 + 1;
          } while (local_8 < uVar4);
        }
        local_8 = FUN_10070fa6(*(undefined4 *)(param_1 + 0x10),_Memory,
                               *(undefined4 *)(*(int *)(in_ECX + 8) + 0x84),1,1,0,0);
      }
    }
    _free(_Memory);
    if (*(int *)(in_ECX + 0x4c) != 0) {
      local_8 = -0x7fffbffb;
    }
  }
  else {
    local_8 = 0;
  }
  return local_8;
}


