// 1007d515 size=542 FUN_1007d515

int FUN_1007d515(undefined4 param_1,undefined4 param_2,int param_3,undefined4 param_4,uint param_5,
                undefined4 *param_6,undefined4 *param_7)

{
  char *pcVar1;
  char cVar2;
  int *piVar3;
  int iVar4;
  int iVar5;
  undefined4 *puVar6;
  char *pcVar7;
  undefined4 *in_ECX;
  uint uVar8;
  uint uVar9;
  undefined4 *puVar10;
  
LAB_1007d529:
  iVar5 = param_3;
  if (param_6 != (undefined4 *)0x0) {
    *param_6 = 0;
  }
  if (param_7 != (undefined4 *)0x0) {
    *param_7 = 0;
  }
  param_5 = param_5 & 0xffffffe7;
  *in_ECX = param_1;
  iVar4 = FUN_1006e1ef(iVar5);
  if (iVar4 == 0) {
    if (*(int *)(iVar5 + 4) == 0xd) {
      iVar4 = iVar5;
      if ((uint)(*(int *)(iVar5 + 0x18) * *(int *)(iVar5 + 0x14)) < 2) {
        do {
          if (*(int *)(iVar4 + 0x1c) != 0) goto LAB_1007d579;
          while (iVar4 = *(int *)(iVar4 + 0x20), *(int *)(iVar4 + 4) != 0xd) {
LAB_1007d579:
            do {
              if (*(int *)(iVar4 + 4) != 1) break;
              iVar4 = *(int *)(iVar4 + 8);
            } while (iVar4 != 0);
            if ((*(int *)(iVar4 + 4) != 0xd) || (*(int *)(iVar4 + 0x1c) != 0)) {
              if ((*(int *)(iVar4 + 4) == 0xd) && (*(int *)(iVar4 + 0x1c) == 0x1b)) {
                iVar5 = FUN_1007d4d4(param_1,param_2,*(undefined4 *)(*(int *)(iVar4 + 0x24) + 0x20),
                                     *(undefined4 *)(*(int *)(iVar4 + 0x24) + 0x24),0,
                                     *(undefined4 *)(*(int *)(iVar4 + 0x20) + 0x18),param_5,param_6,
                                     param_7);
                return iVar5;
              }
              if (*(int *)(iVar4 + 4) == 0xe) {
                if ((*(int *)(iVar4 + 0x10) == 4) &&
                   (param_3 = *(int *)(iVar4 + 0x18), *(int *)(*(int *)(iVar4 + 0x18) + 4) == 0xd))
                goto LAB_1007d529;
                if (*(int *)(iVar4 + 0x10) == 5) {
                  if (param_6 != (undefined4 *)0x0) {
                    iVar5 = FUN_10081e27(*(undefined4 *)(iVar4 + 0x1c),param_6);
                    if (iVar5 < 0) {
                      return iVar5;
                    }
                    uVar9 = *(uint *)(iVar4 + 0x1c);
                    puVar10 = *(undefined4 **)(iVar4 + 0x18);
                    puVar6 = (undefined4 *)(**(code **)(*(int *)*param_6 + 0xc))((int *)*param_6);
                    for (uVar8 = uVar9 >> 2; uVar8 != 0; uVar8 = uVar8 - 1) {
                      *puVar6 = *puVar10;
                      puVar10 = puVar10 + 1;
                      puVar6 = puVar6 + 1;
                    }
                    for (uVar9 = uVar9 & 3; uVar9 != 0; uVar9 = uVar9 - 1) {
                      *(undefined1 *)puVar6 = *(undefined1 *)puVar10;
                      puVar10 = (undefined4 *)((int)puVar10 + 1);
                      puVar6 = (undefined4 *)((int)puVar6 + 1);
                    }
                  }
                  if (param_7 != (undefined4 *)0x0) {
                    *param_7 = 0;
                  }
                  return 0;
                }
                if (((*(int *)(iVar4 + 0x10) == 6) && (*(int *)(iVar4 + 0x20) == 9)) &&
                   (pcVar7 = *(char **)(iVar4 + 0x28), pcVar7 != (char *)0x0)) {
                  if (param_6 != (undefined4 *)0x0) {
                    pcVar1 = pcVar7 + 1;
                    do {
                      cVar2 = *pcVar7;
                      pcVar7 = pcVar7 + 1;
                    } while (cVar2 != '\0');
                    iVar5 = FUN_10081e27(pcVar7 + (1 - (int)pcVar1),param_6);
                    if (iVar5 < 0) {
                      return iVar5;
                    }
                    piVar3 = (int *)*param_6;
                    uVar9 = (**(code **)(*piVar3 + 0x10))(piVar3);
                    puVar10 = *(undefined4 **)(iVar4 + 0x28);
                    puVar6 = (undefined4 *)(**(code **)(*piVar3 + 0xc))(piVar3);
                    for (uVar8 = uVar9 >> 2; uVar8 != 0; uVar8 = uVar8 - 1) {
                      *puVar6 = *puVar10;
                      puVar10 = puVar10 + 1;
                      puVar6 = puVar6 + 1;
                    }
                    for (uVar9 = uVar9 & 3; uVar9 != 0; uVar9 = uVar9 - 1) {
                      *(undefined1 *)puVar6 = *(undefined1 *)puVar10;
                      puVar10 = (undefined4 *)((int)puVar10 + 1);
                      puVar6 = (undefined4 *)((int)puVar6 + 1);
                    }
                  }
                  if (param_7 == (undefined4 *)0x0) {
                    return 0;
                  }
                  *param_7 = 1;
                  return 0;
                }
              }
              pcVar7 = "non-trivial object expressions not yet implemented";
              goto LAB_1007d71c;
            }
          }
        } while( true );
      }
      pcVar7 = "expressions returning objects in an array or struct not yet implemented";
LAB_1007d71c:
      FUN_1006dca1(in_ECX,iVar5,0xdac,pcVar7);
      iVar5 = -0x7fffbfff;
    }
    else {
      FUN_1006dca1(in_ECX,iVar5,0,"internal error: expression expected");
      iVar5 = -0x7fffbffb;
    }
  }
  else {
    if ((((iVar5 != 0) && (*(int *)(iVar5 + 4) == 0xd)) &&
        (iVar4 = *(int *)(iVar5 + 0x10), iVar4 != 0)) && (*(int *)(iVar4 + 4) == 9)) {
      *(byte *)(iVar4 + 0x21) = *(byte *)(iVar4 + 0x21) & 0xf3;
    }
    iVar5 = FUN_1007cf9e(param_1,param_2,0,0,iVar5,0,0,param_4,param_5,param_6,param_7);
  }
  return iVar5;
}


