extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce794;
extern unsigned int DAT_106a3180;
extern unsigned int DAT_106c3180;
extern unsigned int DAT_106d3194;
extern unsigned int DAT_1072ddbc;
extern int FUN_1000ea20();
extern int FUN_1000ec00();
extern int FUN_1002c470();
extern int FUN_1002c570();
extern int FUN_1002c620();
extern int FUN_1002c7b0();
extern int FUN_1002c850();


void FUN_1002c910(int *param_1,int *param_2)

{
  int iVar1;
  
  iVar1 = DAT_101ce794;
  if ((*param_2 != *g_106d3194) && (*param_2 = *g_106d3194, *(char *)(iVar1 + 8) != '\0')) {
   
	int g_106d3194 = DAT_106d3194; FUN_1002c470(DAT_1072ddbc);
    FUN_1002c570(&DAT_106a3180);
    if (*(int *)(DAT_101ce708 + 8) == 2) {
      FUN_1002c620(param_2);
      if (*param_1 == 4) {
        FUN_1000ec00(param_1,0x15,0);
        return;
      }
      FUN_1000ea20(0x15,&g_106c3180);
     
	int g_106c3180 = DAT_106c3180; return;
    }
    FUN_1002c7b0();
    if (*param_1 == 4) {
      FUN_1000ec00(param_1,0x32,0);
    }
    else {
      FUN_1000ea20(0x32,&g_106c3180);
    }
    FUN_1002c850(param_1,0x32,&g_106c3180);
  }
  return;
}


