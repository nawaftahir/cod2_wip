// 1006771f size=106 FUN_1006771f

undefined4
FUN_1006771f(char *param_1,int param_2,undefined4 param_3,undefined4 param_4,int param_5,int param_6
            )

{
  char cVar1;
  char *pcVar2;
  undefined4 *in_ECX;
  
  if ((param_5 != 0) && (param_6 != 0)) {
    if (param_2 == -1) {
      if (param_1 == (char *)0x0) {
        param_2 = 0;
      }
      else {
        pcVar2 = param_1;
        do {
          cVar1 = *pcVar2;
          pcVar2 = pcVar2 + 1;
        } while (cVar1 != '\0');
        param_2 = (int)pcVar2 - (int)(param_1 + 1);
      }
    }
    if ((param_1 != (char *)0x0) || (param_2 == 0)) {
      *in_ECX = param_1;
      in_ECX[6] = param_3;
      in_ECX[7] = param_4;
      in_ECX[0xb] = param_5;
      in_ECX[1] = param_1 + param_2;
      in_ECX[0xc] = param_6;
      return 0;
    }
  }
  return 0x80004005;
}


