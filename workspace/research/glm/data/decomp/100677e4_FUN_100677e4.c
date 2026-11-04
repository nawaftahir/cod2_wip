// 100677e4 size=395 FUN_100677e4

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Unable to track spacebase fully for stack */

int FUN_100677e4(char *param_1,double *param_2)

{
  bool bVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  char *pcVar4;
  char *pcVar5;
  uint uVar6;
  char *pcVar7;
  double dVar8;
  undefined4 uStackY_1c;
  
  bVar1 = false;
  if (param_1 < *(char **)(in_ECX + 4)) {
    uStackY_1c = 0x10067804;
    iVar2 = _isdigit((int)*param_1);
    pcVar4 = param_1;
    if (iVar2 == 0) goto LAB_10067809;
    do {
      pcVar5 = pcVar4;
      pcVar4 = pcVar5 + 1;
      if (*(char **)(in_ECX + 4) <= pcVar4) break;
      uStackY_1c = 0x1006783e;
      iVar2 = _isdigit((int)*pcVar4);
    } while (iVar2 != 0);
    if ((pcVar4 < *(char **)(in_ECX + 4)) && (*pcVar4 == '.')) {
      pcVar4 = pcVar5 + 2;
      if (pcVar4 < *(char **)(in_ECX + 4)) {
        do {
          uStackY_1c = 0x10067863;
          iVar2 = _isdigit((int)*pcVar4);
          if (iVar2 == 0) break;
          pcVar4 = pcVar4 + 1;
        } while (pcVar4 < *(char **)(in_ECX + 4));
      }
    }
    else {
      bVar1 = true;
    }
LAB_1006788d:
    pcVar5 = pcVar4 + 1;
    if (pcVar5 < *(char **)(in_ECX + 4)) {
      uStackY_1c = 0x1006789e;
      iVar2 = _tolower((int)*pcVar4);
      if (iVar2 != 0x65) goto LAB_100678cc;
      uStackY_1c = 0x100678ad;
      iVar2 = _isdigit((int)*pcVar5);
      if (iVar2 == 0) goto LAB_100678cc;
      for (pcVar4 = pcVar4 + 2; pcVar4 < *(char **)(in_ECX + 4); pcVar4 = pcVar4 + 1) {
        uStackY_1c = 0x100678bf;
        iVar2 = _isdigit((int)*pcVar4);
        if (iVar2 == 0) break;
      }
    }
    else {
LAB_100678cc:
      if (pcVar4 + 2 < *(char **)(in_ECX + 4)) {
        uStackY_1c = 0x100678dd;
        iVar2 = _tolower((int)*pcVar4);
        if ((iVar2 == 0x65) && (*pcVar5 == '-')) {
          uStackY_1c = 0x100678f2;
          iVar2 = _isdigit((int)pcVar4[2]);
          if (iVar2 != 0) {
            for (pcVar4 = pcVar4 + 3; pcVar4 < *(char **)(in_ECX + 4); pcVar4 = pcVar4 + 1) {
              uStackY_1c = 0x10067905;
              iVar2 = _isdigit((int)*pcVar4);
              if (iVar2 == 0) break;
            }
            goto LAB_10067918;
          }
        }
      }
      if (bVar1) goto LAB_10067963;
    }
LAB_10067918:
    if (param_2 != (double *)0x0) {
      uVar6 = (int)pcVar4 - (int)param_1;
      iVar2 = -(uVar6 + 4 & 0xfffffffc);
      pcVar5 = param_1;
      pcVar7 = &stack0xffffffec + iVar2;
      for (uVar3 = uVar6 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
        *(undefined4 *)pcVar7 = *(undefined4 *)pcVar5;
        pcVar5 = pcVar5 + 4;
        pcVar7 = pcVar7 + 4;
      }
      for (uVar3 = uVar6 & 3; uVar3 != 0; uVar3 = uVar3 - 1) {
        *pcVar7 = *pcVar5;
        pcVar5 = pcVar5 + 1;
        pcVar7 = pcVar7 + 1;
      }
      *(undefined1 **)(&stack0xffffffe8 + iVar2) = &stack0xffffffec + iVar2;
      (&stack0xffffffec)[uVar6 + iVar2] = 0;
      *(undefined4 *)((int)&uStackY_1c + iVar2) = 0x10067956;
      dVar8 = _atof(*(char **)(&stack0xffffffe8 + iVar2));
      *param_2 = dVar8;
    }
    iVar2 = (int)pcVar4 - (int)param_1;
  }
  else {
LAB_10067809:
    if ((param_1 + 1 < *(char **)(in_ECX + 4)) && (*param_1 == '.')) {
      uStackY_1c = 0x10067827;
      iVar2 = _isdigit((int)param_1[1]);
      if (iVar2 != 0) {
        for (pcVar4 = param_1 + 2; pcVar4 < *(char **)(in_ECX + 4); pcVar4 = pcVar4 + 1) {
          uStackY_1c = 0x10067882;
          iVar2 = _isdigit((int)*pcVar4);
          if (iVar2 == 0) break;
        }
        goto LAB_1006788d;
      }
    }
LAB_10067963:
    iVar2 = 0;
  }
  return iVar2;
}


