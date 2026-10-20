
void FUN_0049a910(int param_1)

{
  int iVar1;
  undefined4 *puVar2;
  float *unaff_EBX;
  int local_8;
  
  if (unaff_EBX == (float *)0x0) {
    *(undefined4 *)(param_1 + 0x34) = 0;
  }
  else {
    iVar1 = FUN_004df760();
    *unaff_EBX = (float)iVar1;
    iVar1 = FUN_004df760();
    unaff_EBX[1] = (float)iVar1;
    iVar1 = FUN_004df760();
    local_8 = 0;
    unaff_EBX[2] = (float)iVar1;
    if (0 < *(int *)(param_1 + 4)) {
      do {
        FUN_0041e950();
        iVar1 = FUN_00499890();
        if (iVar1 != 0) {
          puVar2 = (undefined4 *)FUN_0041e950();
          *(undefined4 *)(param_1 + 0x34) = *puVar2;
        }
        local_8 = local_8 + 1;
      } while (local_8 < *(int *)(param_1 + 4));
      return;
    }
  }
  return;
}

