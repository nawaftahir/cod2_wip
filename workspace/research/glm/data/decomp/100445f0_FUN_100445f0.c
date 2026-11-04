// 100445f0 size=224 FUN_100445f0

void FUN_100445f0(int *param_1,short *param_2,int *param_3)

{
  int in_EAX;
  int iVar1;
  int in_ECX;
  int iVar2;
  int *piVar3;
  int iVar4;
  
  iVar1 = *param_2 - in_ECX;
  if (iVar1 < 0) {
    iVar1 = -iVar1;
  }
  iVar4 = 0;
  if (iVar1 != 0) {
    do {
      iVar1 = iVar1 >> 1;
      iVar4 = iVar4 + 1;
    } while (iVar1 != 0);
    if (0xb < iVar4) {
      *(undefined4 *)(*param_1 + 0x14) = 6;
      (**(code **)*param_1)(param_1);
    }
  }
  piVar3 = (int *)(in_EAX + iVar4 * 4);
  *piVar3 = *piVar3 + 1;
  iVar1 = 0;
  piVar3 = &DAT_10191204;
  do {
    iVar4 = (int)param_2[*piVar3];
    if (iVar4 == 0) {
      iVar1 = iVar1 + 1;
    }
    else {
      if (0xf < iVar1) {
        iVar2 = (iVar1 - 0x10U >> 4) + 1;
        iVar1 = iVar1 + iVar2 * -0x10;
        param_3[0xf0] = iVar2 + param_3[0xf0];
      }
      if (iVar4 < 0) {
        iVar4 = -iVar4;
      }
      iVar4 = iVar4 >> 1;
      iVar2 = 1;
      if (iVar4 != 0) {
        do {
          iVar4 = iVar4 >> 1;
          iVar2 = iVar2 + 1;
        } while (iVar4 != 0);
        if (10 < iVar2) {
          *(undefined4 *)(*param_1 + 0x14) = 6;
          (**(code **)*param_1)(param_1);
        }
      }
      iVar2 = iVar1 * 0x10 + iVar2;
      param_3[iVar2] = param_3[iVar2] + 1;
      iVar1 = 0;
    }
    piVar3 = piVar3 + 1;
  } while ((int)piVar3 < 0x10191300);
  if (0 < iVar1) {
    *param_3 = *param_3 + 1;
  }
  return;
}


