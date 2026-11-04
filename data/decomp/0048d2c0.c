
void __fastcall FUN_0048d2c0(char *param_1,undefined4 param_2,float param_3,float param_4)

{
  size_t in_EAX;
  
  if (param_3 == -3.4028235e+38) {
    if (param_4 != 3.4028235e+38) {
      __snprintf(param_1,in_EAX,"Domain is any %iD vector with components %g or smaller");
      return;
    }
    __snprintf(param_1,in_EAX,"Domain is any %iD vector");
    return;
  }
  if (param_4 != 3.4028235e+38) {
    __snprintf(param_1,in_EAX,"Domain is any %iD vector with components from %g to %g",param_2,
               (double)param_3,(double)param_4);
    return;
  }
  __snprintf(param_1,in_EAX,"Domain is any %iD vector with components %g or bigger");
  return;
}

