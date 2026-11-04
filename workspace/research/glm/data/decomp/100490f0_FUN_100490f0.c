// 100490f0 size=647 FUN_100490f0

void FUN_100490f0(int param_1,int param_2,int param_3,int param_4)

{
  int iVar1;
  byte *pbVar2;
  undefined1 *puVar3;
  byte *pbVar4;
  byte *pbVar5;
  byte *pbVar6;
  int iVar7;
  byte *pbVar8;
  int iVar9;
  int iVar10;
  undefined4 *puVar11;
  byte *pbVar12;
  byte *pbVar13;
  int local_c;
  
  iVar1 = *(int *)(param_2 + 0x1c);
  puVar11 = (undefined4 *)(param_3 + -4);
  FUN_10048cd0(puVar11,*(int *)(param_1 + 0xe4) + 2,*(undefined4 *)(param_1 + 0x24),iVar1 * 0x10);
  iVar7 = *(int *)(param_1 + 0xbc) * 0x10;
  iVar9 = *(int *)(param_1 + 0xbc) * -0x50 + 0x4000;
  local_c = 0;
  if (0 < *(int *)(param_2 + 0xc)) {
    do {
      pbVar2 = (byte *)puVar11[2];
      puVar3 = *(undefined1 **)(param_4 + local_c * 4);
      pbVar4 = (byte *)puVar11[1];
      pbVar5 = (byte *)*puVar11;
      pbVar6 = (byte *)puVar11[3];
      pbVar8 = pbVar4 + 2;
      pbVar13 = pbVar6 + 2;
      pbVar12 = pbVar5 + 2;
      *puVar3 = (char)(((uint)*pbVar13 +
                       (uint)*pbVar12 + (uint)*pbVar5 +
                       ((uint)*pbVar8 +
                        (uint)pbVar2[2] + (uint)*pbVar4 + (uint)pbVar6[1] + (uint)pbVar5[1] +
                        (uint)*pbVar2 + (uint)*pbVar5) * 2 + (uint)*pbVar6 * 3) * iVar7 + 0x8000 +
                       ((uint)pbVar4[1] + (uint)pbVar2[1] + (uint)*pbVar4 + (uint)*pbVar2) * iVar9
                      >> 0x10);
      iVar10 = iVar1 * 8 + -2;
      while( true ) {
        puVar3 = puVar3 + 1;
        pbVar2 = pbVar2 + 2;
        if (iVar10 == 0) break;
        *puVar3 = (char)(((uint)pbVar13[-1] +
                          ((uint)pbVar13[1] + (uint)pbVar12[1] + (uint)pbVar2[-1] + (uint)pbVar8[-1]
                           + (uint)*pbVar13 + (uint)pbVar2[2] + (uint)*pbVar12 + (uint)pbVar8[2]) *
                          2 + (uint)pbVar12[-1] + (uint)pbVar12[2] + (uint)pbVar13[2]) * iVar7 +
                         0x8000 + ((uint)pbVar2[1] + (uint)pbVar8[1] + (uint)*pbVar2 + (uint)*pbVar8
                                  ) * iVar9 >> 0x10);
        pbVar8 = pbVar8 + 2;
        pbVar12 = pbVar12 + 2;
        pbVar13 = pbVar13 + 2;
        iVar10 = iVar10 + -1;
      }
      *puVar3 = (char)(((uint)pbVar12[-1] +
                       (uint)pbVar13[-1] + (uint)pbVar12[1] +
                       ((uint)*pbVar12 +
                        (uint)*pbVar13 + (uint)pbVar8[1] + (uint)pbVar2[-1] + (uint)pbVar8[-1] +
                        (uint)pbVar2[1] + (uint)pbVar12[1]) * 2 + (uint)pbVar13[1] * 3) * iVar7 +
                       0x8000 + ((uint)*pbVar8 + (uint)*pbVar2 + (uint)pbVar8[1] + (uint)pbVar2[1])
                                * iVar9 >> 0x10);
      puVar11 = puVar11 + 2;
      local_c = local_c + 1;
    } while (local_c < *(int *)(param_2 + 0xc));
  }
  return;
}


