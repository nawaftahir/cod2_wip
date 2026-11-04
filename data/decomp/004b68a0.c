
void * __thiscall FUN_004b68a0(void *param_1,byte param_2)

{
  FUN_004c2580();
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

