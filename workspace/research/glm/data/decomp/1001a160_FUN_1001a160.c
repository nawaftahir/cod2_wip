// 1001a160 size=856 FUN_1001a160

uint FUN_1001a160(undefined4 *param_1,undefined4 param_2,byte *param_3,int param_4)

{
  char cVar1;
  int *piVar2;
  int iVar3;
  char *pcVar4;
  uint uVar5;
  uint uVar6;
  int unaff_EBX;
  int *piVar7;
  uint local_11c;
  int *local_114;
  char local_100 [256];
  
  uVar6 = *(uint *)(unaff_EBX + 0xc);
  piVar2 = (int *)(*(int *)(unaff_EBX + 0x10) + unaff_EBX);
  pcVar4 = local_100;
  for (uVar5 = uVar6 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
    pcVar4[0] = '\0';
    pcVar4[1] = '\0';
    pcVar4[2] = '\0';
    pcVar4[3] = '\0';
    pcVar4 = pcVar4 + 4;
  }
  for (uVar6 = uVar6 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
    *pcVar4 = '\0';
    pcVar4 = pcVar4 + 1;
  }
  local_11c = 0;
  iVar3 = FUN_1005faf0(&DAT_10195818,1);
  if (iVar3 == 0) {
    return 0;
  }
  local_114 = (int *)(param_4 + 4);
  do {
    while( true ) {
      iVar3 = DAT_101aac70 * 0x45c;
      if ((&DAT_101a6ab4)[iVar3] != '\0') {
        (&DAT_101a6ab4)[iVar3] = 0;
        *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
        *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
      }
      pcVar4 = (char *)FUN_1005f690(param_1);
      if (*pcVar4 == '\0') {
        uVar6 = FUN_1005f360("unexpected end-of-file\n");
        return uVar6 & 0xffffff00;
      }
      if (*pcVar4 == '}') {
        uVar6 = *(uint *)(unaff_EBX + 0xc);
        if (local_11c != uVar6) {
          uVar5 = 0;
          if (uVar6 != 0) {
            param_4 = param_4 + local_11c * 8;
            piVar7 = piVar2;
            do {
              if (local_100[uVar5] == '\0') {
                *(undefined2 *)(param_4 + 2) = *(undefined2 *)((int)piVar7 + 6);
                cVar1 = FUN_1001a0e0();
                if (cVar1 != '\0') {
                  local_11c = local_11c + 1;
                  local_100[uVar5] = '\x01';
                  param_4 = param_4 + 8;
                }
              }
              uVar6 = *(uint *)(unaff_EBX + 0xc);
              uVar5 = uVar5 + 1;
              piVar7 = piVar7 + 5;
            } while (uVar5 < uVar6);
          }
          if (local_11c != *(uint *)(unaff_EBX + 0xc)) {
            FUN_1005f360("Undefined shader constant(s) in %s\n",param_2);
            uVar6 = 0;
            if (*(int *)(unaff_EBX + 0xc) != 0) {
              do {
                if (local_100[uVar6] == '\0') {
                  FUN_10061c80("  %s\n",*piVar2 + unaff_EBX);
                }
                uVar6 = uVar6 + 1;
                piVar2 = piVar2 + 5;
              } while (uVar6 < *(uint *)(unaff_EBX + 0xc));
            }
            uVar6 = FUN_10061c80("%i constant(s) were undefined\n",
                                 *(int *)(unaff_EBX + 0xc) - local_11c);
            return uVar6 & 0xffffff00;
          }
        }
        return CONCAT31((int3)(uVar6 >> 8),1);
      }
      iVar3 = FUN_10019400(param_2);
      if (iVar3 != -1) break;
      (&PTR_DAT_101a6ac0)[DAT_101aac70 * 0x117] = "^3WARNING: ";
      FUN_1005f360("\'%s\' is not defined by %s\n",pcVar4,param_2);
      (&PTR_DAT_101a6ac0)[DAT_101aac70 * 0x117] = "^1ERROR: ";
      iVar3 = FUN_1005faf0(&DAT_1019563c,1);
      uVar6 = 0;
      if (iVar3 == 0) goto LAB_1001a4ac;
      pcVar4 = (char *)*param_1;
      if (pcVar4 != (char *)0x0) {
        cVar1 = *pcVar4;
        if (cVar1 == '\0') {
LAB_1001a2db:
          *param_1 = pcVar4;
        }
        else {
          do {
            pcVar4 = pcVar4 + 1;
            if (cVar1 == '\n') {
              *(int *)(&DAT_101a6ab0 + DAT_101aac70 * 0x45c) =
                   *(int *)(&DAT_101a6ab0 + DAT_101aac70 * 0x45c) + 1;
              goto LAB_1001a2db;
            }
            cVar1 = *pcVar4;
          } while (cVar1 != '\0');
          *param_1 = pcVar4;
        }
      }
    }
    if (local_100[iVar3] != '\0') {
      uVar6 = FUN_1005f360("shader constant \'%s\' defined more than once for shader \'%s\'\n",
                           pcVar4,param_2);
LAB_1001a4ac:
      return uVar6 & 0xffffff00;
    }
    local_100[iVar3] = '\x01';
    *(undefined2 *)((int)local_114 + -2) = *(undefined2 *)((int)piVar2 + iVar3 * 0x14 + 6);
    uVar6 = FUN_1001a030();
    if ((char)uVar6 == '\0') goto LAB_1001a4ac;
    iVar3 = FUN_1005faf0(&DAT_10195820,1);
    uVar6 = 0;
    if (iVar3 == 0) goto LAB_1001a4ac;
    if ((short)local_114[-1] == 3) {
      if (*local_114 != 0xe) {
        if (*local_114 == 0xf) {
          *param_3 = *param_3 | 2;
        }
        goto LAB_1001a383;
      }
      *param_3 = *param_3 | 1;
      local_11c = local_11c + 1;
      local_114 = local_114 + 2;
    }
    else {
LAB_1001a383:
      local_11c = local_11c + 1;
      local_114 = local_114 + 2;
    }
  } while( true );
}


