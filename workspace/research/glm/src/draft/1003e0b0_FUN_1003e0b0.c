extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_1072ddc8;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;


void FUN_1003e0b0(unsigned int param_1)

{
  int iVar1;
  unsigned int *puVar2;
  unsigned int *puVar3;
  unsigned int local_40 [15];
  unsigned int local_4;
  
  puVar2 = (unsigned int *)(DAT_1072ddc8 + 0x48);
  puVar3 = local_40;
  for (iVar1 = 0x10; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = *puVar2;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
  }
  local_4 = param_1;
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;     _fprintf(g_10764584,"%s","dx.device->SetTransform( D3DTS_VIEW, &transform )\n");
      _fflush(g_10764584);
    }
    (**(void **)(*g_101d1bf8 + 0xb0))(g_101d1bf8,2,local_40);
  } while
	int g_101d1bf8 = DAT_101d1bf8; (DAT_1076a830 != 0);
  return;
}


