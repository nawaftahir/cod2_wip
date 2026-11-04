
void FUN_004b7330(undefined4 param_1,int *param_2)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  int *piVar4;
  
  uVar1 = FUN_004be490("handle",param_2);
  uVar2 = FUN_004be490(&DAT_00528ecc,param_2);
  uVar3 = FUN_004be450(&DAT_00528f5c);
  if (*param_2 < 2) {
    piVar4 = (int *)FUN_004c2460(uVar1,param_2);
    if ((*param_2 < 2) && (piVar4[2] == 0)) {
      (**(code **)(*piVar4 + 0x44))(uVar2,uVar3,param_2);
      if (1 < *param_2) {
        piVar4[2] = 1;
      }
      FUN_004b6c00(param_2);
    }
  }
  return;
}

