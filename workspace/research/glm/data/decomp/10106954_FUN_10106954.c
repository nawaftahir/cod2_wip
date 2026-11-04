// 10106954 size=76 FUN_10106954

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

uint FUN_10106954(_LDOUBLE *param_1,char **param_2,char *param_3,int param_4)

{
  uint uVar1;
  INTRNCVT_STATUS IVar2;
  _LDBL12 local_14;
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  uVar1 = ___strgtold12(&local_14,param_2,param_3,param_4,0,0,0);
  IVar2 = __ld12told(&local_14,param_1);
  if (IVar2 == INTRNCVT_OVERFLOW) {
    uVar1 = uVar1 | 2;
  }
  return uVar1;
}


