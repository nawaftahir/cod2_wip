// 100822b1 size=29 FUN_100822b1

undefined4 FUN_100822b1(int param_1)

{
  int *piVar1;
  undefined4 uVar2;
  
  piVar1 = (int *)(param_1 + 4);
  *piVar1 = *piVar1 + -1;
  uVar2 = *(undefined4 *)(param_1 + 4);
  if (*piVar1 == 0) {
    FUN_10063863(1);
    uVar2 = 0;
  }
  return uVar2;
}


