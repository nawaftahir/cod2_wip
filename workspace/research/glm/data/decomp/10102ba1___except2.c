// 10102ba1 size=201 __except2

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    __except2
   
   Library: Visual Studio 2003 Release */

float10 __except2(undefined4 param_1,undefined4 param_2,undefined8 param_3,undefined8 param_4,
                 double param_5,undefined4 param_6)

{
  int iVar1;
  float10 fVar2;
  
  iVar1 = __handle_exc(param_1,&param_5,param_6);
  if (iVar1 == 0) {
    __raise_exc();
  }
  iVar1 = __errcode(param_1);
  if ((DAT_101a55b8 == 0) && (iVar1 != 0)) {
    fVar2 = (float10)__umatherr(iVar1,param_2,param_3,param_4,param_5,param_6);
  }
  else {
    __set_errno(iVar1);
    __ctrlfp();
    fVar2 = (float10)param_5;
  }
  return fVar2;
}


