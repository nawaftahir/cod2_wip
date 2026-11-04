extern unsigned int DAT_1042e778;


void R_EndRegistration(void)

{
  unsigned short *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(g_1042e778 + 0x30004) < 4) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (unsigned short *)(iVar2 + g_1042e778);
  *(int *)(g_1042e778 + 0x30000) = iVar2 + 4;
  *(unsigned short **)(iVar3 + 0x30008) = puVar1;
  *puVar1 = 0x21;
  puVar1[1] = 4;
  return;
}


