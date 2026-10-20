
void * __thiscall FUN_0040c810(void *param_1,byte param_2)

{
  FUN_0040c840(param_1);
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

