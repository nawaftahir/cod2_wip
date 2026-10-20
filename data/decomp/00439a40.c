
void * __thiscall FUN_00439a40(void *param_1,byte param_2)

{
  FUN_004110b0(param_1);
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

