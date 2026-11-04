// 100b75b4 size=39 FUN_100b75b4

void FUN_100b75b4(byte param_1)

{
  undefined4 *in_ECX;
  
  *in_ECX = &PTR_FUN_10117c68;
  FUN_100c520c();
  if ((param_1 & 1) != 0) {
    _free(in_ECX);
  }
  return;
}


