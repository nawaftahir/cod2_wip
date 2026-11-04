
int * __thiscall FUN_0041f2d0(int *param_1,int *param_2)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  
  iVar3 = *param_2;
  iVar4 = *param_1;
  piVar1 = (int *)(iVar3 + -0x10);
  piVar5 = (int *)(iVar4 + -0x10);
  if (piVar1 != piVar5) {
    piVar2 = (int *)(iVar4 + -4);
    if ((-1 < *(int *)(iVar4 + -4)) && (*piVar1 == *piVar5)) {
      iVar4 = FUN_0041f340(piVar1);
      LOCK();
      iVar3 = *piVar2;
      *piVar2 = *piVar2 + -1;
      UNLOCK();
      if (iVar3 == 1 || iVar3 + -1 < 0) {
        (**(code **)(*(int *)*piVar5 + 4))(piVar5);
      }
      *param_1 = iVar4 + 0x10;
      return param_1;
    }
    FUN_00402b30(iVar3,*(undefined4 *)(iVar3 + -0xc));
  }
  return param_1;
}

