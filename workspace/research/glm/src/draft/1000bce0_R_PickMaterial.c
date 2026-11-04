extern unsigned int DAT_101ce840;
extern unsigned int DAT_1076a82c;
extern int FUN_1000c6a0();
extern int FUN_100138c0();


int R_PickMaterial(int param_1,unsigned int param_2)

{
  int iVar1;
  int iVar2;
  char *pcVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  
  iVar4 = 0;
  if (g_1076a82c < 1) {
L
	int g_1076a82c = DAT_1076a82c;AB_1000bd60:
    if (0xf < g_1076a82c) {
      FUN_100138c0(1,"R_RegisterFont: Too many fonts registered already.\n");
      return 0;
    }
    iVar4 = FUN_1000c6a0(param_2);
    if (iVar4 == 0) {
      FUN_100138c0(1,"R_RegisterFont: Error while reading font \'%s\'",param_1);
    }
    (&g_101ce840)[g_1076a82c] = iVar4;
    g_1
	int g_101ce840 = DAT_101ce840;076a82c = g_1076a82c + 1;
    return iVar4;
  }
LAB_1000bcf0:
  pcVar3 = *(char **)(&g_101ce840)[iVar4];
  iVar6 = param_1 - (int)pcVar3;
  iVar5 = 0x7fffffff;
  do {
    iVar1 = (int)pcVar3[iVar6];
    iVar2 = (int)*pcVar3;
    pcVar3 = pcVar3 + 1;
    if (iVar5 == 0) goto LAB_1000bd39;
    if (iVar1 != iVar2) {
      if ((0x60 < iVar1) && (iVar1 < 0x7b)) {
        iVar1 = iVar1 + -0x20;
      }
      if ((0x60 < iVar2) && (iVar2 < 0x7b)) {
        iVar2 = iVar2 + -0x20;
      }
      if (iVar1 != iVar2) break;
    }
    iVar5 = iVar5 + -1;
    if (iVar1 == 0) goto LAB_1000bd39;
  } while( true );
  if ((char)((iVar2 <= iVar1) * '\x02') == '\x01') {
LAB_1000bd39:
    return (&g_101ce840)[iVar4];
  }
  iVar4 = iVar4 + 1;
  if (g_1076a82c <= iVar4) goto LAB_1000bd60;
  goto LAB_1000bcf0;
}


