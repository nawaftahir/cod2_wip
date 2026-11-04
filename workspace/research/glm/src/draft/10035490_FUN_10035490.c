extern unsigned int DAT_101d4820;
extern unsigned int DAT_1073055c;
extern int FUN_1002e850();
extern int FUN_100353c0();
extern int FUN_1003a8d0();
extern int FUN_1003ea30();


void FUN_10035490(int *param_1)

{
  unsigned int uVar1;
  
  uVar1 = 0;
  if (0 < *param_1) {
    do {
      if (uVar1 == 0) {
        g_1073055c = param_1[0x261];
 
	int g_1073055c = DAT_1073055c;     }
      else {
        g_1073055c = (&DAT_101d4820)[param_1[0x264 - (uVar1 & 1)] * 5];
      }
      FUN_1003ea30();
      FUN_100353c0();
      FUN_1002e850(0,0,(float)param_1[uVar1 * 0x26 + 4],(float)param_1[uVar1 * 0x26 + 5],0,0,
                   param_1[uVar1 * 0x26 + 2],param_1[uVar1 * 0x26 + 3]);
      FUN_1003a8d0();
      uVar1 = uVar1 + 1;
    } while ((int)uVar1 < *param_1);
  }
  return;
}


