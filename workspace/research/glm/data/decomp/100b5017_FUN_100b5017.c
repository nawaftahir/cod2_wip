// 100b5017 size=39 FUN_100b5017

void FUN_100b5017(byte param_1)

{
  undefined4 *in_ECX;
  
  *in_ECX = &PTR_FUN_10117af0;
  FUN_100c520c();
  if ((param_1 & 1) != 0) {
    _free(in_ECX);
  }
  return;
}


