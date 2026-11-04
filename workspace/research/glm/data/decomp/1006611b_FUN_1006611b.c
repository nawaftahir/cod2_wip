// 1006611b size=677 FUN_1006611b

int FUN_1006611b(int param_1,int *param_2)

{
  byte bVar1;
  void *pvVar2;
  int iVar3;
  int *piVar4;
  int in_ECX;
  int iVar5;
  byte *pbVar6;
  char *pcVar7;
  undefined4 *puVar8;
  byte *pbVar9;
  char *pcVar10;
  undefined4 *puVar11;
  bool bVar12;
  
  pvVar2 = operator_new(0x14);
  if (pvVar2 == (void *)0x0) {
    param_1 = 0;
  }
  else {
    param_1 = FUN_10063a1a(param_1,0,0);
  }
  if (param_1 != 0) {
    if (((param_2 != (int *)0x0) &&
        (pcVar7 = (char *)**(undefined4 **)(in_ECX + 0x26c),
        pcVar7 < (char *)(*(undefined4 **)(in_ECX + 0x26c))[1])) && (*pcVar7 == '(')) {
      param_2 = (int *)(param_1 + 4);
      iVar3 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),in_ECX + 0x278);
      if (iVar3 < 0) goto LAB_100663a9;
      do {
        iVar3 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
        if (iVar3 < 0) goto LAB_100663a9;
        if (*(int *)(in_ECX + 0x278) != 9) goto LAB_100662af;
        for (iVar3 = *(int *)(param_1 + 4); iVar3 != 0; iVar3 = *(int *)(iVar3 + 0xc)) {
          pbVar6 = *(byte **)(iVar3 + 0x18);
          pbVar9 = *(byte **)(in_ECX + 0x280);
          do {
            bVar1 = *pbVar9;
            bVar12 = bVar1 < *pbVar6;
            if (bVar1 != *pbVar6) {
LAB_100661f7:
              iVar5 = (1 - (uint)bVar12) - (uint)(bVar12 != 0);
              goto LAB_100661fc;
            }
            if (bVar1 == 0) break;
            bVar1 = pbVar9[1];
            bVar12 = bVar1 < pbVar6[1];
            if (bVar1 != pbVar6[1]) goto LAB_100661f7;
            pbVar9 = pbVar9 + 2;
            pbVar6 = pbVar6 + 2;
          } while (bVar1 != 0);
          iVar5 = 0;
LAB_100661fc:
          if (iVar5 == 0) {
            FUN_10067c3e(in_ECX + 0x18,in_ECX + 0x278,0x5e7,"duplicate macro parameter \'%s\'",
                         *(undefined4 *)(in_ECX + 0x280));
            break;
          }
        }
        iVar3 = FUN_1006506e(0x30);
        if (iVar3 == 0) {
          iVar3 = 0;
        }
        else {
          iVar3 = FUN_10082a7b(in_ECX + 0x278);
        }
        *param_2 = iVar3;
        if (iVar3 == 0) goto LAB_10066385;
        param_2 = (int *)(iVar3 + 0xc);
        iVar3 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
        if (iVar3 < 0) goto LAB_100663a9;
        if (*(int *)(in_ECX + 0x278) != 1) goto LAB_100662af;
        iVar3 = 2;
        bVar12 = true;
        pcVar7 = ",";
        pcVar10 = (char *)(in_ECX + 0x280);
        do {
          if (iVar3 == 0) break;
          iVar3 = iVar3 + -1;
          bVar12 = *pcVar7 == *pcVar10;
          pcVar7 = pcVar7 + 1;
          pcVar10 = pcVar10 + 1;
        } while (bVar12);
      } while (bVar12);
      iVar3 = 2;
      bVar12 = true;
      pcVar7 = ")";
      pcVar10 = (char *)(in_ECX + 0x280);
      do {
        if (iVar3 == 0) break;
        iVar3 = iVar3 + -1;
        bVar12 = *pcVar7 == *pcVar10;
        pcVar7 = pcVar7 + 1;
        pcVar10 = pcVar10 + 1;
      } while (bVar12);
      if (!bVar12) {
LAB_100662af:
        iVar3 = *(int *)(in_ECX + 0x278);
        if ((iVar3 == 0xc) || (iVar3 == 0xd)) {
          *(undefined4 *)(in_ECX + 0x40) = 1;
        }
        FUN_10067e62(0x5dc,(int *)(in_ECX + 0x278));
        *(undefined4 *)(in_ECX + 0x44) = 1;
        iVar3 = -0x7fffbffb;
        goto LAB_100663a9;
      }
    }
    piVar4 = (int *)(param_1 + 8);
    while( true ) {
      iVar3 = *(int *)(in_ECX + 100);
      if (iVar3 == 0) {
        iVar3 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),in_ECX + 0x278);
        if (iVar3 < 0) goto LAB_100663a9;
      }
      else {
        puVar8 = (undefined4 *)(iVar3 + 0x10);
        puVar11 = (undefined4 *)(in_ECX + 0x278);
        for (iVar5 = 8; iVar5 != 0; iVar5 = iVar5 + -1) {
          *puVar11 = *puVar8;
          puVar8 = puVar8 + 1;
          puVar11 = puVar11 + 1;
        }
        *(undefined4 *)(in_ECX + 100) = *(undefined4 *)(iVar3 + 0xc);
        *(undefined4 *)(iVar3 + 0xc) = 0;
        *(undefined4 *)(in_ECX + 0x288) = *(undefined4 *)(*(int *)(in_ECX + 0x26c) + 0x18);
        *(undefined4 *)(in_ECX + 0x28c) = *(undefined4 *)(*(int *)(in_ECX + 0x26c) + 0x1c);
      }
      if ((*(int *)(in_ECX + 0x278) == 0xc) || (*(int *)(in_ECX + 0x278) == 0xd)) {
        *(undefined4 *)(in_ECX + 0x40) = 1;
        iVar3 = FUN_100652c0(param_1);
        if (-1 < iVar3) {
          param_1 = 0;
          iVar3 = 0;
        }
        goto LAB_100663a9;
      }
      iVar3 = FUN_1006506e(0x30);
      if (iVar3 == 0) {
        iVar3 = 0;
      }
      else {
        iVar3 = FUN_10082a7b(in_ECX + 0x278);
      }
      *piVar4 = iVar3;
      if (iVar3 == 0) break;
      piVar4 = (int *)(iVar3 + 0xc);
    }
  }
LAB_10066385:
  iVar3 = -0x7ff8fff2;
LAB_100663a9:
  if (param_1 != 0) {
    FUN_10065146(1);
  }
  return iVar3;
}


