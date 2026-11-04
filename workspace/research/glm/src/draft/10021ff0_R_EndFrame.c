extern unsigned int DAT_101d49b0;
extern unsigned int DAT_101d4d00;
extern unsigned int DAT_101da9c8;
extern unsigned int DAT_101e4a00;
extern unsigned int DAT_101e4a04;
extern unsigned int DAT_101e4a08;
extern unsigned int DAT_101e4a0c;
extern unsigned int DAT_103fe718;
extern unsigned int DAT_1042e778;
extern int FUN_1001e540();


void R_EndFrame(void)

{
  if (DAT_101d4d00 != '\0') {
    DAT_101e4a00 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778;   DAT_101e4a04 = g_101da9c8;
   
	int g_101da9c8 = DAT_101da9c8; if (DAT_101d49b0 != 0) {
      DAT_101e4a08 = 1;
      FUN_1001e540();
    }
    g_1042e778 = &DAT_103fe718;
    g_101da9c8 = &DAT_101e4a0c;
  }
  return;
}


