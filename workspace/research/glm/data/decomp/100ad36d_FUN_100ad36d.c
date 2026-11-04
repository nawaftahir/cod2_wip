// 100ad36d size=304 FUN_100ad36d

undefined4 FUN_100ad36d(int param_1,int param_2,int param_3)

{
  uint *puVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  int in_ECX;
  int iVar5;
  uint uVar6;
  int *piVar7;
  int local_58 [18];
  int local_10;
  int *local_c;
  int *local_8;
  
  piVar7 = local_58;
  for (iVar5 = 0x12; iVar5 != 0; iVar5 = iVar5 + -1) {
    *piVar7 = 0x1010101;
    piVar7 = piVar7 + 1;
  }
  if (*(int *)(in_ECX + 0x4c) != 0) {
    local_c = local_58;
    local_8 = *(int **)(in_ECX + 0x230);
    local_10 = *(int *)(in_ECX + 0x4c);
    do {
      puVar1 = (uint *)*local_8;
      if ((puVar1 != (uint *)0x0) && (uVar6 = *puVar1, uVar6 != 0)) {
        if ((uVar6 & 0xfff00000) == 0x72100000) {
          uVar6 = 0;
        }
        else {
          uVar6 = uVar6 & 0xfffff;
        }
        if (uVar6 < puVar1[1]) {
          iVar5 = *(int *)(in_ECX + 0x14);
          piVar7 = (int *)(puVar1[2] + uVar6 * 4);
          iVar4 = puVar1[1] - uVar6;
          do {
            iVar2 = *(int *)(iVar5 + *piVar7 * 4);
            if ((*(int *)(iVar2 + 4) == *(int *)(in_ECX + 0x88)) && (*(uint *)(iVar2 + 0x10) < 3)) {
              local_58[*(uint *)(iVar2 + 0x10) + *(int *)(iVar2 + 0xc) * 2 + *(int *)(iVar2 + 0xc)]
                   = 0;
            }
            piVar7 = piVar7 + 1;
            iVar4 = iVar4 + -1;
          } while (iVar4 != 0);
        }
        piVar3 = local_c;
        piVar7 = local_c + 1;
        *local_c = 0;
        *piVar7 = 0;
        piVar3[2] = 0;
      }
      local_8 = local_8 + 1;
      local_c = local_c + 3;
      local_10 = local_10 + -1;
    } while (local_10 != 0);
  }
  iVar5 = 0;
  uVar6 = 0;
  do {
    if (local_58[uVar6] != 0) {
      if (*(int *)(param_2 + (uVar6 / 3) * 4) == 0) {
        iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),uVar6 / 3,uVar6 % 3,0);
        *(int *)(param_1 + iVar5 * 4) = iVar4;
        if (iVar4 == -1) {
          return 0x8007000e;
        }
        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x3c) = 0;
        iVar5 = iVar5 + 1;
        if (iVar5 == param_3) {
          return 0;
        }
      }
    }
    uVar6 = uVar6 + 1;
    if (0x11 < uVar6) {
      FUN_1008b0b5();
      return 0x80004005;
    }
  } while( true );
}


