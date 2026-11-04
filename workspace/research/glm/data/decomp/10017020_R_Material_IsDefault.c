// 10017020 size=39 R_Material_IsDefault

uint R_Material_IsDefault(uint param_1)

{
  if ((*(int *)(param_1 + 0x3c) == *(int *)(DAT_101d1b2c + 0x3c)) &&
     (*(int *)(param_1 + 0x40) == *(int *)(DAT_101d1b2c + 0x40))) {
    return CONCAT31((int3)((uint)*(int *)(param_1 + 0x38) >> 8),
                    *(int *)(param_1 + 0x38) == *(int *)(DAT_101d1b2c + 0x38));
  }
  return param_1 & 0xffffff00;
}


