// 100a1bf8 size=1048 FUN_100a1bf8

int FUN_100a1bf8(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  undefined *puVar7;
  int in_ECX;
  bool bVar8;
  char *pcVar9;
  undefined4 uVar10;
  int local_30;
  int local_2c;
  int local_28;
  int *local_24;
  int *local_20;
  int local_1c;
  undefined4 local_18;
  int local_14;
  int local_10;
  int local_c;
  int local_8;
  
  local_14 = 0;
  local_1c = 0;
  local_18 = 0;
  local_2c = 0;
  local_30 = 0;
  if ((param_1 == 0) || (*(int *)(param_1 + 4) != 3)) {
    return 0;
  }
  iVar6 = param_1 + 0x10;
  if (*(int *)(in_ECX + 0x18) == 0) {
    uVar3 = 0;
  }
  else {
    uVar3 = *(undefined4 *)(*(int *)(in_ECX + 0x18) + 0x1c);
  }
  uVar5 = 6;
  if (param_3 != 0) {
    uVar5 = 0x16;
  }
  local_c = iVar6;
  local_8 = in_ECX;
  iVar4 = FUN_1009e0fb(2,iVar6,uVar3,param_2,*(undefined4 *)(in_ECX + 0x10),uVar5,&local_14,
                       &local_18);
  bVar8 = iVar4 == 0;
  if (iVar4 < 0) {
    return 0;
  }
  if (param_3 == 0) {
    if (bVar8) goto LAB_100a1d20;
    iVar4 = FUN_1009acc9(iVar6,param_2,&local_1c,&local_18);
    if (iVar4 < 0) {
      return 0;
    }
    if (iVar4 == 0) {
      bVar8 = true;
      goto LAB_100a1ca1;
    }
LAB_100a1ca5:
    iVar4 = FUN_1009e0fb(2,iVar6,0,0,*(undefined4 *)(local_8 + 0x10),2,&local_14,&local_18);
    if (iVar4 < 0) {
      return 0;
    }
    if (iVar4 == 0) {
      bVar8 = true;
    }
  }
  else {
LAB_100a1ca1:
    if (!bVar8) goto LAB_100a1ca5;
  }
  if (param_3 == 0) {
    if (!bVar8) {
      iVar4 = FUN_1009acc9(iVar6,0,&local_1c,&local_18);
      if (iVar4 < 0) {
        return 0;
      }
      if (iVar4 != 0) goto LAB_100a1cf8;
      bVar8 = true;
      goto LAB_100a1cf4;
    }
  }
  else {
LAB_100a1cf4:
    if (!bVar8) {
LAB_100a1cf8:
      FUN_100994dd(local_8,iVar6,0xbbc,"undeclared identifier \'%s\'",
                   *(undefined4 *)(param_1 + 0x18));
      return 0;
    }
  }
  if (local_1c != 0) {
    local_14 = local_1c;
  }
LAB_100a1d20:
  local_20 = &local_2c;
  local_24 = &local_30;
  iVar4 = param_2;
  for (local_10 = *(int *)(local_14 + 0x24); local_10 != 0; local_10 = *(int *)(local_10 + 0xc)) {
    iVar1 = *(int *)(local_10 + 8);
    iVar2 = *(int *)(local_10 + 0xc);
    bVar8 = false;
    if ((iVar2 != 0) && (iVar6 = local_c, *(int *)(*(int *)(iVar2 + 8) + 4) == 0xc)) {
      bVar8 = true;
      local_10 = iVar2;
    }
    if ((param_3 == 0) || ((*(byte *)(*(int *)(iVar1 + 0x18) + 0x1c) & 0x40) != 0)) {
      if (iVar4 == 0) {
        if (!bVar8) goto LAB_100a1ed4;
      }
      else {
        local_28 = *(int *)(iVar1 + 0x18);
        uVar3 = *(undefined4 *)(local_28 + 0x20);
        if (*(int *)(iVar4 + 8) == 0) {
          param_1 = 0;
        }
        else {
          param_1 = *(undefined4 *)(*(int *)(iVar4 + 8) + 0x10);
        }
        iVar6 = FUN_1006506e(0x14);
        if (iVar6 == 0) {
          iVar6 = 0;
        }
        else {
          iVar6 = FUN_10082872(0,0,"Inputs");
        }
        *local_20 = iVar6;
        if (iVar6 == 0) {
          return 0;
        }
        iVar6 = FUN_1006506e(0x14);
        if (iVar6 == 0) {
          iVar6 = 0;
        }
        else {
          iVar6 = FUN_10082872(0,0,"Outputs");
        }
        *local_24 = iVar6;
        if (iVar6 == 0) {
          return 0;
        }
        if ((*(byte *)(local_28 + 0x1c) & 0x10) != 0) {
          iVar6 = FUN_1009b666(uVar3,param_1,0);
          uVar5 = uVar3;
          uVar10 = param_1;
          if (iVar6 == 0) goto LAB_100a1f09;
          uVar5 = FUN_1009e8bf(uVar3,*(undefined4 *)(iVar4 + 8),0,0);
          *(undefined4 *)(*local_20 + 8) = uVar5;
        }
        if ((*(byte *)(local_28 + 0x1c) & 0x20) != 0) {
          iVar6 = FUN_10099a41(param_1);
          uVar5 = param_1;
          uVar10 = uVar3;
          if ((iVar6 != 0) || (iVar6 = FUN_1009b666(param_1,uVar3,0), iVar6 == 0)) {
LAB_100a1f09:
            FUN_1009b99e(local_c,*(undefined4 *)(local_c + 8),uVar5,uVar10,0);
            return 0;
          }
          iVar6 = FUN_1009e7b8(*(undefined4 *)(iVar1 + 0x14),local_28);
          if (iVar6 == 0) {
            return 0;
          }
          iVar6 = FUN_1009e8bf(param_1,iVar6,0,0);
          if (iVar6 == 0) {
            return 0;
          }
          iVar6 = FUN_100a0e06(0x15,*(undefined4 *)(iVar4 + 8),iVar6,1);
          if (iVar6 == 0) {
            return 0;
          }
          *(int *)(*local_24 + 8) = iVar6;
        }
        iVar4 = *(int *)(iVar4 + 0xc);
        local_20 = (int *)(*local_20 + 0xc);
        local_24 = (int *)(*local_24 + 0xc);
        iVar6 = local_c;
      }
    }
  }
  if (iVar4 == 0) {
LAB_100a1ed4:
    if (local_10 == 0) {
      iVar4 = FUN_1006506e(0x50);
      if (iVar4 == 0) {
        iVar6 = 0;
      }
      else {
        iVar6 = FUN_10083255(0,(local_1c != 0) + '\x19',0,0,1,iVar6);
      }
      if (iVar6 == 0) {
        return 0;
      }
      if (*(int *)(local_14 + 0x20) != 0) {
        iVar4 = (**(code **)(**(int **)(local_14 + 0x20) + 4))();
        *(int *)(iVar6 + 0x10) = iVar4;
        if (iVar4 == 0) {
          return 0;
        }
      }
      *(undefined4 *)(iVar6 + 0x20) = local_18;
      iVar4 = FUN_1006506e(0x14);
      if (iVar4 == 0) {
        iVar4 = 0;
      }
      else {
        iVar4 = FUN_10082872(0,0,"Parameters");
      }
      *(int *)(iVar6 + 0x24) = iVar4;
      if (iVar4 == 0) {
        return 0;
      }
      *(int *)(iVar4 + 8) = local_2c;
      *(int *)(*(int *)(iVar6 + 0x24) + 0xc) = local_30;
      FUN_1009a568(iVar6);
      iVar4 = FUN_1009a44a(iVar6);
      if (iVar4 == 0) {
        return iVar6;
      }
      iVar4 = FUN_100a06b8(iVar6);
      if (iVar4 != 0) {
        return iVar4;
      }
      return iVar6;
    }
  }
  iVar4 = 0;
  for (; param_2 != 0; param_2 = *(int *)(param_2 + 0xc)) {
    iVar4 = iVar4 + 1;
  }
  puVar7 = &DAT_1010e8dc;
  if (local_1c == 0) {
    if (iVar4 == 1) {
      puVar7 = &DAT_1019166e;
    }
    uVar3 = *(undefined4 *)(iVar6 + 8);
    pcVar9 = "\'%s\': function does not take %u parameter%s";
  }
  else {
    if (iVar4 == 1) {
      puVar7 = &DAT_1019166e;
    }
    uVar3 = *(undefined4 *)(iVar6 + 8);
    pcVar9 = "\'%s\': intrinsic function does not take %u parameter%s";
  }
  FUN_100994dd(local_8,iVar6,0xbc5,pcVar9,uVar3,iVar4,puVar7);
  return 0;
}


