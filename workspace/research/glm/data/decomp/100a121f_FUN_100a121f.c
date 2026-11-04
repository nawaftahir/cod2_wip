// 100a121f size=180 FUN_100a121f

undefined4 FUN_100a121f(int param_1)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  int in_ECX;
  
  if (*(int *)(in_ECX + 0x18) == 0) {
    return 0;
  }
  iVar1 = FUN_1006506e(0x24);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10083159();
  }
  if (iVar1 == 0) {
    return 0;
  }
  *(undefined4 *)(iVar1 + 0x10) = 1;
  iVar2 = *(int *)(in_ECX + 0x18);
  if (param_1 == 0) {
    if (*(int *)(iVar2 + 0x20) == 0) goto LAB_100a12af;
  }
  else if (*(int *)(iVar2 + 0x20) != 0) {
    uVar3 = FUN_100a0e06(0x15,*(undefined4 *)(iVar2 + 0x2c),param_1,1);
    *(undefined4 *)(iVar1 + 0x14) = uVar3;
    goto LAB_100a12af;
  }
  FUN_100994dd();
LAB_100a12af:
  iVar2 = FUN_1006506e(0x14);
  if (iVar2 == 0) {
    return 0;
  }
  uVar3 = FUN_10082872(iVar1,0,"Stmts");
  return uVar3;
}


