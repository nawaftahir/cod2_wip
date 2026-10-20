
void * __thiscall FUN_004b5d10(void *param_1,byte param_2)

{
  FUN_004b5950();
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

