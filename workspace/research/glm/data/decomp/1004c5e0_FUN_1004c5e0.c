// 1004c5e0 size=694 FUN_1004c5e0

void FUN_1004c5e0(int *param_1,char param_2)

{
  byte bVar1;
  int *in_EAX;
  int iVar2;
  char *pcVar3;
  int iVar4;
  int *piVar5;
  int in_ECX;
  uint uVar6;
  undefined1 *puVar7;
  char cVar8;
  int iVar9;
  int iVar10;
  uint uVar11;
  int iVar12;
  undefined1 *puVar13;
  int iVar14;
  int iVar15;
  undefined4 *puVar16;
  int iStack_520;
  int iStack_514;
  int iStack_510;
  char acStack_508 [256];
  int aiStack_408 [258];
  
  if ((in_ECX < 0) || (3 < in_ECX)) {
    *(undefined4 *)(*param_1 + 0x14) = 0x32;
    *(int *)(*param_1 + 0x18) = in_ECX;
    (**(code **)*param_1)(param_1);
  }
  if (param_2 == '\0') {
    iVar10 = param_1[in_ECX + 0x2e];
  }
  else {
    iVar10 = param_1[in_ECX + 0x2a];
  }
  if (iVar10 == 0) {
    *(undefined4 *)(*param_1 + 0x14) = 0x32;
    *(int *)(*param_1 + 0x18) = in_ECX;
    (**(code **)*param_1)(param_1);
  }
  if (*in_EAX == 0) {
    iVar2 = (**(code **)param_1[1])(param_1,1,0x590);
    *in_EAX = iVar2;
  }
  iVar2 = *in_EAX;
  *(int *)(iVar2 + 0x8c) = iVar10;
  iVar14 = 0;
  iStack_520 = 1;
  do {
    bVar1 = *(byte *)(iStack_520 + iVar10);
    uVar11 = (uint)bVar1;
    if (0x100 < (int)(iVar14 + uVar11)) {
      *(undefined4 *)(*param_1 + 0x14) = 8;
      (**(code **)*param_1)(param_1);
    }
    if (uVar11 != 0) {
      cVar8 = (char)iStack_520;
      pcVar3 = acStack_508 + iVar14;
      for (uVar6 = (uint)(bVar1 >> 2); uVar6 != 0; uVar6 = uVar6 - 1) {
        *(uint *)pcVar3 = CONCAT22(CONCAT11(cVar8,cVar8),CONCAT11(cVar8,cVar8));
        pcVar3 = pcVar3 + 4;
      }
      for (uVar6 = uVar11 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
        *pcVar3 = cVar8;
        pcVar3 = pcVar3 + 1;
      }
      iVar14 = iVar14 + uVar11;
    }
    iStack_520 = iStack_520 + 1;
  } while (iStack_520 < 0x11);
  acStack_508[iVar14] = '\0';
  iVar9 = 0;
  iVar15 = 0;
  iVar12 = (int)acStack_508[0];
  if (acStack_508[0] != '\0') {
    pcVar3 = acStack_508;
    do {
      cVar8 = *pcVar3;
      while (cVar8 == iVar12) {
        cVar8 = acStack_508[iVar15 + 1];
        aiStack_408[iVar15 + 1] = iVar9;
        iVar15 = iVar15 + 1;
        iVar9 = iVar9 + 1;
      }
      if (1 << ((byte)iVar12 & 0x1f) <= iVar9) {
        *(undefined4 *)(*param_1 + 0x14) = 8;
        (**(code **)*param_1)(param_1);
      }
      pcVar3 = acStack_508 + iVar15;
      iVar9 = iVar9 << 1;
      iVar12 = iVar12 + 1;
    } while (acStack_508[iVar15] != '\0');
  }
  iVar9 = 1;
  iVar15 = 0;
  do {
    if (*(char *)(iVar9 + iVar10) == '\0') {
      *(undefined4 *)(iVar2 + iVar9 * 4) = 0xffffffff;
    }
    else {
      *(int *)(iVar2 + 0x48 + iVar9 * 4) = iVar15 - aiStack_408[iVar15 + 1];
      iVar15 = iVar15 + (uint)*(byte *)(iVar9 + iVar10);
      *(int *)(iVar2 + iVar9 * 4) = aiStack_408[iVar15];
    }
    iVar9 = iVar9 + 1;
  } while (iVar9 < 0x11);
  *(undefined4 *)(iVar2 + 0x44) = 0xfffff;
  puVar16 = (undefined4 *)(iVar2 + 0x90);
  for (iVar9 = 0x100; iVar9 != 0; iVar9 = iVar9 + -1) {
    *puVar16 = 0;
    puVar16 = puVar16 + 1;
  }
  iVar9 = 0;
  iStack_510 = 0;
  iVar15 = 1;
  iStack_520 = 7;
  do {
    iStack_514 = 1;
    if (*(char *)(iVar15 + iVar10) != '\0') {
      iVar12 = 1 << ((byte)iStack_520 & 0x1f);
      puVar13 = (undefined1 *)(iVar9 + 0x11 + iVar10);
      do {
        iVar4 = aiStack_408[iVar9 + 1] << ((byte)iStack_520 & 0x1f);
        if (0 < iVar12) {
          puVar7 = (undefined1 *)(iVar4 + 0x490 + iVar2);
          piVar5 = (int *)(iVar2 + 0x90 + iVar4 * 4);
          iVar4 = iVar12;
          do {
            *piVar5 = iVar15;
            piVar5 = piVar5 + 1;
            *puVar7 = *puVar13;
            puVar7 = puVar7 + 1;
            iVar4 = iVar4 + -1;
            iVar9 = iStack_510;
          } while (iVar4 != 0);
        }
        iStack_514 = iStack_514 + 1;
        iVar9 = iVar9 + 1;
        puVar13 = puVar13 + 1;
        iStack_510 = iVar9;
      } while (iStack_514 <= (int)(uint)*(byte *)(iVar15 + iVar10));
    }
    iVar15 = iVar15 + 1;
    iStack_520 = iStack_520 + -1;
  } while (-1 < iStack_520);
  if ((param_2 != '\0') && (iVar2 = 0, 0 < iVar14)) {
    do {
      if (0xf < *(byte *)(iVar10 + 0x11 + iVar2)) {
        *(undefined4 *)(*param_1 + 0x14) = 8;
        (**(code **)*param_1)(param_1);
      }
      iVar2 = iVar2 + 1;
    } while (iVar2 < iVar14);
  }
  return;
}


