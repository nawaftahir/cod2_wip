// 10050680 size=611 FUN_10050680

void FUN_10050680(int *param_1)

{
  int iVar1;
  int iVar2;
  bool bVar3;
  undefined4 *puVar4;
  int *piVar5;
  int iVar6;
  bool bVar7;
  bool bVar8;
  int local_c;
  int *local_8;
  
  bVar7 = param_1[0x5d] != 0;
  iVar1 = param_1[0x68];
  bVar3 = false;
  if (bVar7) {
    if ((param_1[0x5e] < param_1[0x5d]) || (0x3f < param_1[0x5e])) {
      bVar3 = true;
    }
    bVar8 = param_1[0x4b] == 1;
  }
  else {
    bVar8 = param_1[0x5e] == 0;
  }
  if (!bVar8) {
    bVar3 = true;
  }
  if ((param_1[0x5f] != 0) && (param_1[0x60] != param_1[0x5f] + -1)) {
    bVar3 = true;
  }
  if ((0xd < param_1[0x60]) || (bVar3)) {
    *(undefined4 *)(*param_1 + 0x14) = 0x10;
    *(int *)(*param_1 + 0x18) = param_1[0x5d];
    *(int *)(*param_1 + 0x1c) = param_1[0x5e];
    *(int *)(*param_1 + 0x20) = param_1[0x5f];
    *(int *)(*param_1 + 0x24) = param_1[0x60];
    (**(code **)*param_1)(param_1);
  }
  local_c = 0;
  if (0 < param_1[0x4b]) {
    local_8 = param_1 + 0x4c;
    do {
      iVar2 = *(int *)(*local_8 + 4);
      piVar5 = (int *)(iVar2 * 0x100 + param_1[0x25]);
      if ((bVar7) && (*piVar5 < 0)) {
        *(undefined4 *)(*param_1 + 0x14) = 0x73;
        *(int *)(*param_1 + 0x18) = iVar2;
        *(undefined4 *)(*param_1 + 0x1c) = 0;
        (**(code **)(*param_1 + 4))(param_1,0xffffffff);
      }
      iVar6 = param_1[0x5d];
      if (iVar6 <= param_1[0x5e]) {
        do {
          if (param_1[0x5f] != (piVar5[iVar6] & (piVar5[iVar6] < 0) - 1)) {
            *(undefined4 *)(*param_1 + 0x14) = 0x73;
            *(int *)(*param_1 + 0x18) = iVar2;
            *(int *)(*param_1 + 0x1c) = iVar6;
            (**(code **)(*param_1 + 4))(param_1,0xffffffff);
          }
          piVar5[iVar6] = param_1[0x60];
          iVar6 = iVar6 + 1;
        } while (iVar6 <= param_1[0x5e]);
      }
      local_c = local_c + 1;
      local_8 = local_8 + 1;
    } while (local_c < param_1[0x4b]);
  }
  if (param_1[0x5f] == 0) {
    if (bVar7) {
      *(code **)(iVar1 + 4) = FUN_10050bd0;
    }
    else {
      *(code **)(iVar1 + 4) = FUN_10050980;
    }
  }
  else if (bVar7) {
    *(undefined1 **)(iVar1 + 4) = &LAB_10050f00;
  }
  else {
    *(code **)(iVar1 + 4) = FUN_10050e10;
  }
  local_c = 0;
  if (0 < param_1[0x4b]) {
    puVar4 = (undefined4 *)(iVar1 + 0x18);
    piVar5 = param_1 + 0x4c;
    do {
      if (bVar7) {
        iVar2 = *(int *)(*piVar5 + 0x18);
        FUN_1004c5e0(param_1,0);
        *(undefined4 *)(iVar1 + 0x3c) = *(undefined4 *)(iVar1 + 0x2c + iVar2 * 4);
      }
      else if (param_1[0x5f] == 0) {
        FUN_1004c5e0(param_1,1);
      }
      *puVar4 = 0;
      local_c = local_c + 1;
      piVar5 = piVar5 + 1;
      puVar4 = puVar4 + 1;
    } while (local_c < param_1[0x4b]);
  }
  *(undefined4 *)(iVar1 + 0x10) = 0;
  *(undefined4 *)(iVar1 + 0xc) = 0;
  *(undefined4 *)(iVar1 + 0x14) = 0;
  *(undefined1 *)(iVar1 + 8) = 0;
  *(int *)(iVar1 + 0x28) = param_1[0x41];
  return;
}


