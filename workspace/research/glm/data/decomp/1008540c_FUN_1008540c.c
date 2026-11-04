// 1008540c size=51 FUN_1008540c

undefined4 FUN_1008540c(void)

{
  uint uVar1;
  uint *in_ECX;
  
  if (((((*in_ECX & 0xf0000000) != 0x60000000) &&
       (uVar1 = *in_ECX & 0xfff00000, uVar1 != 0x50100000)) && (uVar1 != 0x50200000)) &&
     (uVar1 != 0x50300000)) {
    return 0;
  }
  return 1;
}


