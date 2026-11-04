


unsigned int FUN_10086538(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  
  iVar1 = *(int *)(*(int *)(param_3 + 0x14) + param_1 * 4);
  iVar2 = *(int *)(*(int *)(param_3 + 0x14) + param_2 * 4);
  if (*(unsigned int *)(iVar2 + 0x38) <= *(unsigned int *)(iVar1 + 0x38)) {
    if (*(unsigned int *)(iVar2 + 0x38) < *(unsigned int *)(iVar1 + 0x38)) {
      return 1;
    }
    if (*(unsigned int *)(iVar2 + 0x3c) <= *(unsigned int *)(iVar1 + 0x3c)) {
      if (*(unsigned int *)(iVar1 + 0x3c) != *(unsigned int *)(iVar2 + 0x3c)) {
        return 1;
      }
      if (*(unsigned int *)(iVar2 + 4) <= *(unsigned int *)(iVar1 + 4)) {
        if (*(unsigned int *)(iVar1 + 4) != *(unsigned int *)(iVar2 + 4)) {
          return 1;
        }
        if (*(unsigned int *)(iVar2 + 0xc) <= *(unsigned int *)(iVar1 + 0xc)) {
          if (*(unsigned int *)(iVar1 + 0xc) != *(unsigned int *)(iVar2 + 0xc)) {
            return 1;
          }
          if (*(unsigned int *)(iVar2 + 8) <= *(unsigned int *)(iVar1 + 8)) {
            if (*(unsigned int *)(iVar1 + 8) != *(unsigned int *)(iVar2 + 8)) {
              return 1;
            }
            if (*(unsigned int *)(iVar2 + 0x10) <= *(unsigned int *)(iVar1 + 0x10)) {
              if (*(unsigned int *)(iVar1 + 0x10) != *(unsigned int *)(iVar2 + 0x10)) {
                return 1;
              }
              if (*(unsigned int *)(iVar2 + 0x14) <= *(unsigned int *)(iVar1 + 0x14)) {
                if (*(unsigned int *)(iVar1 + 0x14) != *(unsigned int *)(iVar2 + 0x14)) {
                  return 1;
                }
                if (*(int *)(iVar2 + 0x18) <= *(int *)(iVar1 + 0x18)) {
                  return (unsigned int)(*(int *)(iVar2 + 0x18) < *(int *)(iVar1 + 0x18));
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


