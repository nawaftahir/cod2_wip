// 10102ae9 size=184 __except1

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    __except1
   
   Library: Visual Studio 2003 Release */

float10 __except1(undefined4 param_1,undefined4 param_2,undefined8 param_3,double param_4,
                 undefined4 param_5)

{
  int iVar1;
  float10 fVar2;
  
  iVar1 = __handle_exc(param_1,&param_4,param_5);
  if (iVar1 == 0) {
    __raise_exc();
  }
  iVar1 = __errcode(param_1);
  if ((DAT_101a55b8 == 0) && (iVar1 != 0)) {
    fVar2 = (float10)__umatherr(iVar1,param_2,param_3,0,param_4,param_5);
  }
  else {
    __set_errno(iVar1);
    __ctrlfp();
    fVar2 = (float10)param_4;
  }
  return fVar2;
}


