extern unsigned int DAT_10193358;


/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10061c80(char *param_1)

{
  char local_1000 [4092];
  unsigned int uStack_4;
  
  uStack_4 = 0x10061c8a;
  __vsnprintf(local_1000,0x1000,param_1,&stack0x00000008);
  uStack_4 = uStack_4 & 0xffffff;
  (*(void *)RI_Printf)(0,&DAT_10193358,local_1000);
  return;
}


