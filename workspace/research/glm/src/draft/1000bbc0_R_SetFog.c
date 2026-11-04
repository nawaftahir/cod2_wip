extern unsigned int DAT_101d616c;
extern unsigned int DAT_101d61ac;
extern unsigned int DAT_101d61c8;
extern unsigned int DAT_101d61cc;
extern unsigned int DAT_101d61ec;
extern unsigned int DAT_101d61f0;
extern unsigned int DAT_101d61f4;
extern unsigned int DAT_101d620c;


void R_SetFog(int param_1,int param_2,int param_3)

{
  int iVar1;
  unsigned int *puVar2;
  unsigned int *puVar3;
  
  DAT_101d620c = param_1;
  puVar3 = &DAT_101d61cc;
  iVar1 = 8;
  if (DAT_101d61c8 == '\0') {
    puVar2 = &g_101d616c + param_1 * 8;
 
	int g_101d616c = DAT_101d616c;   param_3 = 0;
  }
  else {
    puVar2 = &DAT_101d61ac;
  }
  for (; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = *puVar2;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
  }
  puVar3 = &g_101d616c + param_1 * 8;
  puVar2 = &DAT_101d61ec;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar2 = puVar2 + 1;
  }
  if (param_3 == 0) {
    g_101d61f0 = param_3;
 
	int g_101d61f0 = DAT_101d61f0;   g_101d61f4 = param_3;
 
	int g_101d61f4 = DAT_101d61f4;   return;
  }
  g_101d61f0 = param_2;
  g_101d61f4 = param_2 + param_3;
  return;
}


