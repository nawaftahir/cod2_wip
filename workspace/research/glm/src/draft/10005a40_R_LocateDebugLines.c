extern unsigned int DAT_101ae500;
extern unsigned int DAT_101ae504;
extern unsigned int DAT_101ae508;
extern unsigned int DAT_10678504;


void R_LocateDebugLines(unsigned int *param_1,unsigned int param_2,unsigned int *param_3,
                       unsigned int param_4)

{
  unsigned int *puVar1;
  
  if (g_101ae500 == 0) {
 
	int g_101ae500 = DAT_101ae500;   g_101ae500 = (*(void *)RI_Z_MallocInternal)(g_101ae508 * 0x28);
 
	int g_101ae508 = DAT_101ae508;   g_101ae504 = 0;
  }
	int g_101ae504 = DAT_101ae504;
  if (g_101ae504 != g_101ae508) {
    puVar1 = (unsigned int *)(g_101ae500 + g_101ae504 * 0x28);
    *puVar1 = *param_1;
    puVar1[1] = param_1[1];
    puVar1[2] = param_1[2];
    puVar1 = (unsigned int *)(g_101ae500 + 0xc + g_101ae504 * 0x28);
    *puVar1 = *param_3;
    puVar1[1] = param_3[1];
    puVar1[2] = param_3[2];
    *(unsigned int *)(g_101ae500 + 0x1c + g_101ae504 * 0x28) = param_2;
    *(unsigned int *)(g_101ae500 + 0x20 + g_101ae504 * 0x28) = DAT_10678504;
    *(unsigned int *)(g_101ae500 + 0x24 + g_101ae504 * 0x28) = param_4;
    g_101ae504 = g_101ae504 + 1;
  }
  return;
}


