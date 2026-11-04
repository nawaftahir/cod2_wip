// 100c4df7 size=442 FUN_100c4df7

int FUN_100c4df7(undefined4 param_1,int param_2,uint param_3)

{
  int *piVar1;
  int iVar2;
  int in_ECX;
  void *_Base;
  uint uVar3;
  char local_3c [32];
  undefined2 local_1c;
  undefined2 local_1a;
  undefined2 local_18;
  undefined2 local_16;
  undefined2 local_14;
  undefined2 local_12;
  undefined4 local_10;
  void *local_c;
  int local_8;
  
  uVar3 = 0;
  local_8 = 0;
  local_c = (void *)0x0;
  if (*(int *)(in_ECX + 0x158) == 0) {
    local_8 = 0;
  }
  else {
    iVar2 = *(int *)(in_ECX + 0x1d0) + *(int *)(in_ECX + 0x1f0) + *(int *)(in_ECX + 500);
    if (iVar2 != 0) {
      local_c = operator_new(iVar2 * 4);
      if (local_c == (void *)0x0) {
        local_8 = -0x7ff8fff2;
      }
      else {
        if (*(int *)(in_ECX + 0x2c) != 0) {
          do {
            _sprintf(local_3c,"r_$Int%d",uVar3);
            local_8 = FUN_1006a777(local_3c,uVar3,1);
            if (local_8 < 0) goto LAB_100c4f9f;
            uVar3 = uVar3 + 1;
          } while (uVar3 < *(uint *)(in_ECX + 0x2c));
        }
        _Base = local_c;
        FUN_10068bfc(local_c);
        iVar2 = *(int *)(in_ECX + 0x1d0) + *(int *)(in_ECX + 500);
        FUN_10068bfc((void *)((int)_Base + iVar2 * 4));
        uVar3 = iVar2 + *(int *)(in_ECX + 0x1f0);
        _qsort(_Base,uVar3,4,FUN_1006a087);
        local_1c = 1;
        local_1a = 3;
        local_18 = 1;
        local_16 = 4;
        local_14 = 1;
        local_12 = 0;
        local_10 = 0;
        param_2 = param_2 + param_3 * 0x14;
        param_3 = 0;
        if (uVar3 != 0) {
          do {
            piVar1 = (int *)((int)_Base + param_3 * 4);
            local_8 = FUN_100840db(*(undefined4 *)*piVar1,0xffffffff,7,param_2);
            if ((local_8 < 0) ||
               (local_8 = FUN_100840db(&local_1c,0x10,6,param_2 + 0xc), local_8 < 0))
            goto LAB_100c4f9f;
            if (*(int *)(*piVar1 + 0xc) != 0) {
              *(byte *)(param_2 + 10) = *(byte *)(param_2 + 10) | 1;
              local_8 = FUN_100840db(*piVar1 + 0x10,0x10,7,param_2 + 0x10);
              if (local_8 < 0) goto LAB_100c4f9f;
            }
            param_3 = param_3 + 1;
            *(undefined2 *)(param_2 + 4) = 2;
            *(undefined2 *)(param_2 + 6) = *(undefined2 *)(*piVar1 + 4);
            *(undefined2 *)(param_2 + 8) = 1;
            param_2 = param_2 + 0x14;
            _Base = local_c;
          } while (param_3 < uVar3);
        }
        local_8 = 0;
      }
    }
LAB_100c4f9f:
    _free(local_c);
  }
  return local_8;
}


