extern unsigned int DAT_1042e778;
extern int FUN_1002c0b0();


void R_SetMaterialColor(unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4,
                       unsigned int param_5,unsigned int param_6,unsigned int param_7,unsigned int param_8,
                       unsigned int param_9,unsigned int param_10)

{
  unsigned short *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(g_1042e778 + 0x30004) < 0x2c) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (unsigned short *)(iVar2 + g_1042e778);
  *(unsigned short **)(g_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 0x2c;
  *puVar1 = 0xf;
  puVar1[1] = 0x2c;
  *(unsigned int *)(puVar1 + 2) = param_10;
  *(unsigned int *)(puVar1 + 4) = param_1;
  *(unsigned int *)(puVar1 + 6) = param_2;
  *(unsigned int *)(puVar1 + 8) = param_3;
  *(unsigned int *)(puVar1 + 10) = param_4;
  *(unsigned int *)(puVar1 + 0xc) = param_5;
  *(unsigned int *)(puVar1 + 0xe) = param_6;
  *(unsigned int *)(puVar1 + 0x10) = param_7;
  *(unsigned int *)(puVar1 + 0x12) = param_8;
  FUN_1002c0b0();
  return;
}


