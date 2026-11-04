extern unsigned int DAT_101da9c8;


void R_LocateDebugStrings(unsigned int *param_1,int param_2,int param_3)

{
  int iVar1;
  unsigned int uVar2;
  unsigned int uVar3;
  int iVar4;
  unsigned int *puVar5;
  
  iVar1 = g_101da9c8;
 
	int g_101da9c8 = DAT_101da9c8; if (param_1 != (unsigned int *)0x0) {
    if (*(int *)(g_101da9c8 + 0x249d54) == 0) {
      uVar2 = (*(void *)RI_Z_MallocInternal)(param_3 * 0x2c);
      *(unsigned int *)(iVar1 + 0x249d54) = uVar2;
    }
    puVar5 = *(unsigned int **)(iVar1 + 0x249d54);
    for (uVar3 = (unsigned int)(param_2 * 0x2c) >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
      *puVar5 = *param_1;
      param_1 = param_1 + 1;
      puVar5 = puVar5 + 1;
    }
    for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
      *(unsigned char *)puVar5 = *(unsigned char *)param_1;
      param_1 = (unsigned int *)((int)param_1 + 1);
      puVar5 = (unsigned int *)((int)puVar5 + 1);
    }
    *(int *)(iVar1 + 0x249d58) = param_2;
    return;
  }
  *(int *)(g_101da9c8 + 0x249d58) = param_2;
  return;
}


