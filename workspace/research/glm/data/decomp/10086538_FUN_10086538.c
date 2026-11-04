// 10086538 size=142 FUN_10086538

uint FUN_10086538(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  
  iVar1 = *(int *)(*(int *)(param_3 + 0x14) + param_1 * 4);
  iVar2 = *(int *)(*(int *)(param_3 + 0x14) + param_2 * 4);
  if (*(uint *)(iVar2 + 0x38) <= *(uint *)(iVar1 + 0x38)) {
    if (*(uint *)(iVar2 + 0x38) < *(uint *)(iVar1 + 0x38)) {
      return 1;
    }
    if (*(uint *)(iVar2 + 0x3c) <= *(uint *)(iVar1 + 0x3c)) {
      if (*(uint *)(iVar1 + 0x3c) != *(uint *)(iVar2 + 0x3c)) {
        return 1;
      }
      if (*(uint *)(iVar2 + 4) <= *(uint *)(iVar1 + 4)) {
        if (*(uint *)(iVar1 + 4) != *(uint *)(iVar2 + 4)) {
          return 1;
        }
        if (*(uint *)(iVar2 + 0xc) <= *(uint *)(iVar1 + 0xc)) {
          if (*(uint *)(iVar1 + 0xc) != *(uint *)(iVar2 + 0xc)) {
            return 1;
          }
          if (*(uint *)(iVar2 + 8) <= *(uint *)(iVar1 + 8)) {
            if (*(uint *)(iVar1 + 8) != *(uint *)(iVar2 + 8)) {
              return 1;
            }
            if (*(uint *)(iVar2 + 0x10) <= *(uint *)(iVar1 + 0x10)) {
              if (*(uint *)(iVar1 + 0x10) != *(uint *)(iVar2 + 0x10)) {
                return 1;
              }
              if (*(uint *)(iVar2 + 0x14) <= *(uint *)(iVar1 + 0x14)) {
                if (*(uint *)(iVar1 + 0x14) != *(uint *)(iVar2 + 0x14)) {
                  return 1;
                }
                if (*(int *)(iVar2 + 0x18) <= *(int *)(iVar1 + 0x18)) {
                  return (uint)(*(int *)(iVar2 + 0x18) < *(int *)(iVar1 + 0x18));
                }
              }
            }
          }
        }
      }
    }
  }
  return 0xffffffff;
}


