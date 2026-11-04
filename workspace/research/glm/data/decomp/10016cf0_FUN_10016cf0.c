// 10016cf0 size=77 FUN_10016cf0

void FUN_10016cf0(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  int local_4;
  
  DAT_101da560 = DAT_101da560 + 1;
  if (DAT_101da560 == 0x100) {
    FUN_100138c0(1,"More than %i unique pixel and vertex shaders",0xff);
  }
  FUN_10016c10(param_1,param_2,&local_4);
  (&DAT_101da564)[local_4] = param_3;
  return;
}


