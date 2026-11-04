extern unsigned int DAT_101da9c8;


void R_LightingFromCubemapShots(unsigned int *param_1,unsigned int param_2,int param_3)

{
  int iVar1;
  unsigned int uVar2;
  int iVar3;
  unsigned int *puVar4;
  
  iVar1 = g_101da9c8;
 
	int g_101da9c8 = DAT_101da9c8; if (param_1 != (unsigned int *)0x0) {
    if (*(int *)(g_101da9c8 + 0x249d3c) == 0) {
      uVar2 = (*(void *)RI_Z_MallocInternal)(param_3 << 7);
      *(unsigned int *)(iVar1 + 0x249d3c) = uVar2;
    }
    puVar4 = *(unsigned int **)(iVar1 + 0x249d3c);
    for (iVar3 = (param_2 & 0x1ffffff) << 5; iVar3 != 0; iVar3 = iVar3 + -1) {
      *puVar4 = *param_1;
      param_1 = param_1 + 1;
      puVar4 = puVar4 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(unsigned char *)puVar4 = *(unsigned char *)param_1;
      param_1 = (unsigned int *)((int)param_1 + 1);
      puVar4 = (unsigned int *)((int)puVar4 + 1);
    }
    *(unsigned int *)(iVar1 + 0x249d40) = param_2;
    return;
  }
  *(unsigned int *)(g_101da9c8 + 0x249d40) = param_2;
  return;
}


