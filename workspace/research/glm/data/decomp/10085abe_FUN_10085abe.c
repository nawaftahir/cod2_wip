// 10085abe size=180 FUN_10085abe

undefined4 FUN_10085abe(undefined4 *param_1)

{
  uint uVar1;
  undefined4 uVar2;
  undefined4 *in_ECX;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  
  if (param_1 == (undefined4 *)0x0) {
    uVar2 = 0x80004005;
  }
  else {
    *in_ECX = *param_1;
    uVar1 = param_1[1];
    if ((uint)in_ECX[1] < uVar1) {
      if (uVar1 < 9) {
        in_ECX[2] = in_ECX + 0x10;
      }
      else {
        iVar3 = FUN_100857f7(uVar1);
        in_ECX[2] = iVar3;
        if (iVar3 == 0) {
          return 0x8007000e;
        }
      }
    }
    iVar3 = param_1[1];
    in_ECX[1] = iVar3;
    puVar4 = (undefined4 *)param_1[2];
    puVar5 = (undefined4 *)in_ECX[2];
    for (; iVar3 != 0; iVar3 = iVar3 + -1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    uVar1 = param_1[3];
    if ((uint)in_ECX[3] < uVar1) {
      if (uVar1 < 5) {
        in_ECX[4] = in_ECX + 0x18;
      }
      else {
        iVar3 = FUN_100857f7(uVar1);
        in_ECX[4] = iVar3;
        if (iVar3 == 0) {
          return 0x8007000e;
        }
      }
    }
    iVar3 = param_1[3];
    in_ECX[3] = iVar3;
    puVar4 = (undefined4 *)param_1[4];
    puVar5 = (undefined4 *)in_ECX[4];
    for (; iVar3 != 0; iVar3 = iVar3 + -1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    in_ECX[9] = param_1[9];
    in_ECX[10] = param_1[10];
    in_ECX[0xc] = param_1[0xc];
    in_ECX[0xf] = param_1[0xf];
    uVar2 = 0;
  }
  return uVar2;
}


