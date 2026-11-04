// 10064ccb size=620 FUN_10064ccb

undefined4 FUN_10064ccb(undefined4 *param_1,undefined4 *param_2)

{
  byte bVar1;
  int iVar2;
  byte *pbVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  byte *pbVar9;
  int iVar10;
  bool bVar11;
  bool bVar12;
  
  pbVar3 = (byte *)*param_1;
  pbVar9 = (byte *)*param_2;
  do {
    bVar1 = *pbVar3;
    bVar11 = bVar1 < *pbVar9;
    if (bVar1 != *pbVar9) {
LAB_10064d02:
      iVar4 = (1 - (uint)bVar11) - (uint)(bVar11 != 0);
      goto LAB_10064d07;
    }
    if (bVar1 == 0) break;
    bVar1 = pbVar3[1];
    bVar11 = bVar1 < pbVar9[1];
    if (bVar1 != pbVar9[1]) goto LAB_10064d02;
    pbVar3 = pbVar3 + 2;
    pbVar9 = pbVar9 + 2;
  } while (bVar1 != 0);
  iVar4 = 0;
LAB_10064d07:
  if (iVar4 == 0) {
    iVar4 = param_1[1];
    iVar2 = param_2[1];
    iVar5 = iVar4;
    iVar8 = iVar2;
    iVar6 = iVar2;
    if (iVar4 != 0) {
      do {
        iVar6 = 0;
        if (iVar8 == 0) break;
        iVar5 = *(int *)(iVar5 + 0xc);
        iVar8 = *(int *)(iVar8 + 0xc);
        iVar6 = iVar8;
      } while (iVar5 != 0);
      if (iVar5 != 0) {
        return 0;
      }
    }
    if (iVar6 == 0) {
      iVar5 = param_1[2];
      iVar8 = param_2[2];
LAB_10064f1e:
      if (iVar5 != 0) {
        if ((iVar8 == 0) || (iVar6 = *(int *)(iVar5 + 0x10), iVar6 != *(int *)(iVar8 + 0x10)))
        goto LAB_10064daa;
        if (8 < iVar6) {
          if (iVar6 == 9) {
            bVar11 = false;
            param_1 = (undefined4 *)0x1;
            for (iVar6 = iVar4; iVar10 = iVar2, iVar6 != 0; iVar6 = *(int *)(iVar6 + 0xc)) {
              pbVar3 = *(byte **)(iVar6 + 0x18);
              pbVar9 = *(byte **)(iVar5 + 0x18);
              do {
                bVar1 = *pbVar9;
                bVar12 = bVar1 < *pbVar3;
                if (bVar1 != *pbVar3) {
LAB_10064e57:
                  iVar7 = (1 - (uint)bVar12) - (uint)(bVar12 != 0);
                  goto LAB_10064e5c;
                }
                if (bVar1 == 0) break;
                bVar1 = pbVar9[1];
                bVar12 = bVar1 < pbVar3[1];
                if (bVar1 != pbVar3[1]) goto LAB_10064e57;
                pbVar9 = pbVar9 + 2;
                pbVar3 = pbVar3 + 2;
              } while (bVar1 != 0);
              iVar7 = 0;
LAB_10064e5c:
              if (iVar7 == 0) {
                bVar11 = true;
                break;
              }
              param_1 = (undefined4 *)((int)param_1 + 1);
            }
            do {
              param_1 = (undefined4 *)((int)param_1 + -1);
              if (iVar10 == 0) goto LAB_10064ec2;
              pbVar3 = *(byte **)(iVar10 + 0x18);
              pbVar9 = *(byte **)(iVar8 + 0x18);
              do {
                bVar1 = *pbVar9;
                bVar12 = bVar1 < *pbVar3;
                if (bVar1 != *pbVar3) {
LAB_10064ea3:
                  iVar6 = (1 - (uint)bVar12) - (uint)(bVar12 != 0);
                  goto LAB_10064ea8;
                }
                if (bVar1 == 0) break;
                bVar1 = pbVar9[1];
                bVar12 = bVar1 < pbVar3[1];
                if (bVar1 != pbVar3[1]) goto LAB_10064ea3;
                pbVar9 = pbVar9 + 2;
                pbVar3 = pbVar3 + 2;
              } while (bVar1 != 0);
              iVar6 = 0;
LAB_10064ea8:
              if (iVar6 == 0) {
                bVar11 = true;
                goto LAB_10064ec2;
              }
              iVar10 = *(int *)(iVar10 + 0xc);
            } while( true );
          }
          if ((iVar6 < 10) || (0xb < iVar6)) goto LAB_10064f18;
          pbVar3 = *(byte **)(iVar8 + 0x18);
          pbVar9 = *(byte **)(iVar5 + 0x18);
          do {
            bVar1 = *pbVar9;
            bVar11 = bVar1 < *pbVar3;
            if (bVar1 != *pbVar3) goto LAB_10064eff;
            if (bVar1 == 0) break;
            bVar1 = pbVar9[1];
            bVar11 = bVar1 < pbVar3[1];
            if (bVar1 != pbVar3[1]) goto LAB_10064eff;
            pbVar9 = pbVar9 + 2;
            pbVar3 = pbVar3 + 2;
          } while (bVar1 != 0);
          goto LAB_10064e16;
        }
        if (iVar6 < 5) {
          if (iVar6 != 0) {
            if (iVar6 == 1) {
              if ((((*(char *)(iVar5 + 0x18) != *(char *)(iVar8 + 0x18)) ||
                   (*(char *)(iVar5 + 0x19) != *(char *)(iVar8 + 0x19))) ||
                  (*(char *)(iVar5 + 0x1a) != *(char *)(iVar8 + 0x1a))) ||
                 (*(char *)(iVar5 + 0x1b) != *(char *)(iVar8 + 0x1b))) goto LAB_10064daa;
            }
            else if ((1 < iVar6) && (iVar6 < 5)) goto LAB_10064d76;
            goto LAB_10064f18;
          }
LAB_10064d76:
          bVar11 = *(int *)(iVar5 + 0x18) == *(int *)(iVar8 + 0x18);
          goto LAB_10064f10;
        }
        if (*(double *)(iVar5 + 0x18) != *(double *)(iVar8 + 0x18)) goto LAB_10064daa;
        goto LAB_10064f18;
      }
LAB_10064db2:
      if (iVar8 == 0) {
        return 1;
      }
    }
  }
  return 0;
LAB_10064ec2:
  if (bVar11) {
    bVar11 = param_1 == (undefined4 *)0x0;
    goto LAB_10064f10;
  }
  pbVar3 = *(byte **)(iVar8 + 0x18);
  pbVar9 = *(byte **)(iVar5 + 0x18);
  do {
    bVar1 = *pbVar9;
    bVar11 = bVar1 < *pbVar3;
    if (bVar1 != *pbVar3) goto LAB_10064eff;
    if (bVar1 == 0) break;
    bVar1 = pbVar9[1];
    bVar11 = bVar1 < pbVar3[1];
    if (bVar1 != pbVar3[1]) goto LAB_10064eff;
    pbVar9 = pbVar9 + 2;
    pbVar3 = pbVar3 + 2;
  } while (bVar1 != 0);
LAB_10064e16:
  iVar6 = 0;
  goto LAB_10064f04;
LAB_10064eff:
  iVar6 = (1 - (uint)bVar11) - (uint)(bVar11 != 0);
LAB_10064f04:
  bVar11 = iVar6 == 0;
LAB_10064f10:
  if (!bVar11) {
LAB_10064daa:
    if (iVar5 != 0) {
      return 0;
    }
    goto LAB_10064db2;
  }
LAB_10064f18:
  iVar5 = *(int *)(iVar5 + 0xc);
  iVar8 = *(int *)(iVar8 + 0xc);
  goto LAB_10064f1e;
}


