
/* WARNING: Removing unreachable block (ram,0x00489526) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_00489500(float param_1,float param_2)

{
  DAT_00592730 = DAT_00592730 * 0x343fd + 0x269ec3;
  return (float10)(((param_2 - param_1) * (float)(DAT_00592730 >> 0x11)) / _DAT_00556a80 + param_1);
}

