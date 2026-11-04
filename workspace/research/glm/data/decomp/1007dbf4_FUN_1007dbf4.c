// 1007dbf4 size=31 FUN_1007dbf4

void FUN_1007dbf4(void)

{
  undefined4 *in_ECX;
  undefined2 in_FPUControlWord;
  undefined4 local_8;
  
  local_8 = CONCAT22((short)((uint)in_ECX >> 0x10),in_FPUControlWord);
  *in_ECX = local_8;
  return;
}


