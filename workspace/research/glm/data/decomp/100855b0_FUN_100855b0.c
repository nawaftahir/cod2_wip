// 100855b0 size=56 FUN_100855b0

undefined4 FUN_100855b0(void)

{
  uint uVar1;
  uint *in_ECX;
  
  uVar1 = *in_ECX & 0xfff00000;
  if ((((uVar1 != 0x73100000) && (uVar1 != 0x73300000)) && (uVar1 != 0x73d00000)) &&
     (((uVar1 != 0x73e00000 && (uVar1 != 0x73f00000)) && (uVar1 != 0x74000000)))) {
    return 0;
  }
  return 1;
}


