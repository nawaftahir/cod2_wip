// 100b8618 size=81 FUN_100b8618

undefined4 FUN_100b8618(void)

{
  int in_ECX;
  undefined1 local_10 [4];
  undefined4 local_c;
  
  FUN_10063776(&DAT_1010c4bc,0,local_10);
  *(undefined4 *)(in_ECX + 0x30) = 0;
  *(byte *)(in_ECX + 0x71) = *(byte *)(in_ECX + 0x71) | 2;
  *(undefined4 *)(in_ECX + 0x108) = local_c;
  *(undefined4 *)(in_ECX + 0x28) = 0x40;
  *(undefined4 *)(in_ECX + 0x2c) = 0x40;
  *(uint *)(in_ECX + 0x6c) = *(uint *)(in_ECX + 0x6c) & 0xfffffefe | 0x80000202;
  *(undefined4 *)(in_ECX + 0x38) = 0x2000;
  return 0;
}


