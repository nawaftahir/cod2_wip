


unsigned int FUN_1007db60(int param_1,int *param_2)

{
  unsigned int *puVar1;
  unsigned int uVar2;
  int iVar3;
  
  if (param_2 == (int *)0x0) {
    uVar2 = 0x8876086c;
  }
  else if (((*(unsigned int *)(param_1 + 0xc) < 0x1c) || (puVar1 = *(unsigned int **)(param_1 + 8), *puVar1 < 0x1c))
          || (*(unsigned int *)(param_1 + 0xc) <= puVar1[1])) {
    uVar2 = 0x88760b59;
  }
  else {
    *param_2 = 0;
    param_2[1] = 0;
    param_2[2] = 0;
    if (puVar1[1] == 0) {
      iVar3 = 0;
    }
    else {
      iVar3 = *(int *)(param_1 + 8) + puVar1[1];
    }
    *param_2 = iVar3;
    param_2[1] = puVar1[2];
    param_2[2] = puVar1[3];
    uVar2 = 0;
  }
  return uVar2;
}


