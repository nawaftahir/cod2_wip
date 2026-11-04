// 1008549a size=56 FUN_1008549a

undefined4 FUN_1008549a(void)

{
  uint uVar1;
  uint *in_ECX;
  
  uVar1 = *in_ECX & 0xfff00000;
  if ((((uVar1 != 0x10000000) && (uVar1 != 0x10100000)) && (uVar1 != 0x11200000)) &&
     (((uVar1 != 0x20700000 && (uVar1 != 0x20800000)) && (uVar1 != 0x20900000)))) {
    return 0;
  }
  return 1;
}


