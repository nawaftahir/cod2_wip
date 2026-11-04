
void * __thiscall FUN_0047c620(void *param_1,byte param_2)

{
  if (*(int *)((int)param_1 + 0xc) != 0) {
    FUN_0047c620(1);
  }
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

