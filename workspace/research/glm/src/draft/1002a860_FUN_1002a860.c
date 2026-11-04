extern unsigned int DAT_101ce708;
extern unsigned int DAT_10696cd0;
extern unsigned int DAT_10696cd4;
extern unsigned int DAT_10696ce0;
extern int FUN_1000cc10();
extern int FUN_1000ea20();
extern int FUN_1000ec00();
extern int FUN_1000ee30();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1002a860(int param_1)

{
  unsigned int uVar1;
  int *piVar2;
  
  if (*(int *)(DAT_101ce708 + 8) != 2) {
    piVar2 = (int *)FUN_1000cc10("*smodel_lighting",2,1,4);
    *(int **)(param_1 + 0x10c) = piVar2;
    uVar1 = g_10696ce0;
 
	int g_10696ce0 = DAT_10696ce0;   FUN_1000ee30(g_10696cd0 * 2,g_10696cd4 * 2,2,0xb,0);
   
	int g_10696cd4 = DAT_10696cd4; i
	int g_10696cd0 = DAT_10696cd0;f (*piVar2 == 4) {
      FUN_1000ec00(piVar2,0x15,0,uVar1);
    }
    else {
      FUN_1000ea20(0x15,uVar1);
    }
    *(unsigned int *)(param_1 + 0x118) = 0x3e800000;
    *(float *)(param_1 + 0x110) = _DAT_10696cd8 * 0.5;
    *(float *)(param_1 + 0x114) = _DAT_10696cdc * 0.5;
    g_10696cd0 = 0;
    g_10696cd4 = 0;
    _DAT_10696cd8 = 0.0;
    _DAT_10696cdc = 0.0;
    g_10696ce0 = 0;
  }
  return;
}


