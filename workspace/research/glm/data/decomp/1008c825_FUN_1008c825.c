// 1008c825 size=34 FUN_1008c825

void FUN_1008c825(byte param_1)

{
  undefined4 *in_ECX;
  
  *in_ECX = &PTR_FUN_10110440;
  if ((param_1 & 1) != 0) {
    _free(in_ECX);
  }
  return;
}


