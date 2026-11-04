// 10102a8a size=95 __handle_qnan2

/* Library Function - Single Match
    __handle_qnan2
   
   Library: Visual Studio 2003 Release */

float10 __handle_qnan2(undefined4 param_1,double param_2,double param_3,undefined4 param_4)

{
  undefined4 *puVar1;
  float10 fVar2;
  
  if (DAT_101a55b8 == 0) {
    fVar2 = (float10)__umatherr(1,param_1,param_2,param_3,param_2 + param_3,param_4);
    return fVar2;
  }
  puVar1 = (undefined4 *)FUN_100fc216();
  *puVar1 = 0x21;
  __ctrlfp();
  return (float10)(param_2 + param_3);
}


