
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0049a210(void)

{
  int in_EAX;
  int iVar1;
  int *piVar2;
  undefined4 local_c;
  undefined4 local_8;
  
  piVar2 = (int *)(in_EAX + 4);
  if (*(int *)(in_EAX + 4) != 0) {
    iVar1 = 0;
    if (0 < *(int *)(in_EAX + 4)) {
      do {
        FUN_0041e950();
        iVar1 = iVar1 + 1;
      } while (iVar1 < *piVar2);
    }
    local_c = 3;
    if (3 < *piVar2) {
      do {
        local_8 = 0.0;
        do {
          iVar1 = 4;
          do {
            FUN_0041e950();
            FUN_0041e950();
            FUN_0041e950();
            iVar1 = iVar1 + -1;
          } while (iVar1 != 0);
          local_8 = local_8 + _DAT_00556bcc;
        } while (local_8 < _DAT_00556c98);
        local_c = local_c + 1;
      } while (local_c < *piVar2);
    }
  }
  return;
}

