
void FUN_004274b0(char param_1,float param_2,float param_3)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int *piVar4;
  int local_20;
  float local_1c;
  float local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  
  FUN_00425910();
  if (param_1 == '\0') {
    iVar1 = FUN_00427290();
  }
  else {
    iVar1 = FUN_00427410();
  }
  piVar3 = (int *)(DAT_01128d90 * 0x1c + 0x24 + iVar1);
  piVar4 = &local_20;
  for (iVar2 = 7; iVar2 != 0; iVar2 = iVar2 + -1) {
    *piVar4 = *piVar3;
    piVar3 = piVar3 + 1;
    piVar4 = piVar4 + 1;
  }
  local_c = 0;
  local_14 = 0;
  local_10 = 0;
  local_1c = (float)*(int *)(local_20 + 0x14) * param_2;
  local_18 = (float)*(int *)(local_20 + 0x18) * param_3;
  FUN_00426dc0(&local_20);
  return;
}

