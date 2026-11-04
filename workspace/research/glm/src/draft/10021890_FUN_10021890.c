extern unsigned int DAT_1042e778;


void FUN_10021890(unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4)

{
  unsigned short *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(g_1042e778 + 0x30004) < 0x14) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (unsigned short *)(iVar2 + g_1042e778);
  *(unsigned short **)(g_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 0x14;
  *puVar1 = 0x17;
  puVar1[1] = 0x14;
  *(unsigned int *)(puVar1 + 2) = param_4;
  *(unsigned int *)(puVar1 + 4) = param_1;
  *(unsigned int *)(puVar1 + 6) = param_2;
  *(unsigned int *)(puVar1 + 8) = param_3;
  return;
}


