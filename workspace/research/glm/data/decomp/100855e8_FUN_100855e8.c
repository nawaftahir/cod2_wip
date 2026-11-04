// 100855e8 size=28 FUN_100855e8

undefined4 FUN_100855e8(void)

{
  uint *in_ECX;
  
  if (((*in_ECX & 0xfff00000) != 0x20700000) && ((*in_ECX & 0xfff00000) != 0x73400000)) {
    return 0;
  }
  return 1;
}


