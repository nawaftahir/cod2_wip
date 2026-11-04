// 1001fa70 size=766 FUN_1001fa70

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1001fa70(int param_1,undefined4 param_2)

{
  LONG *Destination;
  undefined4 uVar1;
  int *piVar2;
  undefined1 uVar3;
  char cVar4;
  LONG LVar5;
  int iVar6;
  int Value;
  undefined4 *puVar7;
  int iVar8;
  uint uVar9;
  undefined4 *puVar10;
  uint uVar11;
  undefined4 *puVar12;
  int iVar13;
  undefined1 uStack_f9c;
  undefined1 auStack_f94 [8];
  undefined4 uStack_f8c;
  int iStack_f88;
  undefined4 uStack_f84;
  undefined4 auStack_f80 [8];
  undefined4 uStack_f60;
  undefined4 uStack_f5c;
  undefined4 *puStack_f58;
  undefined1 auStack_f54 [16];
  undefined1 uStack_f44;
  undefined1 uStack_f43;
  undefined1 auStack_f42 [66];
  short asStack_f00 [128];
  undefined4 auStack_e00 [896];
  
  Destination = (LONG *)(param_1 + 0xc);
  if (3 < *(int *)(param_1 + 0xc)) {
    return;
  }
  LVar5 = InterlockedCompareExchange(Destination,3,2);
  if (LVar5 != 2) {
    do {
    } while (*Destination < 4);
    return;
  }
  uVar1 = *(undefined4 *)(param_1 + 4);
  iVar6 = (*(code *)RI_XModelGetBasePoseBone)(uVar1);
  if (iVar6 != 0) {
    if (*(int *)(DAT_101ce7d8 + 8) != 0) {
      FUN_1001da80(param_1);
      FUN_1001de60(param_1);
    }
    *Destination = 4;
    return;
  }
  iVar6 = (*(code *)RI_DObjGetSurfaces)(uVar1);
  Value = FUN_1001d9f0(asStack_f00,auStack_f54,auStack_f94);
  if ((Value != 0) &&
     (puVar7 = (undefined4 *)(*(code *)RI_RI_unk120)(uVar1), puVar7 != (undefined4 *)0x0)) {
    LVar5 = InterlockedExchangeAdd((LONG *)&DAT_10692a5c,Value);
    if ((uint)(LVar5 + Value) < 0x1001) {
      iVar13 = 0;
      *(undefined **)(param_1 + 0x2c) = &DAT_10692a60 + LVar5 * 4;
      puVar10 = auStack_e00;
      if (0 < Value) {
        do {
          iVar8 = FUN_1001f120(param_1,uVar1,iVar13,auStack_f94);
          if (iVar8 == 0) goto LAB_1001fd59;
          puVar10 = (undefined4 *)((int)puVar10 + iVar8);
          iVar13 = iVar13 + 1;
        } while (iVar13 < Value);
      }
      uVar11 = (int)puVar10 - (int)auStack_e00;
      LVar5 = InterlockedExchangeAdd(DAT_101da9c8 + 0x20002,uVar11);
      iVar8 = DAT_1076a86c;
      piVar2 = DAT_101da9c8;
      iVar13 = DAT_101ce7c8;
      if (0x20000 < LVar5 + uVar11) {
        DAT_101da9c8[0x20002] = 0x20000;
        if (iVar8 != *piVar2) {
          DAT_1076a86c = *piVar2;
          (*(code *)RI_Printf)(2,"MAX_SCENE_SURFS_SIZE exceeded - not drawing surface\n");
        }
        *Destination = 4;
        return;
      }
      puVar10 = (undefined4 *)((int)DAT_101da9c8 + LVar5 + 0x8000c);
      *(undefined4 **)(param_1 + 0x30) = puVar10;
      puVar12 = auStack_e00;
      for (uVar9 = uVar11 >> 2; uVar9 != 0; uVar9 = uVar9 - 1) {
        *puVar10 = *puVar12;
        puVar12 = puVar12 + 1;
        puVar10 = puVar10 + 1;
      }
      for (uVar11 = uVar11 & 3; uVar11 != 0; uVar11 = uVar11 - 1) {
        *(undefined1 *)puVar10 = *(undefined1 *)puVar12;
        puVar12 = (undefined4 *)((int)puVar12 + 1);
        puVar10 = (undefined4 *)((int)puVar10 + 1);
      }
      *(int *)(param_1 + 0x10) = Value;
      if (*(int *)(iVar13 + 8) != 0) {
        FUN_1001e220();
      }
      if (iVar6 == 1) {
        uStack_f8c = *(undefined4 *)(param_1 + 0x30);
        puVar10 = &uStack_f8c;
        uStack_f84 = param_2;
        puVar12 = auStack_f80;
        for (iVar6 = 8; iVar6 != 0; iVar6 = iVar6 + -1) {
          *puVar12 = *puVar7;
          puVar7 = puVar7 + 1;
          puVar12 = puVar12 + 1;
        }
        cVar4 = '\x02';
        iStack_f88 = Value;
      }
      else {
        iVar13 = 0;
        if (0 < Value) {
          do {
            uVar3 = (*(code *)RI_RI_unk122)(uVar1,(int)asStack_f00[iVar13 * 2]);
            auStack_f42[iVar13] = uVar3;
            iVar13 = iVar13 + 1;
          } while (iVar13 < Value);
        }
        uStack_f60 = *(undefined4 *)(param_1 + 0x30);
        uStack_f5c = param_2;
        puVar10 = &uStack_f60;
        uStack_f9c = (undefined1)iVar6;
        cVar4 = (10 < Value) + '\x06';
        uStack_f44 = (undefined1)Value;
        uStack_f43 = uStack_f9c;
        puStack_f58 = puVar7;
      }
      FUN_10020be0(cVar4,puVar10,0);
LAB_1001fd59:
      *Destination = 4;
      return;
    }
    _DAT_10692a5c = 0x1000;
    if (DAT_1076a86c != *DAT_101da9c8) {
      DAT_1076a86c = *DAT_101da9c8;
      (*(code *)RI_Printf)(2,"MAX_SCENE_MATERIALS exceeded - not drawing surface\n");
    }
  }
  *Destination = 4;
  return;
}


