// 1000e900 size=226 FUN_1000e900

void FUN_1000e900(int param_1,undefined4 *param_2,uint param_3,undefined4 *param_4)

{
  int in_EAX;
  int iVar1;
  uint uVar2;
  uint uVar3;
  uint in_EDX;
  int iVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  
  if (in_EAX < 0x34) {
    if (in_EAX == 0x33) {
switchD_1000e922_caseD_17:
      in_EDX = in_EDX * 2;
      goto switchD_1000e922_caseD_1c;
    }
    switch(in_EAX) {
    case 0x15:
    case 0x16:
      in_EDX = in_EDX << 2;
      iVar4 = 1;
      break;
    case 0x17:
      goto switchD_1000e922_caseD_17;
    default:
      goto switchD_1000e922_caseD_18;
    case 0x1c:
    case 0x32:
switchD_1000e922_caseD_1c:
      iVar4 = 1;
    }
  }
  else {
    if (in_EAX == 0x31545844) {
      in_EDX = ((int)(in_EDX + 3) >> 2) << 3;
    }
    else {
      if ((in_EAX != 0x33545844) && (in_EAX != 0x35545844)) {
        return;
      }
      in_EDX = ((int)(in_EDX + 3) >> 2) << 4;
    }
    iVar4 = 4;
  }
  if (param_3 == in_EDX) {
    uVar2 = ((param_1 + -1) / iVar4 + 1) * in_EDX;
    for (uVar3 = uVar2 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
      *param_4 = *param_2;
      param_2 = param_2 + 1;
      param_4 = param_4 + 1;
    }
    for (uVar2 = uVar2 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
      *(undefined1 *)param_4 = *(undefined1 *)param_2;
      param_2 = (undefined4 *)((int)param_2 + 1);
      param_4 = (undefined4 *)((int)param_4 + 1);
    }
    return;
  }
  iVar1 = 0;
  if (0 < param_1) {
    do {
      puVar5 = param_2;
      puVar6 = param_4;
      for (uVar3 = in_EDX >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
        *puVar6 = *puVar5;
        puVar5 = puVar5 + 1;
        puVar6 = puVar6 + 1;
      }
      for (uVar3 = in_EDX & 3; uVar3 != 0; uVar3 = uVar3 - 1) {
        *(undefined1 *)puVar6 = *(undefined1 *)puVar5;
        puVar5 = (undefined4 *)((int)puVar5 + 1);
        puVar6 = (undefined4 *)((int)puVar6 + 1);
      }
      param_4 = (undefined4 *)((int)param_4 + param_3);
      param_2 = (undefined4 *)((int)param_2 + in_EDX);
      iVar1 = iVar1 + iVar4;
    } while (iVar1 < param_1);
  }
switchD_1000e922_caseD_18:
  return;
}


