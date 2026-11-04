extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d1b9c;


void R_ClearFogs(unsigned int *param_1)

{
  int iVar1;
  
  iVar1 = DAT_101d1b9c;
	int g_101d1b9c = DAT_101d1b9c;
  if (*(int *)(DAT_101ce708 + 8) != 2) {
    *(unsigned int *)(g_101d1b9c + 200) = *param_1;
    *(unsigned int *)(iVar1 + 0xcc) = param_1[1];
    *(unsigned int *)(iVar1 + 0xd0) = param_1[2];
  }
  return;
}


