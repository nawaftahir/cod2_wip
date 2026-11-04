// 1001c4e0 size=603 FUN_1001c4e0

undefined4 FUN_1001c4e0(int *param_1,undefined4 param_2)

{
  undefined4 *puVar1;
  char cVar2;
  int iVar3;
  ushort *puVar4;
  int iVar5;
  uint uVar6;
  int *piVar7;
  char *pcVar8;
  int *piVar9;
  bool bVar10;
  int local_48;
  undefined1 local_44 [12];
  uint local_38;
  uint local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_4;
  
  piVar9 = param_1;
  iVar3 = param_1[0xf];
  *param_1 = *param_1 + (int)param_1;
  param_1[1] = param_1[1] + (int)param_1;
  param_1[0xf] = iVar3 + (int)param_1;
  local_48 = 0;
  if ((short)param_1[0xd] != 0) {
    piVar7 = (int *)(iVar3 + (int)param_1 + 8);
    do {
      iVar3 = FUN_10016440();
      piVar7[-2] = iVar3;
      cVar2 = *(char *)((int)piVar7 + -3);
      if (cVar2 == '\x05') {
        puVar4 = (ushort *)(*piVar7 + (int)piVar9);
        *piVar7 = (int)puVar4;
        local_38 = (uint)*puVar4;
        local_2c = *(undefined4 *)(puVar4 + 4);
        local_24 = *(undefined4 *)(puVar4 + 8);
        local_30 = *(undefined4 *)(puVar4 + 2);
        local_20 = *(undefined4 *)(puVar4 + 10);
        local_1c = *(undefined4 *)(puVar4 + 0xc);
        local_18 = *(undefined4 *)(puVar4 + 6);
        local_28 = 0x44480000;
        local_4 = 0;
        local_34 = local_38;
        iVar3 = FUN_1000dd70(local_44);
        *(int *)(puVar4 + 0xe) = iVar3;
LAB_1001c5fa:
        bVar10 = iVar3 != 0;
      }
      else {
        param_1 = (int *)CONCAT31(param_1._1_3_,cVar2);
        if ((*(int *)(DAT_101ce708 + 8) != 2) || ((cVar2 != '\x03' && (cVar2 != '\x04')))) {
          pcVar8 = (char *)(*piVar7 + (int)piVar9);
          iVar3 = FUN_1000d140();
          if (iVar3 == 0) {
            if (*pcVar8 == '$') {
              iVar3 = FUN_100108a0();
LAB_1001c5e2:
              if (iVar3 != 0) goto LAB_1001c5f6;
            }
            else {
              iVar3 = FUN_1000cc10(pcVar8,3,param_1,param_2);
              cVar2 = FUN_1000fa40();
              if (cVar2 != '\0') goto LAB_1001c5e2;
              iVar3 = 0;
            }
            FUN_100138c0(1,"failed to load image \'%s\'",pcVar8);
          }
LAB_1001c5f6:
          *piVar7 = iVar3;
          goto LAB_1001c5fa;
        }
        *piVar7 = 0;
        bVar10 = true;
      }
      if (!bVar10) {
        return 0;
      }
      local_48 = local_48 + 1;
      piVar7 = piVar7 + 3;
    } while (local_48 < (int)(uint)*(ushort *)(piVar9 + 0xd));
  }
  piVar7 = (int *)(piVar9[0x10] + (int)piVar9);
  iVar3 = 0;
  piVar9[0x10] = (int)piVar7;
  if (*(short *)((int)piVar9 + 0x36) != 0) {
    do {
      iVar5 = FUN_10016440();
      *piVar7 = iVar5;
      if (iVar5 == 0) {
        return 0;
      }
      iVar3 = iVar3 + 1;
      piVar7 = piVar7 + 5;
    } while (iVar3 < (int)(uint)*(ushort *)((int)piVar9 + 0x36));
  }
  pcVar8 = (char *)(piVar9[0xe] + (int)piVar9);
  uVar6 = 0;
  iVar3 = 0x77;
  cVar2 = *(char *)(piVar9[0xe] + (int)piVar9);
  while (cVar2 != '\0') {
    uVar6 = uVar6 + cVar2 * iVar3;
    iVar5 = iVar3 + -0x76;
    iVar3 = iVar3 + 1;
    cVar2 = pcVar8[iVar5];
  }
  uVar6 = uVar6 & 0x3ff;
  puVar1 = (undefined4 *)(&DAT_101d82d0)[uVar6];
  do {
    if (puVar1 == (undefined4 *)0x0) {
LAB_1001c6da:
      piVar7 = (int *)FUN_1001c010();
      if (piVar7 != (int *)0x0) {
        FUN_100169e0();
        (&DAT_101d82d0)[(int)param_1] = piVar7;
      }
LAB_1001c6fb:
      piVar9[0xe] = (int)piVar7;
      if (piVar7 != (int *)0x0) {
        iVar3 = 0;
        piVar9 = piVar7;
        while ((piVar9 = piVar9 + 1, *piVar9 == 0 || (cVar2 = FUN_1001c400(*piVar7), cVar2 != '\0'))
              ) {
          iVar3 = iVar3 + 1;
          if (0x21 < iVar3) {
            return 1;
          }
        }
      }
      return 0;
    }
    iVar3 = __stricmp((char *)*puVar1,pcVar8);
    if (iVar3 == 0) {
      piVar7 = (int *)(&DAT_101d82d0)[uVar6];
      if (piVar7 != (int *)0x0) goto LAB_1001c6fb;
      goto LAB_1001c6da;
    }
    uVar6 = uVar6 + 1 & 0x3ff;
    puVar1 = (undefined4 *)(&DAT_101d82d0)[uVar6];
  } while( true );
}


