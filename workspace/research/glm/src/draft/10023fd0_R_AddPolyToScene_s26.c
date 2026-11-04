extern unsigned int DAT_101ce6fc;
extern unsigned int DAT_101d1b28;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101d4d00;
extern unsigned int DAT_10678514;
extern unsigned int DAT_10678518;
extern unsigned int DAT_1067851c;
extern unsigned int DAT_10678520;
extern unsigned int DAT_10678524;
extern unsigned int DAT_10678528;
extern unsigned int DAT_1067852c;
extern unsigned int DAT_10678530;
extern unsigned int DAT_10678534;


void R_AddPolyToScene_s26
               (unsigned int *param_1,float param_2,unsigned int param_3,unsigned int param_4,
               unsigned int param_5)

{
  int iVar1;
  int iVar2;
  
  iVar1 = g_10678514;
 
	int g_10678514 = DAT_10678514; if ((((DAT_101d4d00 != '\0') && (DAT_101d1b9c != 0)) && (param_2 < 0.0 == (param_2 == 0.0))) &&
     (g_10678514 < *(int *)(DAT_101ce6fc + 8))) {
    iVar2 = g_10678514 * 0x2c;
    g_10678514 = g_10678514 + 1;
    *(unsigned int *)(&DAT_10678518 + iVar2) = DAT_101d1b28;
    (&DAT_1067851c)[iVar1 * 0xb] = *param_1;
    (&DAT_10678520)[iVar1 * 0xb] = param_1[1];
    (&DAT_10678524)[iVar1 * 0xb] = param_1[2];
    (&DAT_10678528)[iVar1 * 0xb] = param_2;
    *(unsigned int *)(&DAT_1067852c + iVar2) = param_3;
    *(unsigned int *)(&DAT_10678530 + iVar2) = param_4;
    *(unsigned int *)(&DAT_10678534 + iVar2) = param_5;
  }
  return;
}


