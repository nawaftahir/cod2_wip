extern unsigned int DAT_101d1b2c;


unsigned int R_Material_IsDefault(unsigned int param_1)

{
  if ((*(int *)(param_1 + 0x3c) == *(int *)(DAT_101d1b2c + 0x3c)) &&
	int g_101d1b2c = DAT_101d1b2c;
     (*(int *)(param_1 + 0x40) == *(int *)(g_101d1b2c + 0x40))) {
    return CONCAT31((int3)((unsigned int)*(int *)(param_1 + 0x38) >> 8),
                    *(int *)(param_1 + 0x38) == *(int *)(g_101d1b2c + 0x38));
  }
  return param_1 & 0xffffff00;
}


