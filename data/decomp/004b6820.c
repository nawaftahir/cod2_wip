
void * __thiscall FUN_004b6820(void *param_1,byte param_2)

{
  FUN_004c2250();
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

