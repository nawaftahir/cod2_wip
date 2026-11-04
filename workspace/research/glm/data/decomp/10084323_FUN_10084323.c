// 10084323 size=195 FUN_10084323

int FUN_10084323(int param_1,int *param_2,int *param_3)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int *piVar4;
  int *piVar5;
  
  piVar5 = param_2;
  iVar1 = param_1;
  piVar4 = param_3;
  if (param_3 == (int *)0x0) {
    piVar4 = &param_1;
  }
  iVar2 = *(int *)(param_1 + 4);
  if (iVar2 == 9) {
    iVar2 = *(int *)(param_1 + 0x10);
    iVar1 = 1;
    piVar5 = piVar4;
    if ((iVar2 == 1) || (iVar2 == 0)) {
      *param_2 = 1;
      iVar1 = *(int *)(param_1 + 0x1c);
    }
    else if (iVar2 == 2) {
      *param_2 = *(int *)(param_1 + 0x1c);
      iVar1 = *(int *)(param_1 + 0x18);
    }
    else {
      if (iVar2 != 3) {
        return -0x7fffbffb;
      }
      *param_2 = 1;
    }
  }
  else {
    if (iVar2 != 8) {
      if (iVar2 != 1) {
        return -0x7fffbffb;
      }
      *param_2 = 0;
      *piVar4 = 0;
      do {
        iVar2 = FUN_10084323(*(undefined4 *)(*(int *)(*(int *)(iVar1 + 8) + 0x18) + 0x20),&param_3,
                             &param_2);
        if (iVar2 < 0) {
          return iVar2;
        }
        *piVar5 = *piVar5 + (int)param_3;
        piVar3 = (int *)*piVar4;
        if ((int *)*piVar4 < param_2) {
          piVar3 = param_2;
        }
        *piVar4 = (int)piVar3;
        iVar1 = *(int *)(iVar1 + 0xc);
      } while (iVar1 != 0);
      return 0;
    }
    iVar2 = FUN_10084323(*(undefined4 *)(param_1 + 0x10),param_2,piVar4);
    if (iVar2 < 0) {
      return iVar2;
    }
    iVar1 = *(int *)(iVar1 + 0x14) * *piVar5;
  }
  *piVar5 = iVar1;
  return 0;
}


