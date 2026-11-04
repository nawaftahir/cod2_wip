extern unsigned int DAT_1042e778;
extern int FUN_1010a8a8();


void R_DrawStretchRaw(unsigned int *param_1,int param_2,unsigned int param_3)

{
  unsigned short *puVar1;
  int iVar2;
  int iVar3;
  unsigned char uVar4;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(g_1042e778 + 0x30004) < 0x2c) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (unsigned short *)(iVar2 + g_1042e778);
  *(unsigned short **)(g_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 0x2c;
  *puVar1 = 0x12;
  puVar1[1] = 0x2c;
  *(unsigned int *)(puVar1 + 2) = param_3;
  *(unsigned int *)(puVar1 + 4) = *param_1;
  *(unsigned int *)(puVar1 + 6) = param_1[1];
  *(unsigned int *)(puVar1 + 8) = param_1[2];
  *(unsigned int *)(puVar1 + 10) = param_1[3];
  *(unsigned int *)(puVar1 + 0xc) = param_1[4];
  *(unsigned int *)(puVar1 + 0xe) = param_1[5];
  *(unsigned int *)(puVar1 + 0x10) = param_1[6];
  *(unsigned int *)(puVar1 + 0x12) = param_1[7];
  if (param_2 == 0) {
    *(unsigned int *)(puVar1 + 0x14) = 0xffffffff;
    return;
  }
  uVar4 = FUN_1010a8a8();
  *(unsigned char *)(puVar1 + 0x14) = uVar4;
  uVar4 = FUN_1010a8a8();
  *(unsigned char *)((int)puVar1 + 0x29) = uVar4;
  uVar4 = FUN_1010a8a8();
  *(unsigned char *)(puVar1 + 0x15) = uVar4;
  uVar4 = FUN_1010a8a8();
  *(unsigned char *)((int)puVar1 + 0x2b) = uVar4;
  return;
}


