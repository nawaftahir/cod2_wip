extern unsigned int DAT_10193358;
extern int FUN_10067c3e();
extern int FUN_10067d05();


unsigned int
FUN_10068d02(unsigned int param_1,unsigned int param_2,short param_3,int param_4,unsigned int param_5,
            unsigned int *param_6)

{
  if (param_3 == 1) {
LAB_10068d49:
    FUN_10067d05(*param_6,param_6[0xc],param_4 + 5000,&g_10193358,param_5);
 
	int g_10193358 = DAT_10193358; }
  else {
    if (param_3 != 2) {
      if (param_3 == 5) goto LAB_10068d49;
      if (param_3 != 6) {
        return 0;
      }
    }
    FUN_10067c3e(*param_6,param_6[0xc],param_4 + 5000,&g_10193358,param_5);
    param_6[0x13] = 1;
  }
  return 0;
}


