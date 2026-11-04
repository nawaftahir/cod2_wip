// 100899b7 size=241 FUN_100899b7

undefined4 FUN_100899b7(int param_1,int *param_2,uint param_3)

{
  int iVar1;
  int *piVar2;
  uint uVar3;
  int in_ECX;
  uint uVar4;
  
  piVar2 = param_2;
  uVar4 = 1;
  if (1 < param_3) {
    do {
      if (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + param_2[uVar4] * 4) + 0x20) !=
          *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_2 * 4) + 0x20)) {
        uVar4 = 0;
        if (param_3 == 0) {
          return 0;
        }
        do {
          param_2 = (int *)0x0;
          do {
            uVar3 = (int)param_2 + uVar4 & 3;
            iVar1 = *(int *)(param_1 + uVar3 * 4);
            if ((iVar1 != -1) &&
               (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + piVar2[uVar4] * 4) + 0x20) ==
                *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar1 * 4) + 0x20))) {
              piVar2[uVar4] = *(int *)(param_1 + uVar3 * 4);
              break;
            }
            param_2 = (int *)((int)param_2 + 1);
          } while (param_2 < 4);
          uVar4 = uVar4 + 1;
          if (param_3 <= uVar4) {
            return 0;
          }
        } while( true );
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < param_3);
  }
  param_2 = (int *)0x0;
  while( true ) {
    uVar4 = (int)param_2 - 1U & 3;
    iVar1 = *(int *)(param_1 + uVar4 * 4);
    if ((iVar1 != -1) &&
       (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar2 * 4) + 0x20) ==
        *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar1 * 4) + 0x20))) break;
    param_2 = (int *)((int)param_2 + 1);
    if (3 < param_2) {
      return 0;
    }
  }
  uVar3 = 0;
  if (param_3 == 0) {
    return 0;
  }
  do {
    piVar2[uVar3] = *(int *)(param_1 + uVar4 * 4);
    uVar3 = uVar3 + 1;
  } while (uVar3 < param_3);
  return 0;
}


