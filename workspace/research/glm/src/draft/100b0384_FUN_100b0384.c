


unsigned int FUN_100b0384(int param_1,unsigned int *param_2,unsigned int *param_3,unsigned int *param_4)

{
  unsigned int uVar1;
  unsigned int uVar2;
  
  uVar1 = *(unsigned int *)(param_1 + 0x6c);
  uVar2 = (unsigned int)*(byte *)(param_1 + 0x6d);
  *param_2 = uVar2;
  uVar1 = uVar1 & 0xff;
  if (uVar1 == 1) {
    if (uVar2 != 0) {
      return 0x80004005;
    }
    *param_3 = 0;
    if (param_4 != (unsigned int *)0x0) {
      *param_4 = 0;
    }
  }
  else {
    if (uVar1 != 2) {
      return 0x80004005;
    }
    if (uVar2 != 0) {
      return 0x80004005;
    }
    *param_3 = 9;
    if (param_4 != (unsigned int *)0x0) {
      *param_4 = 1;
    }
  }
  return 0;
}


