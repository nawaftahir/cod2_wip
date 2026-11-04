extern int FUN_100566a0();


void FUN_10056a90(unsigned int param_1,int param_2,int param_3,int param_4)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int *piVar7;
  
  if (param_3 < param_4) {
    iVar3 = param_3 * 2;
    piVar7 = (int *)(param_3 * 0x20 + 0xc + param_2);
    do {
      iVar4 = 0;
      if (param_4 < iVar3) {
        piVar1 = (int *)0x0;
        if (0 < iVar3) {
          piVar2 = (int *)(param_2 + 0x18);
          iVar5 = param_3;
          do {
            if (iVar4 < *piVar2) {
              piVar1 = piVar2 + -6;
              iVar4 = *piVar2;
            }
            piVar2 = piVar2 + 8;
            iVar5 = iVar5 + -1;
          } while (iVar5 != 0);
        }
      }
      else {
        piVar1 = (int *)0x0;
        if (0 < iVar3) {
          piVar2 = (int *)(param_2 + 0x1c);
          iVar5 = param_3;
          do {
            if ((iVar4 < *piVar2) && (0 < piVar2[-1])) {
              piVar1 = piVar2 + -7;
              iVar4 = *piVar2;
            }
            piVar2 = piVar2 + 8;
            iVar5 = iVar5 + -1;
          } while (iVar5 != 0);
        }
      }
      if (piVar1 == (int *)0x0) {
        return;
      }
      piVar7[-2] = piVar1[1];
      *piVar7 = piVar1[3];
      piVar7[2] = piVar1[5];
      piVar7[-3] = *piVar1;
      piVar7[-1] = piVar1[2];
      piVar7[1] = piVar1[4];
      iVar5 = (piVar1[5] - piVar1[4]) * 0x10;
      iVar4 = (piVar1[3] - piVar1[2]) * 0xc;
      iVar6 = 1;
      if (iVar4 < iVar5) {
        iVar6 = 2;
        iVar4 = iVar5;
      }
      if (iVar4 < (piVar1[1] - *piVar1) * 8) {
        iVar6 = 0;
      }
      if (iVar6 == 0) {
        iVar4 = (piVar1[1] + *piVar1) / 2;
        piVar1[1] = iVar4;
        piVar7[-3] = iVar4 + 1;
      }
      else if (iVar6 == 1) {
        iVar4 = (piVar1[3] + piVar1[2]) / 2;
        piVar1[3] = iVar4;
        piVar7[-1] = iVar4 + 1;
      }
      else if (iVar6 == 2) {
        iVar4 = (piVar1[5] + piVar1[4]) / 2;
        piVar1[5] = iVar4;
        piVar7[1] = iVar4 + 1;
      }
      FUN_100566a0(piVar1);
      FUN_100566a0(piVar7 + -3);
      param_3 = param_3 + 1;
      iVar3 = iVar3 + 2;
      piVar7 = piVar7 + 8;
    } while (param_3 < param_4);
  }
  return;
}


