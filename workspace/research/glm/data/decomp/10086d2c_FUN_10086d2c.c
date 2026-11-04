// 10086d2c size=34 FUN_10086d2c

void FUN_10086d2c(byte param_1)

{
  undefined4 *in_ECX;
  
  *in_ECX = &PTR_FUN_10110440;
  if ((param_1 & 1) != 0) {
    _free(in_ECX);
  }
  return;
}


