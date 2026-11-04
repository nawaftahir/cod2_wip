// 1001c2f0 size=196 FUN_1001c2f0

undefined4 FUN_1001c2f0(undefined4 param_1,undefined4 param_2,int param_3,int param_4)

{
  short sVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  undefined4 *unaff_EDI;
  
  iVar4 = 0;
  if (0 < param_3) {
    do {
      sVar1 = *(short *)(param_4 + iVar4 * 8);
      if (sVar1 == 2) {
        iVar3 = 0;
        if (*(ushort *)((int)unaff_EDI + 0x36) == 0) {
LAB_1001c32d:
          FUN_10061c80("material \'%s\' using technique \'%s\' from techniqueSet \'%s\' doesn\'t expose a \'%s\' constant\n"
                       ,*unaff_EDI,param_2,param_1,*(undefined4 *)(param_4 + 4 + iVar4 * 8));
          return 0;
        }
        piVar2 = (int *)unaff_EDI[0x10];
        while (*piVar2 != *(int *)(param_4 + 4 + iVar4 * 8)) {
          iVar3 = iVar3 + 1;
          piVar2 = piVar2 + 5;
          if ((int)(uint)*(ushort *)((int)unaff_EDI + 0x36) <= iVar3) goto LAB_1001c32d;
        }
      }
      else if (sVar1 == 4) {
        iVar3 = 0;
        if (*(ushort *)(unaff_EDI + 0xd) == 0) {
LAB_1001c37c:
          FUN_10061c80("material \'%s\' using technique \'%s\' from techniqueSet \'%s\' doesn\'t expose a \'%s\' texture\n"
                       ,*unaff_EDI,param_2,param_1,*(undefined4 *)(param_4 + 4 + iVar4 * 8));
          return 0;
        }
        piVar2 = (int *)unaff_EDI[0xf];
        while (*piVar2 != *(int *)(param_4 + 4 + iVar4 * 8)) {
          iVar3 = iVar3 + 1;
          piVar2 = piVar2 + 3;
          if ((int)(uint)*(ushort *)(unaff_EDI + 0xd) <= iVar3) goto LAB_1001c37c;
        }
      }
      iVar4 = iVar4 + 1;
    } while (iVar4 < param_3);
  }
  return 1;
}


