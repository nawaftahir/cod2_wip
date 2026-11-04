// 10017320 size=37 R_IsMaterialRefractive

uint R_IsMaterialRefractive(int param_1)

{
  uint uVar1;
  
  uVar1 = DAT_101ce708;
  if (((*(int *)(DAT_101ce708 + 8) != 2) &&
      (uVar1 = *(uint *)(*(int *)(param_1 + 0x38) + 0x58), uVar1 != 0)) &&
     ((*(byte *)(uVar1 + 4) & 1) != 0)) {
    return CONCAT31((int3)(uVar1 >> 8),1);
  }
  return uVar1 & 0xffffff00;
}


