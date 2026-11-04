extern unsigned int DAT_101d1b2c;
extern unsigned int DAT_101d4d28;
extern int FUN_100138c0();
extern int FUN_10016ed0();
extern int FUN_10017050();
extern int FUN_1001c740();
extern int FUN_10061c80();


int FUN_10017100(unsigned int param_1)

{
  int iVar1;
  char local_5;
  unsigned short local_4 [2];
  
  FUN_10017050(local_4,&local_5);
  if (local_5 != '\0') {
    return (&DAT_101d4d28)[local_4[0]];
  }
  iVar1 = FUN_1001c740(param_1);
  if (iVar1 == 0) {
    if (g_101d1b2c == 0) {
 
	int g_101d1b2c = DAT_101d1b2c;     FUN_100138c0(0,"couldn\'t load material \'$default\'");
    }
    FUN_10061c80("^3WARNING: Could not find material \'%s\'\n");
    iVar1 = R_ParseSunLight(g_101d1b2c);
    return iVar1;
  }
  FUN_10016ed0();
  return iVar1;
}


