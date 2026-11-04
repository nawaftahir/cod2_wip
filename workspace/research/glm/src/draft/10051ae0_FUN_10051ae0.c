


void FUN_10051ae0(int param_1,int param_2,unsigned int *param_3,int *param_4)

{
  int iVar1;
  unsigned char *puVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  byte *pbVar7;
  int iVar8;
  byte *pbVar9;
  int local_c;
  
  iVar1 = *param_4;
  iVar3 = 0;
  if (0 < *(int *)(param_1 + 0x11c)) {
    do {
      local_c = 0;
      do {
        pbVar7 = (byte *)*param_3;
        if (local_c == 0) {
          pbVar9 = (byte *)param_3[-1];
        }
        else {
          pbVar9 = (byte *)param_3[1];
        }
        puVar2 = *(unsigned char **)(iVar1 + iVar3 * 4);
        iVar3 = iVar3 + 1;
        iVar8 = (unsigned int)*pbVar7 * 3 + (unsigned int)*pbVar9;
        iVar4 = (unsigned int)pbVar7[1] * 3 + (unsigned int)pbVar9[1];
        *puVar2 = (char)(iVar8 * 4 + 8 >> 4);
        pbVar9 = pbVar9 + 2;
        pbVar7 = pbVar7 + 2;
        puVar2[1] = (char)(iVar8 * 3 + 7 + iVar4 >> 4);
        for (iVar6 = *(int *)(param_2 + 0x28) + -2; puVar2 = puVar2 + 2, iVar6 != 0;
            iVar6 = iVar6 + -1) {
          iVar5 = (unsigned int)*pbVar7 * 3 + (unsigned int)*pbVar9;
          pbVar9 = pbVar9 + 1;
          *puVar2 = (char)(iVar4 * 3 + 8 + iVar8 >> 4);
          pbVar7 = pbVar7 + 1;
          puVar2[1] = (char)(iVar4 * 3 + 7 + iVar5 >> 4);
          iVar8 = iVar4;
          iVar4 = iVar5;
        }
        *puVar2 = (char)(iVar4 * 3 + 8 + iVar8 >> 4);
        puVar2[1] = (char)(iVar4 * 4 + 7 >> 4);
        local_c = local_c + 1;
      } while (local_c < 2);
      param_3 = param_3 + 1;
    } while (iVar3 < *(int *)(param_1 + 0x11c));
  }
  return;
}


