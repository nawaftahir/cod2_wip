


unsigned int FUN_100b9975(int param_1,unsigned int param_2,int param_3,unsigned int param_4)

{
  unsigned int uVar1;
  unsigned int uVar2;
  
  uVar2 = 0;
  if (param_2 != 0) {
    do {
      uVar1 = 0;
      if (param_4 != 0) {
        do {
          if (*(int *)(param_1 + uVar2 * 4) == *(int *)(param_3 + uVar1 * 4)) {
            return 1;
          }
          uVar1 = uVar1 + 1;
        } while (uVar1 < param_4);
      }
      uVar2 = uVar2 + 1;
    } while (uVar2 < param_2);
  }
  return 0;
}


