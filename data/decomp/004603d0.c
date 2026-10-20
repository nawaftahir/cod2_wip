
undefined4 FUN_004603d0(void)

{
  undefined4 uVar1;
  uint uVar2;
  undefined1 local_8 [4];
  
  uVar1 = FUN_00460160(0,0,0,local_8);
  uVar2 = CONCAT31((int3)((uint)uVar1 >> 8),local_8[0]) & 0xffffff80;
  return CONCAT31((int3)(uVar2 >> 8),'\x01' - ((char)uVar2 != '\0'));
}

