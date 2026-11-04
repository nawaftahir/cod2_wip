extern unsigned int DAT_1042e778;


void FUN_10021ae0(unsigned int *param_1,unsigned int param_2)

{
  int *piVar1;
  int iVar2;
  unsigned int *puVar3;
  int iVar4;
  unsigned int *puVar5;
  
  iVar2 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar4 = *(int *)(g_1042e778 + 0x30000);
  if (0x30000 - iVar4 < 0x48) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    puVar3 = (unsigned int *)0x0;
  }
  else {
    puVar3 = (unsigned int *)(iVar4 + g_1042e778);
    *(int *)(g_1042e778 + 0x30000) = iVar4 + 0x48;
    piVar1 = (int *)(iVar2 + 0x30004);
    *piVar1 = *piVar1 + 0x48;
    *(unsigned int **)(iVar2 + 0x30008) = puVar3;
    *(unsigned short *)puVar3 = 9;
    *(unsigned short *)((int)puVar3 + 2) = 0x48;
  }
  puVar5 = puVar3;
  for (iVar4 = 0x10; puVar5 = puVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar5 = *param_1;
    param_1 = param_1 + 1;
  }
  puVar3[0x11] = param_2;
  return;
}


