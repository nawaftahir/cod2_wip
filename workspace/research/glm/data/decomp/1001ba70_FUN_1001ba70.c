// 1001ba70 size=569 FUN_1001ba70

int * FUN_1001ba70(int *param_1)

{
  bool bVar1;
  char cVar2;
  int iVar3;
  char *pcVar4;
  int *piVar5;
  int *piVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  ushort uVar10;
  int *piVar11;
  undefined4 uStack_1b8;
  undefined4 local_1b4;
  undefined1 local_1b0 [64];
  int aiStack_170 [92];
  
  FUN_10060c10("materials_dx7/techniques/%s.tech",param_1);
  iVar3 = (*(code *)RI_StatMon_Warning)(local_1b0,&local_1b4);
  if (iVar3 < 0) {
    FUN_1005f360("Couldn\'t open technique \'%s\'\n",local_1b0);
    return (int *)0x0;
  }
  uStack_1b8 = local_1b4;
  FUN_1005f0e0(local_1b0);
  (&PTR_DAT_101a6ac0)[DAT_101aac70 * 0x117] = "^1ERROR: ";
  bVar1 = false;
  (&DAT_101a6ab5)[DAT_101aac70 * 0x45c] = 0;
  uVar10 = 0;
  while( true ) {
    iVar3 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar3] != '\0') {
      uStack_1b8 = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
      (&DAT_101a6ab4)[iVar3] = 0;
      *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
    }
    pcVar4 = (char *)FUN_1005f690(&uStack_1b8);
    if (*pcVar4 == '\0') goto LAB_1001bbe9;
    if (*pcVar4 != '{') break;
    piVar5 = aiStack_170 + (uint)uVar10 * 0x17;
    cVar2 = FUN_10018ee0(piVar5);
    if ((((cVar2 == '\0') || (cVar2 = FUN_1001acb0(), cVar2 == '\0')) ||
        (cVar2 = FUN_1001b360(piVar5), cVar2 == '\0')) ||
       ((cVar2 = FUN_1001b670(&uStack_1b8,piVar5), cVar2 == '\0' ||
        (iVar3 = FUN_1005faf0(&DAT_101950c4,1), iVar3 == 0)))) goto LAB_1001bbe7;
    uVar10 = uVar10 + 1;
    if (3 < uVar10) {
LAB_1001bbe9:
      if (DAT_101aac70 == 0) {
        FUN_10061cd0(0,&DAT_1019b958);
      }
      DAT_101aac70 = DAT_101aac70 + -1;
      (*(code *)RI_FS_ReadFile)(local_1b4);
      if (!bVar1) {
        if (uVar10 != 0) {
          piVar5 = param_1;
          do {
            iVar3 = *piVar5;
            piVar5 = (int *)((int)piVar5 + 1);
          } while ((char)iVar3 != '\0');
          uVar9 = (uint)uVar10 * 0x5c;
          uVar8 = (int)piVar5 + (1 - ((int)param_1 + 1));
          piVar6 = (int *)(*(code *)RI_Hunk_AllocInternal)(uVar9 + 8 + uVar8);
          *piVar6 = (int)(piVar6 + (uint)uVar10 * 0x17 + 2);
          piVar5 = piVar6 + (uint)uVar10 * 0x17 + 2;
          for (uVar7 = uVar8 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
            *piVar5 = *param_1;
            param_1 = param_1 + 1;
            piVar5 = piVar5 + 1;
          }
          for (uVar8 = uVar8 & 3; uVar8 != 0; uVar8 = uVar8 - 1) {
            *(char *)piVar5 = (char)*param_1;
            param_1 = (int *)((int)param_1 + 1);
            piVar5 = (int *)((int)piVar5 + 1);
          }
          *(ushort *)((int)piVar6 + 6) = uVar10;
          piVar5 = aiStack_170;
          piVar11 = piVar6 + 2;
          for (uVar9 = uVar9 >> 2; uVar9 != 0; uVar9 = uVar9 - 1) {
            *piVar11 = *piVar5;
            piVar5 = piVar5 + 1;
            piVar11 = piVar11 + 1;
          }
          for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
            *(char *)piVar11 = (char)*piVar5;
            piVar5 = (int *)((int)piVar5 + 1);
            piVar11 = (int *)((int)piVar11 + 1);
          }
          return piVar6;
        }
        FUN_1005f360("Technique \'%s\' has no passes.  The technique should be left blank in the techniqueset instead.\n"
                     ,param_1);
      }
      return (int *)0x0;
    }
  }
  FUN_1005f360("expected \'{\' but found \'%s\'\n",pcVar4);
LAB_1001bbe7:
  bVar1 = true;
  goto LAB_1001bbe9;
}


