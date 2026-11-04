// 10085469 size=49 FUN_10085469

undefined4 FUN_10085469(void)

{
  uint uVar1;
  uint *in_ECX;
  
  uVar1 = *in_ECX & 0xfff00000;
  if ((((uVar1 != 0x20000000) && (uVar1 != 0x20100000)) && (uVar1 != 0x20400000)) &&
     ((uVar1 != 0x20500000 && (uVar1 != 0x50000000)))) {
    return 0;
  }
  return 1;
}


