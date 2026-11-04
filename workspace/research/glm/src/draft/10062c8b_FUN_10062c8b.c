


char * FUN_10062c8b(int *param_1)

{
  int iVar1;
  unsigned char local_134 [204];
  unsigned int local_68;
  byte local_2c;
  int local_24;
  
  if ((param_1 == (int *)0x0) ||
     (iVar1 = (**(void **)(*param_1 + 0x1c))(param_1,local_134), iVar1 < 0)) {
    return (char *)0x0;
  }
  local_68 = local_68 & 0xffff;
  if (local_68 < 0x200) {
    if (local_68 == 0x101) {
      return "ps_1_1";
    }
    if (local_68 == 0x102) {
      return "ps_1_2";
    }
    if (local_68 == 0x103) {
      return "ps_1_3";
    }
    return (char *)(~-(unsigned int)(local_68 != 0x104) & 0x1010c4f8);
  }
  if (0x2ff < local_68) {
    return "ps_3_0";
  }
  if ((((0x15 < local_24) && ((local_2c & 1) != 0)) && ((local_2c & 2) != 0)) &&
     ((((local_2c & 4) != 0 && ((local_2c & 8) != 0)) && ((local_2c & 0x10) != 0)))) {
    return "ps_2_a";
  }
  return "ps_2_0";
}


