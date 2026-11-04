// 1001f6f0 size=886 FUN_1001f6f0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1001f6f0(int param_1,int param_2,undefined4 param_3)

{
  LONG *Destination;
  undefined4 uVar1;
  int *piVar2;
  LONG LVar3;
  int iVar4;
  uint Value;
  int iVar5;
  uint uVar6;
  undefined4 *puVar7;
  uint uVar8;
  undefined4 *puVar9;
  float10 fVar10;
  float fStack_eb0;
  undefined4 *puStack_eac;
  undefined4 local_ea8;
  int iStack_ea4;
  undefined4 *puStack_ea0;
  undefined1 auStack_e9c [4];
  undefined4 uStack_e98;
  int iStack_e94;
  undefined4 *puStack_e90;
  undefined4 uStack_e8c;
  undefined4 uStack_e88;
  undefined4 uStack_e84;
  undefined4 uStack_e80;
  undefined1 uStack_e7c;
  undefined1 uStack_e7b;
  undefined4 auStack_e7a [17];
  undefined4 uStack_e34;
  uint uStack_e30;
  int iStack_e2c;
  undefined4 auStack_e28 [8];
  undefined4 auStack_e08 [897];
  
  Destination = (LONG *)(param_1 + 0xc);
  if (3 < *(int *)(param_1 + 0xc)) {
    return;
  }
  LVar3 = InterlockedCompareExchange(Destination,3,2);
  if (LVar3 != 2) {
    do {
    } while (*Destination < 4);
    return;
  }
  uVar1 = *(undefined4 *)(param_1 + 4);
  local_ea8 = uVar1;
  iVar4 = (*(code *)RI_XModelGetSurfaces)(uVar1);
  if (iVar4 != 0) {
    if (*(int *)(DAT_101ce7d8 + 8) != 0) {
      (*(code *)RI_DObjGetModel)(DAT_101d7e10,uVar1);
      FUN_1001da80(param_1);
      FUN_1001de60(param_1);
    }
    *Destination = 4;
    return;
  }
  iStack_ea4 = (*(code *)RI_XModelGetFlags)(uVar1);
  fVar10 = (float10)FUN_1001d960(*(undefined4 *)(param_2 + 0x38));
  fStack_eb0 = (float)fVar10;
  puStack_eac = (undefined4 *)(*(code *)RI_XModelSetTestLods)(uVar1,fStack_eb0);
  if (-1 < (int)puStack_eac) {
    Value = (*(code *)RI_XModelPrecache)(uVar1,auStack_e9c,puStack_eac,&puStack_ea0);
    LVar3 = InterlockedExchangeAdd((LONG *)&DAT_10692a5c,Value);
    if (LVar3 + Value < 0x1001) {
      iVar4 = 0;
      *(undefined **)(param_1 + 0x2c) = &DAT_10692a60 + LVar3 * 4;
      fStack_eb0 = 0.0;
      puVar7 = auStack_e08;
      if (0 < (int)Value) {
        do {
          iVar5 = FUN_1001f2a0(param_1,param_2,param_3,puStack_eac,&fStack_eb0);
          if (iVar5 == 0) {
            *Destination = 4;
            return;
          }
          puVar7 = (undefined4 *)((int)puVar7 + iVar5);
          iVar4 = iVar4 + 1;
        } while (iVar4 < (int)Value);
      }
      uVar8 = (int)puVar7 - (int)auStack_e08;
      LVar3 = InterlockedExchangeAdd(DAT_101da9c8 + 0x20002,uVar8);
      iVar4 = DAT_1076a874;
      piVar2 = DAT_101da9c8;
      if (LVar3 + uVar8 < 0x20001) {
        puVar7 = (undefined4 *)((int)DAT_101da9c8 + LVar3 + 0x8000c);
        *(undefined4 **)(param_1 + 0x30) = puVar7;
        puVar9 = auStack_e08;
        for (uVar6 = uVar8 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
          *puVar7 = *puVar9;
          puVar9 = puVar9 + 1;
          puVar7 = puVar7 + 1;
        }
        for (uVar8 = uVar8 & 3; iVar4 = DAT_101ce7c8, uVar8 != 0; uVar8 = uVar8 - 1) {
          *(undefined1 *)puVar7 = *(undefined1 *)puVar9;
          puVar9 = (undefined4 *)((int)puVar9 + 1);
          puVar7 = (undefined4 *)((int)puVar7 + 1);
        }
        *(uint *)(param_1 + 0x10) = Value;
        if (*(int *)(iVar4 + 8) != 0) {
          (*(code *)RI_DObjGetModel)(DAT_101d7e10,local_ea8);
          FUN_1001e220();
        }
        if (fStack_eb0 != 0.0) {
          puStack_eac = (undefined4 *)(*(code *)RI_XModelGetLodName)(local_ea8);
          if (iStack_ea4 == 1) {
            uStack_e34 = *(undefined4 *)(param_1 + 0x30);
            iStack_e2c = param_2;
            puVar7 = puStack_eac;
            puVar9 = auStack_e28;
            for (iVar4 = 8; iVar4 != 0; iVar4 = iVar4 + -1) {
              *puVar9 = *puVar7;
              puVar7 = puVar7 + 1;
              puVar9 = puVar9 + 1;
            }
            uStack_e30 = Value;
            FUN_1001f520(&uStack_e34);
            *Destination = 4;
            return;
          }
          uStack_e8c = *puStack_ea0;
          uStack_e88 = puStack_ea0[1];
          uStack_e84 = puStack_ea0[2];
          uStack_e80 = puStack_ea0[3];
          if (0 < (int)Value) {
            puVar7 = auStack_e7a;
            for (uVar8 = Value >> 2; uVar8 != 0; uVar8 = uVar8 - 1) {
              *puVar7 = 0;
              puVar7 = puVar7 + 1;
            }
            for (uVar8 = Value & 3; uVar8 != 0; uVar8 = uVar8 - 1) {
              *(undefined1 *)puVar7 = 0;
              puVar7 = (undefined4 *)((int)puVar7 + 1);
            }
          }
          uStack_e98 = *(undefined4 *)(param_1 + 0x30);
          uStack_e7b = (undefined1)iStack_ea4;
          iStack_e94 = param_2;
          uStack_e7c = (undefined1)Value;
          puStack_e90 = puStack_eac;
          FUN_10020be0((10 < (int)Value) + '\x06',&uStack_e98,0);
        }
        *Destination = 4;
        return;
      }
      DAT_101da9c8[0x20002] = 0x20000;
      if (iVar4 != *piVar2) {
        DAT_1076a874 = *piVar2;
        (*(code *)RI_Printf)(2,"MAX_SCENE_SURFS_SIZE exceeded - not drawing surface\n");
      }
      *Destination = 4;
      return;
    }
    _DAT_10692a5c = 0x1000;
    if (DAT_1076a874 != *DAT_101da9c8) {
      DAT_1076a874 = *DAT_101da9c8;
      (*(code *)RI_Printf)(2,"MAX_SCENE_MATERIALS exceeded - not drawing surface\n");
    }
  }
  *Destination = 4;
  return;
}


