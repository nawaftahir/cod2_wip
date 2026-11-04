// 1001c010 size=543 FUN_1001c010

int * FUN_1001c010(void)

{
  char cVar1;
  bool bVar2;
  char *in_EAX;
  char *pcVar3;
  int iVar4;
  int *piVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  char *pcVar9;
  int *piVar10;
  undefined1 *puVar11;
  undefined4 uStack_d0;
  undefined4 local_cc;
  undefined1 local_c8 [64];
  int aiStack_88 [34];
  
  pcVar3 = "materials_dx7/techniquesets/%s.techset";
  if (*(int *)(DAT_101ce708 + 8) != 2) {
    pcVar3 = "materials/techniquesets/%s.techset";
  }
  FUN_10060c10(pcVar3);
  iVar4 = (*(code *)RI_StatMon_Warning)(local_c8,&local_cc);
  if (iVar4 < 0) {
    FUN_10061c80("^1ERROR: Couldn\'t open techniqueSet \'%s\'\n",local_c8);
    return (int *)0x0;
  }
  pcVar3 = in_EAX;
  do {
    cVar1 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  piVar5 = (int *)(*(code *)RI_Hunk_AllocInternal)(pcVar3 + (0x8d - (int)(in_EAX + 1)));
  *piVar5 = (int)(piVar5 + 0x23);
  pcVar9 = in_EAX;
  piVar10 = piVar5 + 0x23;
  for (uVar7 = (uint)(pcVar3 + (1 - (int)(in_EAX + 1))) >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
    *piVar10 = *(undefined4 *)pcVar9;
    pcVar9 = pcVar9 + 4;
    piVar10 = (int *)((int)piVar10 + 4);
  }
  for (uVar7 = (uint)(pcVar3 + (1 - (int)(in_EAX + 1))) & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
    *(char *)piVar10 = *pcVar9;
    pcVar9 = pcVar9 + 1;
    piVar10 = (int *)((int)piVar10 + 1);
  }
  uStack_d0 = local_cc;
  FUN_1005f0e0(local_c8);
  (&PTR_DAT_101a6ac0)[DAT_101aac70 * 0x117] = "^1ERROR: ";
  (&DAT_101a6ab5)[DAT_101aac70 * 0x45c] = 0;
  iVar4 = 0;
  (&DAT_101a6ab6)[DAT_101aac70 * 0x45c] = 1;
  bVar2 = false;
  do {
    iVar6 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar6] != '\0') {
      uStack_d0 = *(undefined4 *)(&DAT_101a6ac8 + iVar6);
      (&DAT_101a6ab4)[iVar6] = 0;
      *(undefined4 *)(&DAT_101a6ab0 + iVar6) = *(undefined4 *)(&DAT_101a6ac4 + iVar6);
    }
    pcVar3 = (char *)FUN_1005f690(&uStack_d0);
    if (*pcVar3 == '\0') goto LAB_1001c1fc;
    if (*pcVar3 == '\"') {
      if (iVar4 == 0x22) {
        FUN_1005f360("Too many labels in technique set\n");
        break;
      }
      iVar6 = FUN_1001be50(pcVar3);
      aiStack_88[iVar4] = iVar6;
      if (iVar6 == 0x22) goto LAB_1001c1ec;
      if ((&DAT_1018eb34)[iVar6] != '\0') {
        bVar2 = true;
      }
      iVar4 = iVar4 + 1;
      puVar11 = &DAT_10195880;
    }
    else {
      if (iVar4 == 0) {
LAB_1001c1ec:
        FUN_1005f360("Unknown technique type \'%s\'\n",pcVar3);
        break;
      }
      if (bVar2) {
        iVar6 = FUN_1001bde0();
        if (iVar6 == 0) break;
        iVar8 = 0;
        if (0 < iVar4) {
          do {
            piVar10 = aiStack_88 + iVar8;
            iVar8 = iVar8 + 1;
            piVar5[*piVar10 + 1] = iVar6;
          } while (iVar8 < iVar4);
        }
      }
      iVar4 = 0;
      bVar2 = false;
      puVar11 = &DAT_10195820;
    }
    iVar6 = FUN_1005faf0(puVar11,1);
  } while (iVar6 != 0);
  piVar5 = (int *)0x0;
LAB_1001c1fc:
  if (DAT_101aac70 == 0) {
    FUN_10061cd0(0,&DAT_1019b958);
  }
  DAT_101aac70 = DAT_101aac70 + -1;
  (*(code *)RI_FS_ReadFile)(local_cc);
  return piVar5;
}


