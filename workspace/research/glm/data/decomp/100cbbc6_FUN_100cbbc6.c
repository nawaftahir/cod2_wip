// 100cbbc6 size=70 FUN_100cbbc6

void FUN_100cbbc6(int param_1,uint *param_2)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  
  if (1 < *param_2) {
    FUN_10086920(FUN_100cbbac,param_1,*param_2,0);
    uVar2 = 1;
    uVar3 = 1;
    if (1 < *param_2) {
      do {
        iVar1 = *(int *)(param_1 + uVar2 * 4);
        if (iVar1 != *(int *)(param_1 + -4 + uVar2 * 4)) {
          *(int *)(param_1 + uVar3 * 4) = iVar1;
          uVar3 = uVar3 + 1;
        }
        uVar2 = uVar2 + 1;
      } while (uVar2 < *param_2);
    }
    *param_2 = uVar3;
  }
  return;
}


