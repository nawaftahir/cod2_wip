// 100138c0 size=112 FUN_100138c0

void FUN_100138c0(undefined4 param_1,char *param_2)

{
  char acStack_400 [1023];
  undefined1 uStack_1;
  
  (*(code *)RI_GetThreadData)();
  if (DAT_101d492d != '\0') {
    (**(code **)(*DAT_101d1bf8 + 0xa8))(DAT_101d1bf8);
    DAT_101d492d = '\0';
  }
  __vsnprintf(acStack_400,0x3ff,param_2,&stack0x0000000c);
  uStack_1 = 0;
  (*(code *)RI_Error)(param_1,&DAT_10193358,acStack_400);
  return;
}


