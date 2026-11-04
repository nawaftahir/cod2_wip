extern unsigned int DAT_101d1b2c;
extern unsigned int DAT_101d4d00;
extern unsigned int DAT_101da9c8;
extern unsigned int DAT_10678ac0;
extern int FUN_10024380();


void R_DefaultVertexFrames(int param_1,unsigned short param_2,unsigned short param_3,unsigned int *param_4)

{
  unsigned int *puVar1;
  int iVar2;
  unsigned int uVar3;
  int iVar4;
  unsigned int uVar5;
  unsigned int *puVar6;
  
  iVar2 = g_101da9c8;
 
	int g_101da9c8 = DAT_101da9c8; if (DAT_101d4d00 != '\0') {
    if (param_1 == 0) {
      param_1 = DAT_101d1b2c;
    }
    uVar5 = (unsigned int)param_3;
    if (((int)(*(int *)(g_101da9c8 + 0x18fc74) + uVar5) < 0x2001) &&
       (*(int *)(g_101da9c8 + 0x187c70) < 0x800)) {
      puVar1 = (unsigned int *)(*(int *)(g_101da9c8 + 0x187c70) * 0x10 + 0x187c74 + g_101da9c8);
      *(unsigned short *)(puVar1 + 2) = param_2;
      puVar1[1] = param_1;
      *(unsigned short *)((int)puVar1 + 10) = param_3;
      *puVar1 = 1;
      puVar6 = (unsigned int *)(*(int *)(iVar2 + 0x18fc74) * 0x44 + 0x18fc78 + iVar2);
      puVar1[3] = puVar6;
      for (uVar3 = uVar5 * 0x44 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
        *puVar6 = *param_4;
        param_4 = param_4 + 1;
        puVar6 = puVar6 + 1;
      }
      for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
        *(unsigned char *)puVar6 = *(unsigned char *)param_4;
        param_4 = (unsigned int *)((int)param_4 + 1);
        puVar6 = (unsigned int *)((int)puVar6 + 1);
      }
      FUN_10024380(puVar1);
      *(int *)(iVar2 + 0x187c70) = *(int *)(iVar2 + 0x187c70) + 1;
      *(unsigned int *)(iVar2 + 0x18fc74) = *(int *)(iVar2 + 0x18fc74) + uVar5;
      g_10678ac0 = g_10678ac0 + 1;
   
	int g_10678ac0 = DAT_10678ac0; }
  }
  return;
}


