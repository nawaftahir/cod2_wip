// 1001b810 size=588 FUN_1001b810

int * FUN_1001b810(int *param_1)

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
  undefined4 uStack_bc;
  undefined4 uStack_b8;
  undefined4 local_b4;
  undefined1 local_b0 [64];
  int aiStack_70 [28];
  
  FUN_10060c10("materials/techniques/%s.tech",param_1);
  iVar3 = (*(code *)RI_StatMon_Warning)(local_b0,&local_b4);
  if (iVar3 < 0) {
    FUN_1005f360("Couldn\'t open technique \'%s\'\n",local_b0);
    return (int *)0x0;
  }
  uStack_bc = local_b4;
  FUN_1005f0e0(local_b0);
  (&PTR_DAT_101a6ac0)[DAT_101aac70 * 0x117] = "^1ERROR: ";
  bVar1 = false;
  uVar10 = 0;
  (&DAT_101a6ab5)[DAT_101aac70 * 0x45c] = 0;
  uStack_b8 = 0;
  while( true ) {
    iVar3 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar3] != '\0') {
      uStack_bc = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
      (&DAT_101a6ab4)[iVar3] = 0;
      *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
    }
    pcVar4 = (char *)FUN_1005f690(&uStack_bc);
    if (*pcVar4 == '\0') goto LAB_1001b98f;
    if (*pcVar4 != '{') break;
    cVar2 = FUN_10018ee0(aiStack_70 + (uint)uVar10 * 7);
    if ((((cVar2 == '\0') ||
         (cVar2 = FUN_100191a0(&uStack_bc,aiStack_70 + (uint)uVar10 * 7), cVar2 == '\0')) ||
        (cVar2 = FUN_1001aa00(&uStack_b8), cVar2 == '\0')) ||
       ((cVar2 = FUN_1001aa50(&uStack_b8), cVar2 == '\0' ||
        (iVar3 = FUN_1005faf0(&DAT_101950c4,1), iVar3 == 0)))) goto LAB_1001b98d;
    uVar10 = uVar10 + 1;
    if (3 < uVar10) {
LAB_1001b98f:
      if (DAT_101aac70 == 0) {
        FUN_10061cd0(0,&DAT_1019b958);
      }
      DAT_101aac70 = DAT_101aac70 + -1;
      (*(code *)RI_FS_ReadFile)(local_b4);
      if (!bVar1) {
        if (uVar10 != 0) {
          piVar5 = param_1;
          do {
            iVar3 = *piVar5;
            piVar5 = (int *)((int)piVar5 + 1);
          } while ((char)iVar3 != '\0');
          uVar9 = (uint)uVar10 * 0x1c;
          uVar8 = (int)piVar5 + (1 - ((int)param_1 + 1));
          piVar6 = (int *)(*(code *)RI_Hunk_AllocInternal)(uVar9 + 8 + uVar8);
          *piVar6 = (int)(piVar6 + (uint)uVar10 * 7 + 2);
          piVar5 = piVar6 + (uint)uVar10 * 7 + 2;
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
          *(undefined2 *)(piVar6 + 1) = (undefined2)uStack_b8;
          *(ushort *)((int)piVar6 + 6) = uVar10;
          piVar5 = aiStack_70;
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
LAB_1001b98d:
  bVar1 = true;
  goto LAB_1001b98f;
}


