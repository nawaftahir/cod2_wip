// 100b9777 size=33 FUN_100b9777

uint FUN_100b9777(uint param_1,int param_2)

{
  int in_ECX;
  
  return param_2 << ((byte)*(undefined4 *)(in_ECX + 0xec) & 0x1f) |
         *(uint *)(in_ECX + 0xe4) & param_1;
}


