extern unsigned int DAT_101d1b9c;


void R_GetWorldBounds(unsigned int *param_1,unsigned int *param_2)

{
  int iVar1;
  
  iVar1 = g_101d1b9c;
 
	int g_101d1b9c = DAT_101d1b9c; *param_1 = *(unsigned int *)(g_101d1b9c + 0x13c);
  param_1[1] = *(unsigned int *)(iVar1 + 0x140);
  param_1[2] = *(unsigned int *)(iVar1 + 0x144);
  iVar1 = g_101d1b9c;
  *param_2 = *(unsigned int *)(g_101d1b9c + 0x148);
  param_2[1] = *(unsigned int *)(iVar1 + 0x14c);
  param_2[2] = *(unsigned int *)(iVar1 + 0x150);
  return;
}


