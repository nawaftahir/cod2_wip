// 1000bb10 size=22 R_ArchiveFogState

void R_ArchiveFogState(void)

{
  int iVar1;
  undefined4 *puVar2;
  
  puVar2 = &DAT_101d616c;
  for (iVar1 = 0x28; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  DAT_101d620c = 0;
  return;
}


