
void FUN_004309e0(int param_1)

{
  int iVar1;
  int *piVar2;
  int iVar3;
  int *unaff_EBX;
  int *piVar4;
  int *piVar5;
  int local_c;
  int *local_8;
  
  if (((2 < unaff_EBX[1]) && (iVar1 = unaff_EBX[1] + -1, unaff_EBX[1] = iVar1, param_1 != iVar1)) &&
     (local_c = 0, 0 < *unaff_EBX)) {
    local_8 = unaff_EBX + param_1 * 0xe + 9;
    do {
      piVar2 = local_8;
      iVar1 = param_1;
      if (param_1 < unaff_EBX[1]) {
        do {
          piVar4 = piVar2 + 0xe;
          piVar5 = piVar2;
          for (iVar3 = 0xe; iVar3 != 0; iVar3 = iVar3 + -1) {
            *piVar5 = *piVar4;
            piVar4 = piVar4 + 1;
            piVar5 = piVar5 + 1;
          }
          iVar1 = iVar1 + 1;
          piVar2 = piVar2 + 0xe;
        } while (iVar1 < unaff_EBX[1]);
      }
      local_c = local_c + 1;
      local_8 = local_8 + 0xe0;
    } while (local_c < *unaff_EBX);
  }
  return;
}

