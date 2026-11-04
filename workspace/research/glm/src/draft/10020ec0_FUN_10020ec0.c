extern unsigned int DAT_1042e778;


void FUN_10020ec0(void)

{
  int *piVar1;
  unsigned short *puVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar3 = *(int *)(g_1042e778 + 0x30000);
  if (0x30000 - iVar3 < 4) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    return;
  }
  puVar2 = (unsigned short *)(iVar3 + g_1042e778);
  *(int *)(g_1042e778 + 0x30000) = iVar3 + 4;
  piVar1 = (int *)(iVar4 + 0x30004);
  *piVar1 = *piVar1 + 4;
  *(unsigned short **)(iVar4 + 0x30008) = puVar2;
  *puVar2 = 0;
  puVar2[1] = 4;
  return;
}


