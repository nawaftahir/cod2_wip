


unsigned int FUN_1009c9f2(unsigned int *param_1,int *param_2)

{
  int iVar1;
  unsigned int uVar2;
  
  iVar1 = *param_2;
  if (iVar1 == 0) {
    uVar2 = (unsigned int)(param_2[2] != 0);
  }
  else if ((iVar1 == 1) || (iVar1 == 2)) {
    uVar2 = param_2[2];
  }
  else {
    if (iVar1 != 3) {
      return 0x80004005;
    }
    uVar2 = __ftol();
  }
  *param_1 = uVar2;
  return 0;
}


