extern int FUN_10032560();


void FUN_10032c10(int *param_1)

{
  int iVar1;
  
  iVar1 = *param_1;
  FUN_10032560(iVar1 + 0x2c,*(unsigned int *)(iVar1 + 0x28),*(unsigned int *)(iVar1 + 0xc),
               *(unsigned int *)(iVar1 + 4),*(unsigned int *)(iVar1 + 8),*(unsigned int *)(iVar1 + 0x10),
               *(unsigned int *)(iVar1 + 0x14),*(unsigned int *)(iVar1 + 0x18),
               *(unsigned int *)(iVar1 + 0x1c),*(unsigned int *)(iVar1 + 0x20),
               *(unsigned char *)(iVar1 + 0x24));
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


