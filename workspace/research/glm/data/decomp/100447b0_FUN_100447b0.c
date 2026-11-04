// 100447b0 size=596 FUN_100447b0

void FUN_100447b0(int *param_1,undefined4 *param_2)

{
  char *pcVar1;
  char cVar2;
  int iVar3;
  int in_EAX;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int *piVar8;
  undefined4 local_83c;
  undefined4 local_838;
  undefined4 local_834;
  undefined4 local_830;
  undefined4 local_82c;
  undefined4 local_828;
  undefined4 local_824;
  undefined4 local_820;
  undefined1 local_81c;
  int local_818 [258];
  int local_410 [259];
  
  local_83c = 0;
  local_838 = 0;
  local_834 = 0;
  local_830 = 0;
  local_82c = 0;
  local_828 = 0;
  local_824 = 0;
  local_820 = 0;
  piVar8 = local_818;
  for (iVar4 = 0x101; iVar4 != 0; iVar4 = iVar4 + -1) {
    *piVar8 = 0;
    piVar8 = piVar8 + 1;
  }
  local_81c = 0;
  piVar8 = local_410;
  for (iVar4 = 0x101; iVar4 != 0; iVar4 = iVar4 + -1) {
    *piVar8 = -1;
    piVar8 = piVar8 + 1;
  }
  *(undefined4 *)(in_EAX + 0x400) = 1;
  while( true ) {
    iVar4 = -1;
    iVar7 = 1000000000;
    iVar5 = 0;
    do {
      iVar6 = *(int *)(in_EAX + iVar5 * 4);
      if ((iVar6 != 0) && (iVar6 <= iVar7)) {
        iVar4 = iVar5;
        iVar7 = iVar6;
      }
      iVar5 = iVar5 + 1;
    } while (iVar5 < 0x101);
    iVar7 = -1;
    iVar5 = 1000000000;
    iVar6 = 0;
    do {
      iVar3 = *(int *)(in_EAX + iVar6 * 4);
      if (((iVar3 != 0) && (iVar3 <= iVar5)) && (iVar6 != iVar4)) {
        iVar7 = iVar6;
        iVar5 = iVar3;
      }
      iVar6 = iVar6 + 1;
    } while (iVar6 < 0x101);
    if (iVar7 < 0) break;
    iVar5 = local_818[iVar4];
    *(int *)(in_EAX + iVar4 * 4) = *(int *)(in_EAX + iVar4 * 4) + *(int *)(in_EAX + iVar7 * 4);
    iVar6 = local_410[iVar4];
    piVar8 = local_410 + iVar4;
    *(undefined4 *)(in_EAX + iVar7 * 4) = 0;
    local_818[iVar4] = iVar5 + 1;
    while (-1 < iVar6) {
      iVar4 = *piVar8;
      iVar6 = local_410[iVar4];
      piVar8 = local_410 + iVar4;
      local_818[iVar4] = local_818[iVar4] + 1;
    }
    iVar5 = local_818[iVar7];
    local_410[iVar4] = iVar7;
    iVar4 = local_410[iVar7];
    piVar8 = local_410 + iVar7;
    local_818[iVar7] = iVar5 + 1;
    while (-1 < iVar4) {
      iVar7 = *piVar8;
      iVar4 = local_410[iVar7];
      local_818[iVar7] = local_818[iVar7] + 1;
      piVar8 = local_410 + iVar7;
    }
  }
  iVar4 = 0;
  do {
    iVar7 = local_818[iVar4];
    if (iVar7 != 0) {
      if (0x20 < iVar7) {
        *(undefined4 *)(*param_1 + 0x14) = 0x27;
        (**(code **)*param_1)(param_1);
      }
      *(char *)((int)&local_83c + iVar7) = *(char *)((int)&local_83c + iVar7) + '\x01';
    }
    iVar4 = iVar4 + 1;
  } while (iVar4 < 0x101);
  iVar5 = 0x10;
  iVar7 = 0x1e;
  iVar4 = 0x10;
  do {
    cVar2 = *(char *)((int)&local_83c + iVar7 + 2);
    while (cVar2 != '\0') {
      cVar2 = *(char *)((int)&local_83c + iVar7);
      iVar6 = iVar7;
      while (cVar2 == '\0') {
        pcVar1 = &stack0xfffff7c3 + iVar6;
        iVar6 = iVar6 + -1;
        cVar2 = *pcVar1;
      }
      pcVar1 = (char *)((int)&local_83c + iVar7 + 2);
      *pcVar1 = *pcVar1 + -2;
      pcVar1 = (char *)((int)&local_83c + iVar7 + 1);
      *pcVar1 = *pcVar1 + '\x01';
      pcVar1 = (char *)((int)&local_83c + iVar6 + 1);
      *pcVar1 = *pcVar1 + '\x02';
      *(char *)((int)&local_83c + iVar6) = *(char *)((int)&local_83c + iVar6) + -1;
      cVar2 = *(char *)((int)&local_83c + iVar7 + 2);
    }
    iVar7 = iVar7 + -1;
    iVar5 = iVar5 + -1;
    cVar2 = (char)local_82c;
  } while (iVar5 != 0);
  while (cVar2 == '\0') {
    pcVar1 = &stack0xfffff7c3 + iVar4;
    iVar4 = iVar4 + -1;
    cVar2 = *pcVar1;
  }
  *(char *)((int)&local_83c + iVar4) = *(char *)((int)&local_83c + iVar4) + -1;
  *param_2 = local_83c;
  param_2[1] = local_838;
  param_2[2] = local_834;
  param_2[3] = local_830;
  *(char *)(param_2 + 4) = (char)local_82c;
  iVar4 = 0;
  iVar7 = 1;
  do {
    iVar5 = 0;
    do {
      if (local_818[iVar5] == iVar7) {
        *(char *)(iVar4 + 0x11 + (int)param_2) = (char)iVar5;
        iVar4 = iVar4 + 1;
      }
      iVar5 = iVar5 + 1;
    } while (iVar5 < 0x100);
    iVar7 = iVar7 + 1;
  } while (iVar7 < 0x21);
  *(undefined1 *)((int)param_2 + 0x111) = 0;
  return;
}


