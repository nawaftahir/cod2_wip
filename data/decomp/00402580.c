
void * __thiscall FUN_00402580(void *param_1,byte param_2)

{
  FUN_00402570();
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

