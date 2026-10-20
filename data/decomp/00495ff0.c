
int FUN_00495ff0(uint param_1)

{
  return ((((int)param_1 >> 8 & 0xffU) + (param_1 & 0xff) * 0x100) * 0x100 +
         ((int)param_1 >> 0x10 & 0xffU)) * 0x100 + ((int)param_1 >> 0x18 & 0xffU);
}

