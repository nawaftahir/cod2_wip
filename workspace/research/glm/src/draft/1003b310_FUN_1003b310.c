extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101d4c6c;
extern unsigned int DAT_101d4c70;
extern unsigned int DAT_1072ddc8;


float FUN_1003b310(int param_1,int param_2)

{
  float fVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  fVar1 = *(float *)(g_1072ddc8 + 0xd4) * *(float *)(g_101d1b9c + 0x1b4) +
 
	int g_1072ddc8 = DAT_1072ddc8;  
	int g_101d1b9c = DAT_101d1b9c;       *(float *)(g_1072ddc8 + 0xe4) * *(float *)(g_101d1b9c + 0x1b8) +
          *(float *)(g_1072ddc8 + 0xf4) * *(float *)(g_101d1b9c + 0x1bc);
  if (fVar1 < 0.0 == (fVar1 == 0.0)) {
    iVar3 = (int)ROUND((((1.0 / fVar1) *
                         (*(float *)(g_101d1b9c + 0x1b4) * *(float *)(g_1072ddc8 + 200) +
                         *(float *)(g_1072ddc8 + 0xd8) * *(float *)(g_101d1b9c + 0x1b8) +
                         *(float *)(g_1072ddc8 + 0xe8) * *(float *)(g_101d1b9c + 0x1bc)) + 1.0)
                        * (float)g_101d4c6c - (float)param_1) * 0.5 + 9.313226e-10);
    iVar5 = (
	int g_101d4c6c = DAT_101d4c6c;int)ROUND((((1.0 / fVar1) *
                         (*(float *)(g_1072ddc8 + 0xcc) * *(float *)(g_101d1b9c + 0x1b4) +
                         *(float *)(g_1072ddc8 + 0xdc) * *(float *)(g_101d1b9c + 0x1b8) +
                         *(float *)(g_1072ddc8 + 0xec) * *(float *)(g_101d1b9c + 0x1bc)) + 1.0)
                        * (float)g_101d4c70 - (float)param_2) * 0.5 + 9.313226e-10);
    iVar2 = param_2
	int g_101d4c70 = DAT_101d4c70; + iVar5;
    iVar4 = iVar3 + param_1;
    if (iVar3 < 0) {
      iVar3 = 0;
    }
    if (g_101d4c6c < iVar4) {
      iVar4 = g_101d4c6c;
    }
    if (iVar5 < 0) {
      iVar5 = 0;
    }
    if (g_101d4c70 < iVar2) {
      iVar2 = g_101d4c70;
    }
    if ((iVar3 < iVar4) && (iVar5 < iVar2)) {
      return (float)((iVar2 - iVar5) * (iVar4 - iVar3)) / (float)(param_1 * param_2);
    }
  }
  return (float)0.0;
}


