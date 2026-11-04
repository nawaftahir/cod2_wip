// 10043de0 size=511 FUN_10043de0

void FUN_10043de0(int *param_1,char param_2)

{
  undefined4 *puVar1;
  byte bVar2;
  int *in_EAX;
  int iVar3;
  char *pcVar4;
  int in_ECX;
  uint uVar5;
  char cVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  int iVar11;
  undefined4 *puVar12;
  int iStack_514;
  int local_510;
  char acStack_508 [260];
  int aiStack_404 [257];
  
  if ((in_ECX < 0) || (3 < in_ECX)) {
    *(undefined4 *)(*param_1 + 0x14) = 0x32;
    *(int *)(*param_1 + 0x18) = in_ECX;
    (**(code **)*param_1)(param_1);
  }
  if (param_2 == '\0') {
    local_510 = param_1[in_ECX + 0x1c];
  }
  else {
    local_510 = param_1[in_ECX + 0x18];
  }
  if (local_510 == 0) {
    *(undefined4 *)(*param_1 + 0x14) = 0x32;
    *(int *)(*param_1 + 0x18) = in_ECX;
    (**(code **)*param_1)(param_1);
  }
  if (*in_EAX == 0) {
    iVar3 = (**(code **)param_1[1])(param_1,1,0x500);
    *in_EAX = iVar3;
  }
  iVar3 = *in_EAX;
  iVar7 = 0;
  iStack_514 = 1;
  do {
    bVar2 = *(byte *)(iStack_514 + local_510);
    uVar9 = (uint)bVar2;
    if (0x100 < (int)(uVar9 + iVar7)) {
      *(undefined4 *)(*param_1 + 0x14) = 8;
      (**(code **)*param_1)(param_1);
    }
    if (uVar9 != 0) {
      cVar6 = (char)iStack_514;
      pcVar4 = acStack_508 + iVar7;
      for (uVar5 = (uint)(bVar2 >> 2); uVar5 != 0; uVar5 = uVar5 - 1) {
        *(uint *)pcVar4 = CONCAT22(CONCAT11(cVar6,cVar6),CONCAT11(cVar6,cVar6));
        pcVar4 = pcVar4 + 4;
      }
      for (uVar5 = uVar9 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
        *pcVar4 = cVar6;
        pcVar4 = pcVar4 + 1;
      }
      iVar7 = iVar7 + uVar9;
    }
    iStack_514 = iStack_514 + 1;
  } while (iStack_514 < 0x11);
  acStack_508[iVar7] = '\0';
  iVar11 = 0;
  iVar10 = 0;
  iVar8 = (int)acStack_508[0];
  if (acStack_508[0] != '\0') {
    pcVar4 = acStack_508;
    do {
      cVar6 = *pcVar4;
      while (cVar6 == iVar8) {
        cVar6 = acStack_508[iVar10 + 1];
        aiStack_404[iVar10] = iVar11;
        iVar10 = iVar10 + 1;
        iVar11 = iVar11 + 1;
      }
      if (1 << ((byte)iVar8 & 0x1f) <= iVar11) {
        *(undefined4 *)(*param_1 + 0x14) = 8;
        (**(code **)*param_1)(param_1);
      }
      pcVar4 = acStack_508 + iVar10;
      iVar11 = iVar11 << 1;
      iVar8 = iVar8 + 1;
    } while (acStack_508[iVar10] != '\0');
  }
  puVar1 = (undefined4 *)(iVar3 + 0x400);
  puVar12 = puVar1;
  for (iVar10 = 0x40; iVar10 != 0; iVar10 = iVar10 + -1) {
    *puVar12 = 0;
    puVar12 = puVar12 + 1;
  }
  iVar10 = 0;
  if (0 < iVar7) {
    do {
      uVar9 = (uint)*(byte *)(local_510 + 0x11 + iVar10);
      if (((int)((-(uint)(param_2 != '\0') & 0xffffff10) + 0xff) < (int)uVar9) ||
         (*(char *)(uVar9 + (int)puVar1) != '\0')) {
        *(undefined4 *)(*param_1 + 0x14) = 8;
        (**(code **)*param_1)(param_1);
      }
      cVar6 = acStack_508[iVar10];
      *(int *)(iVar3 + uVar9 * 4) = aiStack_404[iVar10];
      iVar10 = iVar10 + 1;
      *(char *)(uVar9 + (int)puVar1) = cVar6;
    } while (iVar10 < iVar7);
  }
  return;
}


