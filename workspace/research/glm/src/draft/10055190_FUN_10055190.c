extern int FUN_10054f50();
extern int FUN_10055000();


void FUN_10055190(int *param_1)

{
  int iVar1;
  int *piVar2;
  int *piVar3;
  int iVar4;
  
  iVar1 = param_1[1];
  iVar4 = 0;
  piVar2 = *(int **)(iVar1 + 0x44);
  for (piVar3 = piVar2; piVar3 != (int *)0x0; piVar3 = (int *)piVar3[9]) {
    if (*piVar3 == 0) {
      iVar4 = iVar4 + piVar3[3] * piVar3[2];
    }
  }
  for (piVar3 = *(int **)(iVar1 + 0x48); piVar3 != (int *)0x0; piVar3 = (int *)piVar3[9]) {
    if (*piVar3 == 0) {
      iVar4 = iVar4 + piVar3[3] * piVar3[2] * 0x80;
    }
  }
  if (0 < iVar4) {
    for (; piVar2 != (int *)0x0; piVar2 = (int *)piVar2[9]) {
      if (*piVar2 == 0) {
        if ((int)((piVar2[1] - 1U) / (unsigned int)piVar2[3] + 1) < 0x3b9aca01) {
          piVar2[4] = piVar2[1];
        }
        else {
          piVar2[4] = piVar2[3] * 1000000000;
          *(unsigned int *)(*param_1 + 0x14) = 0x31;
          (**(void **)*param_1)(param_1);
          *(unsigned char *)((int)piVar2 + 0x22) = 1;
        }
        iVar4 = FUN_10054f50(param_1,1,piVar2[2],piVar2[4]);
        *piVar2 = iVar4;
        piVar2[5] = *(int *)(iVar1 + 0x50);
        piVar2[6] = 0;
        piVar2[7] = 0;
        *(unsigned char *)((int)piVar2 + 0x21) = 0;
      }
    }
    for (piVar3 = *(int **)(iVar1 + 0x48); piVar3 != (int *)0x0; piVar3 = (int *)piVar3[9]) {
      if (*piVar3 == 0) {
        if ((int)((piVar3[1] - 1U) / (unsigned int)piVar3[3] + 1) < 0x3b9aca01) {
          piVar3[4] = piVar3[1];
        }
        else {
          piVar3[4] = piVar3[3] * 1000000000;
          *(unsigned int *)(*param_1 + 0x14) = 0x31;
          (**(void **)*param_1)(param_1);
          *(unsigned char *)((int)piVar3 + 0x22) = 1;
        }
        iVar4 = FUN_10055000(param_1,1,piVar3[2],piVar3[4]);
        *piVar3 = iVar4;
        piVar3[5] = *(int *)(iVar1 + 0x50);
        piVar3[6] = 0;
        piVar3[7] = 0;
        *(unsigned char *)((int)piVar3 + 0x21) = 0;
      }
    }
  }
  return;
}


