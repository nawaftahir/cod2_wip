extern unsigned int DAT_101ce694;
extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d4818;
extern unsigned int DAT_101d489c;
extern unsigned int DAT_101d4c6c;
extern unsigned int DAT_101d4c70;
extern unsigned int DAT_10678500;
extern unsigned int DAT_10696c94;
extern unsigned int DAT_10696c98;
extern unsigned int DAT_10696c9c;
extern unsigned int DAT_10696cac;
extern unsigned int DAT_10696cb0;
extern unsigned int DAT_10696cb4;
extern unsigned int DAT_10696cb8;
extern int FUN_10021840();
extern int FUN_10021890();
extern int FUN_10021920();
extern int FUN_10021b50();
extern int FUN_10024920();


void FUN_10024d90(int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4)

{
  unsigned int uVar1;
  unsigned int uVar2;
  
  if (g_10696c98 == -1) {
 
	int g_10696c98 = DAT_10696c98;   g_10696c94 = '\x01';
   
	int g_10696c94 = DAT_10696c94; g_10696c98 = R_RenderScene();
    FUN_10021840();
    R_ClearScreen(0,0,g_101d4c6c,g_101d4c70);
    if 
	int g_101d4c70 = DAT_101d4c70;((
	int g_101d4c6c = DAT_101d4c6c;((DAT_101d4818 == 0) || (*(int *)(DAT_101ce708 + 8) == 2)) ||
        (*(char *)(DAT_101ce694 + 8) == '\0')) || (uVar2 = 1, DAT_101d489c == 0)) {
      uVar2 = 7;
    }
    uVar1 = FUN_10024920();
    R_BlendSavedScreen(uVar2,uVar1,0x3f800000,0);
  }
  if (g_10696c94 != '\0') {
    R_BeginDelayedDrawing(g_10696c98);
    g_10696c94 = '\0';
  }
  uVar1 = R_RenderScene();
  uVar2 = g_10678500;
  *(unsigned 
	int g_10678500 = DAT_10678500;int *)(&g_10696c9c + param_1 * 4) = uVar1;
 
	int g_10696c9c = DAT_10696c9c; FUN_10021b50(uVar2,param_2);
  FUN_10021890(param_3,param_4,3,0);
  FUN_10021920();
  if (*(int *)(&g_10696c9c + param_1 * 4) != -1) {
    R_BeginDelayedDrawing(*(int *)(&g_10696c9c + param_1 * 4));
  }
  if (g_10696cac == -1) {
 
	int g_10696cac = DAT_10696cac;   g_10696c94 = '\x01';
    g_10696cac = R_RenderScene();
  }
  if (g_10696c94 != '\0') {
    R_BeginDelayedDrawing(g_10696cac);
    g_10696c94 = '\0';
  }
  if (g_10696cb4 == -1) {
 
	int g_10696cb4 = DAT_10696cb4;   g_10696cb0 = '\x01';
   
	int g_10696cb0 = DAT_10696cb0; g_10696cb4 = R_RenderScene();
    R_ClearScreen(0,0,g_101d4c6c,g_101d4c70);
  }
  if (g_10696cb0 != '\0') {
    R_BeginDelayedDrawing(g_10696cb4);
    g_10696cb0 = '\0';
  }
  uVar1 = R_RenderScene();
  uVar2 = g_10678500;
  *(unsigned int *)(&DAT_10696cb8 + param_1 * 4) = uVar1;
  FUN_10021b50(uVar2,param_2);
  return;
}


