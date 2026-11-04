extern unsigned int DAT_1067850c;
extern unsigned int DAT_10678510;
extern int FUN_100087a0();
extern int FUN_100091d0();


void FUN_10009250(unsigned int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = g_1067850c;
 
	int g_1067850c = DAT_1067850c; iVar2 = 0;
  if (0 < g_1067850c) {
    iVar3 = 0;
    do {
      if (*(int *)(iVar3 + g_10678510) < 2) {
 
	int g_10678510 = DAT_10678510;       FUN_100087a0(iVar2,param_1);
      }
      else if (*(int *)(iVar3 + g_10678510) == 3) {
        FUN_100091d0(iVar2,param_1);
      }
      iVar2 = iVar2 + 1;
      iVar3 = iVar3 + 0x74;
    } while (iVar2 < iVar1);
  }
  return;
}


