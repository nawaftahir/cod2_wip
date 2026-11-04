// 10044140 size=387 FUN_10044140

undefined4 FUN_10044140(short *param_1,int *param_2,int param_3,undefined4 *param_4)

{
  char cVar1;
  int in_EAX;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = (int)*param_1 - (int)param_2;
  iVar2 = iVar4;
  if (iVar4 < 0) {
    iVar2 = -iVar4;
    iVar4 = iVar4 + -1;
  }
  iVar3 = 0;
  if (iVar2 != 0) {
    do {
      iVar2 = iVar2 >> 1;
      iVar3 = iVar3 + 1;
    } while (iVar2 != 0);
    if (0xb < iVar3) {
      *(undefined4 *)(**(int **)(in_EAX + 0x20) + 0x14) = 6;
      (**(code **)**(undefined4 **)(in_EAX + 0x20))(*(undefined4 **)(in_EAX + 0x20));
    }
  }
  cVar1 = FUN_10044020(*(undefined4 *)(param_3 + iVar3 * 4));
  if ((cVar1 != '\0') && ((iVar3 == 0 || (cVar1 = FUN_10044020(iVar4), cVar1 != '\0')))) {
    iVar2 = 0;
    param_2 = &DAT_10191204;
    do {
      param_3 = (int)param_1[*param_2];
      if (param_3 == 0) {
        iVar2 = iVar2 + 1;
      }
      else {
        for (; 0xf < iVar2; iVar2 = iVar2 + -0x10) {
          cVar1 = FUN_10044020(param_4[0xf0]);
          if (cVar1 == '\0') {
            return 0;
          }
        }
        iVar4 = param_3;
        if (param_3 < 0) {
          iVar4 = -param_3;
          param_3 = param_3 + -1;
        }
        iVar4 = iVar4 >> 1;
        iVar3 = 1;
        if (iVar4 != 0) {
          do {
            iVar4 = iVar4 >> 1;
            iVar3 = iVar3 + 1;
          } while (iVar4 != 0);
          if (10 < iVar3) {
            *(undefined4 *)(**(int **)(in_EAX + 0x20) + 0x14) = 6;
            (**(code **)**(undefined4 **)(in_EAX + 0x20))(*(undefined4 **)(in_EAX + 0x20));
          }
        }
        cVar1 = FUN_10044020(param_4[iVar2 * 0x10 + iVar3]);
        if (cVar1 == '\0') {
          return 0;
        }
        cVar1 = FUN_10044020(param_3);
        if (cVar1 == '\0') {
          return 0;
        }
        iVar2 = 0;
      }
      param_2 = param_2 + 1;
    } while ((int)param_2 < 0x10191300);
    if ((iVar2 < 1) || (cVar1 = FUN_10044020(*param_4), cVar1 != '\0')) {
      return 1;
    }
  }
  return 0;
}


