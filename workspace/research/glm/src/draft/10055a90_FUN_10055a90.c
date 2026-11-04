extern int FUN_10055960();


void FUN_10055a90(int *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int *piVar10;
  int iStack_28;
  int iStack_24;
  int *piStack_20;
  int iStack_1c;
  int iStack_18;
  
  iVar2 = param_1[0x6c];
  piStack_20 = (int *)(iVar2 + 0x20);
  iVar3 = FUN_10055960(param_1,piStack_20);
  if (param_1[0x1b] == 3) {
    iVar5 = *param_1;
    *(int *)(iVar5 + 0x18) = iVar3;
    *(int *)(iVar5 + 0x1c) = *piStack_20;
    *(unsigned int *)(iVar5 + 0x20) = *(unsigned int *)(iVar2 + 0x24);
    *(unsigned int *)(iVar5 + 0x24) = *(unsigned int *)(iVar2 + 0x28);
    *(unsigned int *)(*param_1 + 0x14) = 0x5e;
  }
  else {
    *(unsigned int *)(*param_1 + 0x14) = 0x5f;
    *(int *)(*param_1 + 0x18) = iVar3;
  }
  (**(void **)(*param_1 + 4))(param_1,1);
  piVar4 = (int *)(**(void **)(param_1[1] + 8))(param_1,1,iVar3,param_1[0x1b]);
  iStack_18 = 0;
  piVar10 = piVar4;
  iStack_24 = iVar3;
  if (0 < param_1[0x1b]) {
    do {
      iStack_1c = *piStack_20;
      iVar5 = iStack_24 / iStack_1c;
      if (0 < iStack_1c) {
        iVar1 = iStack_1c + -1;
        iVar8 = 0;
        iStack_28 = 0;
        do {
          for (iVar7 = iVar8; iVar7 < iVar3; iVar7 = iVar7 + iStack_24) {
            iVar6 = 0;
            if (0 < iVar5) {
              do {
                iVar9 = *piVar10 + iVar6;
                iVar6 = iVar6 + 1;
                *(char *)(iVar7 + iVar9) = (char)((iVar1 / 2 + iStack_28) / iVar1);
              } while (iVar6 < iVar5);
            }
          }
          iStack_28 = iStack_28 + 0xff;
          iVar8 = iVar8 + iVar5;
          iStack_1c = iStack_1c + -1;
        } while (iStack_1c != 0);
      }
      iStack_18 = iStack_18 + 1;
      piStack_20 = piStack_20 + 1;
      piVar10 = piVar10 + 1;
      iStack_24 = iVar5;
    } while (iStack_18 < param_1[0x1b]);
    *(int *)(iVar2 + 0x14) = iVar3;
    *(int **)(iVar2 + 0x10) = piVar4;
    return;
  }
  *(int *)(iVar2 + 0x14) = iVar3;
  *(int **)(iVar2 + 0x10) = piVar4;
  return;
}


