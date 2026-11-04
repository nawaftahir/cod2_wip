// 1009ab7f size=330 FUN_1009ab7f

int FUN_1009ab7f(int param_1,int param_2)

{
  int iVar1;
  int in_ECX;
  int iVar2;
  
  if (*(int *)(in_ECX + 0x10) == 0) {
    FUN_10099580();
    iVar1 = -0x7fffbffb;
  }
  else {
    iVar2 = *(int *)(param_1 + 0x14) + 0x10;
    for (iVar1 = FUN_100997e2(iVar2,*(int *)(in_ECX + 0x10)); iVar1 != 0;
        iVar1 = *(int *)(iVar1 + 0xc)) {
      if ((*(int *)(*(int *)(iVar1 + 8) + 0x2c) == 0) &&
         ((*(int *)(param_1 + 0x10) != 2 || (*(int *)(*(int *)(iVar1 + 8) + 0x10) != 2)))) {
        if ((param_2 != 0) && (iVar1 = FUN_100827f5(param_1,*(undefined4 *)(iVar1 + 8)), iVar1 != 0)
           ) {
          return 0;
        }
        goto LAB_1009ac0a;
      }
    }
    iVar1 = *(int *)(*(int *)(in_ECX + 0x10) + 0x20);
    if ((((iVar1 == 0) || (*(int *)(*(int *)(in_ECX + 0x10) + 0x10) != 3)) ||
        (*(int *)(iVar1 + 0x10) != 2)) || (iVar1 = FUN_100997e2(iVar2,iVar1), iVar1 == 0)) {
      iVar1 = FUN_1006506e(0x14);
      iVar2 = 0;
      if (iVar1 != 0) {
        iVar2 = FUN_10082872(0,0,"Stmts");
      }
      if (iVar2 != 0) {
        iVar1 = FUN_10082816(param_1);
        *(int *)(iVar2 + 8) = iVar1;
        if (iVar1 != 0) {
          *(undefined4 *)(iVar1 + 0x20) = *(undefined4 *)(*(int *)(in_ECX + 0x10) + 0x14);
          *(undefined4 *)(param_1 + 0x20) = *(undefined4 *)(*(int *)(iVar2 + 8) + 0x20);
          *(undefined4 *)(*(int *)(iVar2 + 8) + 0x24) = *(undefined4 *)(in_ECX + 0x4c);
          *(undefined4 *)(param_1 + 0x24) = *(undefined4 *)(*(int *)(iVar2 + 8) + 0x24);
          *(int *)(in_ECX + 0x4c) = *(int *)(in_ECX + 0x4c) + 1;
          *(undefined4 *)(iVar2 + 0xc) = *(undefined4 *)(*(int *)(in_ECX + 0x10) + 0x18);
          *(int *)(*(int *)(in_ECX + 0x10) + 0x18) = iVar2;
          iVar1 = FUN_100996af(*(undefined4 *)(in_ECX + 0x10),*(undefined4 *)(iVar2 + 8));
          if (-1 < iVar1) {
            return 0;
          }
          return iVar1;
        }
      }
      iVar1 = -0x7ff8fff2;
    }
    else {
LAB_1009ac0a:
      FUN_100994dd();
      iVar1 = -0x7fffbffb;
    }
  }
  return iVar1;
}


