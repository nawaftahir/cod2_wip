


void FUN_10055c10(int param_1)

{
  int iVar1;
  unsigned char *puVar2;
  unsigned int uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  unsigned char *puVar8;
  int iVar9;
  int iVar10;
  int local_18;
  int iStack_14;
  int *piStack_10;
  char cStack_c;
  
  iVar1 = *(int *)(param_1 + 0x1b0);
  if (*(int *)(param_1 + 0x54) == 1) {
    local_18 = 0x1fe;
    *(unsigned char *)(iVar1 + 0x1c) = 1;
  }
  else {
    local_18 = 0;
    *(unsigned char *)(iVar1 + 0x1c) = 0;
  }
  uVar3 = (**(void **)(*(int *)(param_1 + 4) + 8))
                    (param_1,1,local_18 + 0x100,*(unsigned int *)(param_1 + 0x6c));
  *(unsigned int *)(iVar1 + 0x18) = uVar3;
  iVar4 = *(int *)(iVar1 + 0x14);
  iStack_14 = 0;
  if (0 < *(int *)(param_1 + 0x6c)) {
    piStack_10 = (int *)(iVar1 + 0x20);
    do {
      iVar6 = *piStack_10;
      iVar4 = iVar4 / iVar6;
      if (local_18 != 0) {
        *(int *)(*(int *)(iVar1 + 0x18) + iStack_14 * 4) =
             *(int *)(*(int *)(iVar1 + 0x18) + iStack_14 * 4) + 0xff;
      }
      puVar2 = *(unsigned char **)(*(int *)(iVar1 + 0x18) + iStack_14 * 4);
      iVar5 = (iVar6 + 0xfe) / (iVar6 * 2 + -2);
      iVar9 = 0;
      iVar10 = 0;
      do {
        if (iVar5 < iVar10) {
          iVar7 = iVar9 * 0x1fe;
          do {
            iVar5 = (iVar7 + 0x2fc + iVar6) / (iVar6 * 2 + -2);
            iVar9 = iVar9 + 1;
            iVar7 = iVar7 + 0x1fe;
          } while (iVar5 < iVar10);
        }
        cStack_c = (char)iVar4;
        puVar2[iVar10] = (char)iVar9 * cStack_c;
        iVar10 = iVar10 + 1;
      } while (iVar10 < 0x100);
      if (local_18 != 0) {
        iVar6 = 1;
        puVar8 = puVar2;
        do {
          puVar8 = puVar8 + -1;
          *puVar8 = *puVar2;
          puVar2[iVar6 + 0xff] = puVar2[0xff];
          iVar6 = iVar6 + 1;
        } while (iVar6 < 0x100);
      }
      iStack_14 = iStack_14 + 1;
      piStack_10 = piStack_10 + 1;
    } while (iStack_14 < *(int *)(param_1 + 0x6c));
  }
  return;
}


