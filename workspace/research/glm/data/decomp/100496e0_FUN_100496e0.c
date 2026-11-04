// 100496e0 size=587 FUN_100496e0

void FUN_100496e0(int param_1,int *param_2)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  undefined4 *puVar4;
  int *piVar5;
  undefined4 *puVar6;
  short *psVar7;
  int *piVar8;
  int iStack_c;
  
  piVar1 = param_2;
  if (param_2[5] != 100) {
    *(undefined4 *)(*param_2 + 0x14) = 0x14;
    *(int *)(*param_2 + 0x18) = param_2[5];
    (**(code **)*param_2)(param_2);
  }
  param_2[9] = *(int *)(param_1 + 0x24);
  param_2[10] = *(int *)(param_1 + 0x28);
  param_2[0xb] = *(int *)(param_1 + 0x2c);
  param_2[0xc] = *(int *)(param_1 + 0x30);
  FUN_10046e00();
  FUN_100471c0();
  param_2[0x10] = *(int *)(param_1 + 200);
  piVar8 = (int *)(param_1 + 0x98);
  *(undefined1 *)((int)param_2 + 0xbb) = *(undefined1 *)(param_1 + 0x112);
  piVar5 = param_2 + 0x14;
  iStack_c = 4;
  do {
    if (*piVar8 != 0) {
      if (*piVar5 == 0) {
        iVar2 = (**(code **)param_2[1])(param_2,0,0x82);
        *(undefined1 *)(iVar2 + 0x80) = 0;
        *piVar5 = iVar2;
      }
      puVar6 = (undefined4 *)*piVar8;
      puVar4 = (undefined4 *)*piVar5;
      for (iVar2 = 0x20; iVar2 != 0; iVar2 = iVar2 + -1) {
        *puVar4 = *puVar6;
        puVar6 = puVar6 + 1;
        puVar4 = puVar4 + 1;
      }
      *(undefined1 *)(*piVar5 + 0x80) = 0;
    }
    piVar8 = piVar8 + 1;
    piVar5 = piVar5 + 1;
    iStack_c = iStack_c + -1;
  } while (iStack_c != 0);
  iVar2 = *(int *)(param_1 + 0x2c);
  param_2[0x11] = iVar2;
  if ((iVar2 < 1) || (10 < iVar2)) {
    *(undefined4 *)(*param_2 + 0x14) = 0x1a;
    *(int *)(*param_2 + 0x18) = param_2[0x11];
    *(undefined4 *)(*param_2 + 0x1c) = 10;
    (**(code **)*param_2)(param_2);
  }
  puVar6 = *(undefined4 **)(param_1 + 0xcc);
  puVar4 = (undefined4 *)param_2[0x13];
  iStack_c = 0;
  if (0 < param_2[0x11]) {
    do {
      *puVar4 = *puVar6;
      puVar4[2] = puVar6[2];
      puVar4[3] = puVar6[3];
      iVar2 = puVar6[4];
      puVar4[4] = iVar2;
      if (((iVar2 < 0) || (3 < iVar2)) || (*(int *)(param_1 + 0x98 + iVar2 * 4) == 0)) {
        *(undefined4 *)(*piVar1 + 0x14) = 0x34;
        *(int *)(*piVar1 + 0x18) = iVar2;
        (**(code **)*piVar1)(piVar1);
      }
      psVar7 = *(short **)(param_1 + 0x98 + iVar2 * 4);
      if (puVar6[0x13] != 0) {
        iVar3 = puVar6[0x13] - (int)psVar7;
        param_2 = (int *)0x40;
        do {
          if (*(short *)(iVar3 + (int)psVar7) != *psVar7) {
            *(undefined4 *)(*piVar1 + 0x14) = 0x2c;
            *(int *)(*piVar1 + 0x18) = iVar2;
            (**(code **)*piVar1)(piVar1);
          }
          psVar7 = psVar7 + 1;
          param_2 = (int *)((int)param_2 + -1);
        } while (param_2 != (int *)0x0);
      }
      iStack_c = iStack_c + 1;
      puVar6 = puVar6 + 0x15;
      puVar4 = puVar4 + 0x15;
    } while (iStack_c < piVar1[0x11]);
  }
  if (*(char *)(param_1 + 0x108) != '\0') {
    if (*(char *)(param_1 + 0x109) == '\x01') {
      *(undefined1 *)((int)piVar1 + 0xcd) = 1;
      *(undefined1 *)((int)piVar1 + 0xce) = *(undefined1 *)(param_1 + 0x10a);
    }
    *(undefined1 *)((int)piVar1 + 0xcf) = *(undefined1 *)(param_1 + 0x10b);
    *(undefined2 *)(piVar1 + 0x34) = *(undefined2 *)(param_1 + 0x10c);
    *(undefined2 *)((int)piVar1 + 0xd2) = *(undefined2 *)(param_1 + 0x10e);
  }
  return;
}


