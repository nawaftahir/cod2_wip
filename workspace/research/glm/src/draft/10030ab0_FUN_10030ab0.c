extern unsigned int DAT_101ce6d0;
extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce71c;
extern unsigned int DAT_101ce7a4;
extern unsigned int DAT_101d496d;
extern unsigned int DAT_10730558;
extern int FUN_1002eaa0();
extern int FUN_10030580();
extern int FUN_100306b0();
extern int FUN_10030710();
extern int FUN_1003ea30();


void FUN_10030ab0(float param_1)

{
  if (g_10730558 == 0xe) {
 
	int g_10730558 = DAT_10730558;   FUN_1002eaa0();
    g_10730558 = 2;
  }
  if ((((*(int *)(g_101ce708 + 8) != 2) && (DAT_101d496d != '\0')) &&
     
	int g_101ce708 = DAT_101ce708; (*(char *)(DAT_101ce71c + 8) != '\0')) && (*(char *)(DAT_101ce6d0 + 8) == '\0')) {
    FUN_100306b0();
    FUN_1003ea30();
    FUN_10030580();
  }
  if ((*(int *)(g_101ce708 + 8) != 2) && ((0.0 < *(float *)(g_101ce7a4 + 8) || (0.0 < param_1)))
     
	int g_101ce7a4 = DAT_101ce7a4;) {
    FUN_10030710(SQRT(param_1 * param_1 +
                      *(float *)(g_101ce7a4 + 8) * *(float *)(g_101ce7a4 + 8)));
  }
  return;
}


