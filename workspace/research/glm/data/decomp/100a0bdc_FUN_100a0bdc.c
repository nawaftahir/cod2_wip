// 100a0bdc size=554 FUN_100a0bdc

int FUN_100a0bdc(int *param_1,uint param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined4 in_ECX;
  uint uVar5;
  undefined4 uVar6;
  char *pcVar7;
  
  if (param_1 == (int *)0x0) {
    return 0;
  }
  if (param_1[1] != 0xd) {
    return 0;
  }
  if (param_2 == 0) {
    return 0;
  }
  if (*(int *)(param_2 + 4) != 0xd) {
    return 0;
  }
  iVar4 = param_2 + 0x30;
  iVar1 = FUN_1006506e(0x50);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10083255(0,0x16,0,0,1,iVar4);
  }
  if (iVar1 == 0) {
    return 0;
  }
  iVar3 = param_1[4];
  uVar6 = *(undefined4 *)(param_2 + 0x10);
  if (iVar3 == 0) {
LAB_100a0de5:
    pcVar7 = "array expected";
    uVar6 = 0xbcd;
  }
  else {
    if (*(int *)(iVar3 + 4) == 8) {
      if (*(int *)(iVar3 + 0x10) != 0) {
        iVar2 = (**(code **)(**(int **)(iVar3 + 0x10) + 4))();
        *(int *)(iVar1 + 0x10) = iVar2;
        if (iVar2 == 0) {
          return 0;
        }
      }
      uVar5 = *(uint *)(iVar3 + 0x14);
    }
    else {
      if (*(int *)(iVar3 + 4) != 9) goto LAB_100a0de5;
      if (*(int *)(iVar3 + 0x10) == 1) {
        iVar2 = FUN_1006506e(0x24);
        if (iVar2 == 0) {
          iVar2 = 0;
        }
        else {
          iVar2 = FUN_10082e36(0,*(undefined4 *)(iVar3 + 0x14),1,1,*(uint *)(iVar3 + 0x20) & 0x200);
        }
        *(int *)(iVar1 + 0x10) = iVar2;
        if (iVar2 == 0) {
          return 0;
        }
        uVar5 = *(uint *)(iVar3 + 0x1c);
      }
      else {
        if (*(int *)(iVar3 + 0x10) != 2) goto LAB_100a0de5;
        iVar2 = FUN_1006506e(0x24);
        if (iVar2 == 0) {
          iVar2 = 0;
        }
        else {
          iVar2 = FUN_10082e36(1,*(undefined4 *)(iVar3 + 0x14),1,*(undefined4 *)(iVar3 + 0x1c),
                               *(uint *)(iVar3 + 0x20) & 0x200);
        }
        *(int *)(iVar1 + 0x10) = iVar2;
        if (iVar2 == 0) {
          return 0;
        }
        uVar5 = *(uint *)(iVar3 + 0x18);
      }
    }
    iVar3 = FUN_10099ab4(uVar6);
    if (iVar3 != 0) {
      iVar3 = (**(code **)(*param_1 + 4))();
      *(int *)(iVar1 + 0x20) = iVar3;
      if (iVar3 == 0) {
        return 0;
      }
      iVar3 = FUN_1009a44a(param_2);
      if (iVar3 == 0) {
        iVar4 = FUN_10082816(param_2);
        *(int *)(iVar1 + 0x24) = iVar4;
        if (iVar4 == 0) {
          return 0;
        }
      }
      else {
        iVar3 = FUN_100a07e3(param_2,&param_2);
        if (iVar3 < 0) {
          return 0;
        }
        if (uVar5 <= param_2) {
          FUN_100994dd(in_ECX,iVar4,0xbd6,"array index out of bounds");
          param_2 = 0;
        }
        iVar3 = FUN_10099b4f(*(undefined4 *)(iVar1 + 0x10));
        iVar2 = FUN_1006506e(0x40);
        if (iVar2 == 0) {
          iVar4 = 0;
        }
        else {
          iVar4 = FUN_100833a3(2,iVar3 * param_2,iVar4);
        }
        *(int *)(iVar1 + 0x24) = iVar4;
        if (iVar4 == 0) {
          return 0;
        }
        *(undefined4 *)(iVar1 + 0x1c) = 0x17;
      }
      FUN_1009a568(iVar1);
      return iVar1;
    }
    pcVar7 = "scalar expected";
    uVar6 = 0xbeb;
  }
  FUN_100994dd(in_ECX,iVar4,uVar6,pcVar7);
  return 0;
}


