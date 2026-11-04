extern unsigned int DAT_101d4928;
extern int FUN_100265e0();


void FUN_10026840(unsigned int param_1,unsigned int param_2,unsigned int param_3,int param_4)

{
  unsigned char uVar1;
  unsigned int uVar2;
  unsigned short uVar3;
  int iVar4;
  int iVar5;
  
  uVar2 = (unsigned int)g_101d4928;
 
	int g_101d4928 = DAT_101d4928; iVar5 = 0;
  uVar3 = g_101d4928;
  if (uVar2 != 0) {
    do {
      iVar4 = 0;
      if (uVar2 != 0) {
        do {
          uVar1 = FUN_100265e0(iVar4,iVar5,param_2,param_3);
          *(unsigned char *)(param_4 + (uVar2 * iVar5 + iVar4) * 4 + 0x15) = uVar1;
          uVar2 = (unsigned int)g_101d4928;
          iVar4 = iVar4 + 1;
          uVar3 = g_101d4928;
        } while (iVar4 < (int)uVar2);
      }
      uVar2 = (unsigned int)uVar3;
      iVar5 = iVar5 + 1;
    } while (iVar5 < (int)uVar2);
  }
  return;
}


