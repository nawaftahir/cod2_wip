// 100b97aa size=26 FUN_100b97aa

uint FUN_100b97aa(uint param_1)

{
  int in_ECX;
  
  return (*(uint *)(in_ECX + 0xe8) & param_1) >> ((byte)*(undefined4 *)(in_ECX + 0xec) & 0x1f);
}


