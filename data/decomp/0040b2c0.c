
void FUN_0040b2c0(byte param_1)

{
  void *unaff_ESI;
  
  if (*(void **)((int)unaff_ESI + 8) != (void *)0x0) {
    _free(*(void **)((int)unaff_ESI + 8));
  }
  if ((param_1 & 1) != 0) {
    _free(unaff_ESI);
  }
  return;
}

