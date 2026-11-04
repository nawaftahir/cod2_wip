extern unsigned int DAT_10193358;
extern int FUN_100138c0();


/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10061cd0(unsigned int param_1,char *param_2)

{
  char local_1000 [4092];
  unsigned int uStack_4;
  
  uStack_4 = 0x10061cda;
  __vsnprintf(local_1000,0x1000,param_2,&stack0x0000000c);
  uStack_4 = uStack_4 & 0xffffff;
  FUN_100138c0(param_1,&DAT_10193358,local_1000);
  return;
}


