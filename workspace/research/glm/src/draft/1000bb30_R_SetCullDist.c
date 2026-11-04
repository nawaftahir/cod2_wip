extern unsigned int DAT_101d616c;
extern unsigned int DAT_101d6178;
extern unsigned int DAT_101d6179;
extern unsigned int DAT_101d617a;
extern unsigned int DAT_101d617b;
extern unsigned int DAT_101d617c;
extern unsigned int DAT_101d6180;
extern unsigned int DAT_101d6184;
extern unsigned int DAT_101d6188;
extern unsigned int DAT_101d6189;
extern unsigned int DAT_101d618a;


void R_SetCullDist(int param_1,unsigned int param_2,unsigned int param_3,unsigned char param_4,
                  unsigned char param_5,unsigned char param_6,float param_7)

{
  int iVar1;
  
  iVar1 = param_1 * 0x20;
  (&DAT_101d617a)[iVar1] = param_4;
  (&DAT_101d6178)[iVar1] = param_6;
  (&DAT_101d6179)[iVar1] = param_5;
  (&DAT_101d617b)[iVar1] = 0xff;
  *(unsigned int *)(&DAT_101d6180 + iVar1) = param_3;
  *(unsigned int *)(&DAT_101d617c + iVar1) = param_2;
  (&DAT_101d618a)[iVar1] = 0;
  (&DAT_101d6188)[iVar1] = 1;
  (&DAT_101d6189)[iVar1] = 1;
  if (1.0 <= param_7) {
    (&g_101d616c)[param_1 * 8] = 1;
 
	int g_101d616c = DAT_101d616c;   *(unsigned int *)(&g_101d6184 + iVar1) = 0x3f800000;
 
	int g_101d6184 = DAT_101d6184;   return;
  }
  (&g_101d616c)[param_1 * 8] = 2;
  *(float *)(&g_101d6184 + iVar1) = param_7;
  return;
}


