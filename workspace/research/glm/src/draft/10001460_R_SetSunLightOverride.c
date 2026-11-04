extern unsigned int DAT_101d1b9c;


void R_SetSunLightOverride(void)

{
  int iVar1;
  
  iVar1 = DAT_101d1b9c;
	int g_101d1b9c = DAT_101d1b9c;
  *(unsigned int *)(g_101d1b9c + 200) = *(unsigned int *)(g_101d1b9c + 0xe0);
  *(unsigned int *)(iVar1 + 0xcc) = *(unsigned int *)(iVar1 + 0xe4);
  *(unsigned int *)(iVar1 + 0xd0) = *(unsigned int *)(iVar1 + 0xe8);
  return;
}


