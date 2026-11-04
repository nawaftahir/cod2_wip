// 10055e00 size=79 FUN_10055e00

void FUN_10055e00(void)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int unaff_EBX;
  int iVar4;
  int *piVar5;
  
  iVar1 = *(int *)(unaff_EBX + 0x1b0);
  iVar4 = 0;
  if (0 < *(int *)(unaff_EBX + 0x6c)) {
    piVar5 = (int *)(iVar1 + 0x34);
    do {
      iVar2 = 0;
      if (0 < iVar4) {
        piVar3 = (int *)(iVar1 + 0x20);
        do {
          if (piVar5[-5] == *piVar3) {
            iVar2 = *(int *)(iVar1 + 0x34 + iVar2 * 4);
            if (iVar2 != 0) goto LAB_10055e3e;
            break;
          }
          iVar2 = iVar2 + 1;
          piVar3 = piVar3 + 1;
        } while (iVar2 < iVar4);
      }
      iVar2 = FUN_10055d80();
LAB_10055e3e:
      *piVar5 = iVar2;
      iVar4 = iVar4 + 1;
      piVar5 = piVar5 + 1;
    } while (iVar4 < *(int *)(unaff_EBX + 0x6c));
  }
  return;
}


