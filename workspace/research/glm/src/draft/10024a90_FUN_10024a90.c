extern unsigned int DAT_10191488;
extern unsigned int DAT_101ce694;
extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d489c;
extern unsigned int DAT_10678500;
extern unsigned int DAT_10696c40;
extern unsigned int DAT_10696c44;
extern unsigned int DAT_10696c48;
extern unsigned int DAT_10696c58;
extern int FUN_10021840();
extern int FUN_10021890();
extern int FUN_10021b50();
extern int FUN_10024a40();
extern int FUN_100294e0();


void FUN_10024a90(int param_1,unsigned int param_2,int param_3)

{
  unsigned int uVar1;
  unsigned int uVar2;
  
  if (((*(int *)(DAT_101ce708 + 8) == 2) || (*(char *)(DAT_101ce694 + 8) == '\0')) ||
     (DAT_101d489c == 0)) {
    if (param_3 == 1) {
      if (g_10696c44 == -1) {
 
	int g_10696c44 = DAT_10696c44;       g_10696c40 = '\x01';
   
	int g_10696c40 = DAT_10696c40;     g_10696c44 = R_RenderScene();
        FUN_10021840();
        R_BlendSavedScreen(7,&DAT_10191488,0x3f800000,0);
      }
      if (g_10696c40 != '\0') {
        R_BeginDelayedDrawing(g_10696c44);
        g_10696c40 = '\0';
      }
      uVar2 = R_RenderScene();
      uVar1 = g_10678500;
      (&g_106
	int g_10678500 = DAT_10678500;96c48)[param_1] = uVar2;
 
	int g_10696c48 = DAT_10696c48;     FUN_10021b50(uVar1);
      FUN_10021890(param_2);
      if ((&g_10696c48)[param_1] != -1) {
        R_BeginDelayedDrawing((&g_10696c48)[param_1]);
      }
      if (g_10696c58 == -1) {
 
	int g_10696c58 = DAT_10696c58;       g_10696c40 = '\x01';
        g_10696c58 = R_RenderScene();
      }
      if (g_10696c40 != '\0') {
        R_BeginDelayedDrawing(g_10696c58);
        g_10696c40 = '\0';
      }
    }
  }
  else {
    if (g_10696c44 == -1) {
      g_10696c40 = '\x01';
      g_10696c44 = R_RenderScene();
      FUN_10021840();
      FUN_10024a40();
    }
    if (g_10696c40 != '\0') {
      R_BeginDelayedDrawing(g_10696c44);
      g_10696c40 = '\0';
    }
    uVar1 = R_RenderScene();
    (&g_10696c48)[param_1] = uVar1;
    FUN_10021b50(g_10678500);
    FUN_10021890(param_2);
    FUN_100294e0();
    if (g_10696c40 != '\0') {
      R_BeginDelayedDrawing(g_10696c58);
      g_10696c40 = 0;
      return;
    }
  }
  return;
}


