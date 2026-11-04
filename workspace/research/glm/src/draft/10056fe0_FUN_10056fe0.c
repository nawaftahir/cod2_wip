


void FUN_10056fe0(int param_1,int param_2,int param_3,int param_4,int param_5,int param_6,
                 byte *param_7)

{
  byte bVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  unsigned int uVar7;
  byte *pbVar8;
  int iVar9;
  int local_21c;
  int local_218;
  int local_214;
  int local_210;
  int local_208;
  int local_200 [128];
  
  piVar4 = local_200;
  for (iVar5 = 0x80; iVar5 != 0; iVar5 = iVar5 + -1) {
    *piVar4 = 0x7fffffff;
    piVar4 = piVar4 + 1;
  }
  local_210 = 0;
  if (0 < param_5) {
    do {
      bVar1 = *(byte *)(local_210 + param_6);
      uVar7 = (unsigned int)bVar1;
      piVar4 = *(int **)(param_1 + 0x7c);
      iVar6 = param_2 - (unsigned int)*(byte *)(uVar7 + *piVar4);
      iVar2 = param_3 - (unsigned int)*(byte *)(piVar4[1] + uVar7);
      iVar5 = iVar2 * 3;
      iVar3 = (param_4 - (unsigned int)*(byte *)(piVar4[2] + uVar7)) * 2;
      iVar9 = iVar3 * iVar3 + iVar5 * iVar5 + iVar6 * iVar6;
      iVar5 = (iVar3 + 8) * 0x20;
      local_21c = (iVar6 + 4) * 0x10;
      piVar4 = local_200;
      local_218 = 4;
      pbVar8 = param_7;
      do {
        local_208 = 8;
        iVar3 = iVar9;
        local_214 = (iVar2 * 9 + 0x12) * 8;
        do {
          if (iVar3 < *piVar4) {
            *piVar4 = iVar3;
            *pbVar8 = bVar1;
          }
          iVar6 = iVar3 + iVar5;
          if (iVar6 < piVar4[1]) {
            piVar4[1] = iVar6;
            pbVar8[1] = bVar1;
          }
          iVar6 = iVar6 + iVar5 + 0x200;
          if (iVar6 < piVar4[2]) {
            piVar4[2] = iVar6;
            pbVar8[2] = bVar1;
          }
          iVar6 = iVar6 + iVar5 + 0x400;
          if (iVar6 < piVar4[3]) {
            piVar4[3] = iVar6;
            pbVar8[3] = bVar1;
          }
          iVar3 = iVar3 + local_214;
          local_214 = local_214 + 0x120;
          piVar4 = piVar4 + 4;
          pbVar8 = pbVar8 + 4;
          local_208 = local_208 + -1;
        } while (local_208 != 0);
        iVar9 = iVar9 + local_21c;
        local_21c = local_21c + 0x80;
        local_218 = local_218 + -1;
      } while (local_218 != 0);
      local_210 = local_210 + 1;
    } while (local_210 < param_5);
  }
  return;
}


