
undefined4 FUN_0048b650(int param_1,int param_2,uint param_3)

{
  int *piVar1;
  int *piVar2;
  char *pcVar3;
  uint uVar4;
  
  if (0xf < param_3) {
    uVar4 = 0;
    if (param_3 >> 4 != 0) {
      piVar2 = (int *)(param_2 + 4);
      piVar1 = (int *)(param_1 + 0xc);
      do {
        if (((*piVar1 != *(int *)((param_2 - param_1) + (int)piVar1) || piVar1[-3] != piVar2[-1]) ||
            piVar1[-1] != piVar2[1]) || piVar1[-2] != *piVar2) {
          return 0;
        }
        uVar4 = uVar4 + 4;
        piVar1 = piVar1 + 4;
        piVar2 = piVar2 + 4;
      } while (uVar4 < param_3 >> 4);
    }
  }
  if (((param_3 & 0xf) != 0) && (uVar4 = param_3 & 0xfffffff0, uVar4 < param_3)) {
    pcVar3 = (char *)(uVar4 + param_1);
    do {
      if (*pcVar3 != pcVar3[param_2 - param_1]) {
        return 0;
      }
      uVar4 = uVar4 + 1;
      pcVar3 = pcVar3 + 1;
    } while (uVar4 < param_3);
  }
  return 1;
}

