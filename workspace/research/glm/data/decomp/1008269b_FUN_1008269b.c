// 1008269b size=34 FUN_1008269b

void FUN_1008269b(void)

{
  int *lpAddress;
  int *in_ECX;
  
  while (*in_ECX != 0) {
    lpAddress = (int *)*in_ECX;
    *in_ECX = *lpAddress;
    VirtualFree(lpAddress,0,0x8000);
  }
  return;
}


