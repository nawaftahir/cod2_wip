extern unsigned int DAT_10196c8c;
extern unsigned int DAT_101ce600;
extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101ce824;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101d4c6c;
extern unsigned int DAT_101d4c70;
extern unsigned int DAT_101d4d00;
extern unsigned int DAT_101d4d04;
extern unsigned int DAT_101da9c8;
extern unsigned int DAT_10678504;
extern unsigned int DAT_10678508;
extern unsigned int DAT_1067850c;
extern unsigned int DAT_10764584;
extern int FUN_100138c0();
extern int FUN_10023920();
extern int FUN_10024080();
extern int FUN_10025380();
extern int FUN_10025570();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void R_ResetSunLightOverride(int param_1)

{
  int iVar1;
  unsigned int uStack_8;
  unsigned char uStack_4;
  
  if (DAT_101d4d00 != '\0') {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;     _fprintf(g_10764584,"%s","====== R_RenderScene ======\n");
      _fflush(g_10764584);
    }
    if (*(char *)(DAT_101ce600 + 8) == '\0') {
      if (DAT_101d1b9c == 0) {
        FUN_100138c0(1,&DAT_10196c8c);
      }
      g_10678504 = *(int *)(param_1 + 0x48);
      _
	int g_10678504 = DAT_10678504;DAT_10678508 = (float)g_10678504 * 0.001;
      DAT_101d4d04 = *(unsigned int *)(param_1 + 0x18);
      _DAT_101d4d08 = *(unsigned int *)(param_1 + 0x1c);
      _DAT_101d4d0c = *(unsigned int *)(param_1 + 0x20);
      _DAT_101d4d10 = *(unsigned int *)(param_1 + 0x24);
      _DAT_101d4d14 = *(unsigned int *)(param_1 + 0x28);
      _DAT_101d4d18 = *(unsigned int *)(param_1 + 0x2c);
      iVar1 = *(int *)(g_101da9c8 + 0x217c7c) * 0x14c + 0x217c80 + g_101da9c8;
      *(int *
	int g_101da9c8 = DAT_101da9c8;)(g_101da9c8 + 0x217c7c) = *(int *)(g_101da9c8 + 0x217c7c) + 1;
      FUN_10025570(param_1);
      uStack_8 = *(unsigned int *)(param_1 + 0x50);
      if ((*(int *)(param_1 + 8) != DAT_101d4c6c) ||
         (uStack_4 = 1, *(int *)(param_1 + 0xc) != DAT_101d4c70)) {
        uStack_4 = 0;
      }
      FUN_10024080();
      FUN_10025380(*(unsigned int *)(param_1 + 0x54),iVar1,&uStack_8);
      if ((*(int *)(g_101ce824 + 8) != 0) && (*(int *)(g_101ce824 + 8) < DAT_1067850c)) {
        (*(void *)RI_
	int g_101ce824 = DAT_101ce824;Dvar_SetBool)(g_101ce824,0);
        FUN_10023920();
      }
    }
  }
  return;
}


