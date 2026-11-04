extern unsigned int DAT_101d616c;
extern unsigned int DAT_101d620c;


void R_ArchiveFogState(void)

{
  int iVar1;
  unsigned int *puVar2;
  
  puVar2 = &DAT_101d616c;
  for (iVar1 = 0x28; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  DAT_101d620c = 0;
  return;
}


