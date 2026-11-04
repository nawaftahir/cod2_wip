// 100a5ae7 size=39 FUN_100a5ae7

void FUN_100a5ae7(byte param_1)

{
  undefined4 *in_ECX;
  
  *in_ECX = &PTR_FUN_10115a68;
  FUN_100c520c();
  if ((param_1 & 1) != 0) {
    _free(in_ECX);
  }
  return;
}


