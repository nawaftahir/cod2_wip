// 10083357 size=76 FUN_10083357

void FUN_10083357(int *param_1,undefined4 *param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 *in_ECX;
  int iVar3;
  undefined4 *puVar4;
  
  FUN_100827bb(0xe);
  *in_ECX = &PTR_FUN_10110068;
  in_ECX[4] = *param_1;
  in_ECX[5] = param_1[1];
  in_ECX[6] = param_1[2];
  in_ECX[7] = param_1[3];
  iVar1 = in_ECX[4];
  puVar4 = in_ECX + 8;
  for (iVar3 = 8; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar4 = *param_2;
    param_2 = param_2 + 1;
    puVar4 = puVar4 + 1;
  }
  if ((iVar1 == 4) && (in_ECX[6] != 0)) {
    uVar2 = FUN_10082816(in_ECX[6]);
    in_ECX[6] = uVar2;
  }
  return;
}


