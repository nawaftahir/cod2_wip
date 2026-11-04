// 10004300 size=194 FUN_10004300

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10004300(int *param_1)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  int iVar5;
  undefined4 uVar6;
  undefined4 *puVar7;
  int iVar8;
  
  iVar1 = FUN_10001940();
  iVar8 = *(int *)(*param_1 + 0x5c) + param_1[1];
  _DAT_101ae378 = (*(code *)RI_Hunk_AllocInternal)(iVar1 << 5);
  _DAT_101ae374 = iVar1;
  if (0 < iVar1) {
    iVar5 = iVar8 - _DAT_101ae378;
    puVar4 = (undefined4 *)(_DAT_101ae378 + 0x1c);
    puVar2 = (undefined4 *)(_DAT_101ae378 + 0xc);
    puVar7 = (undefined4 *)(iVar8 + 0x18);
    puVar3 = (undefined4 *)(iVar8 + 0x10);
    iVar8 = _DAT_101ae378 - iVar8;
    param_1 = (int *)iVar1;
    do {
      puVar2[-3] = puVar3[-4];
      *puVar2 = *(undefined4 *)((int)puVar2 + iVar5);
      puVar2[-2] = puVar3[-3];
      puVar2[1] = *puVar3;
      puVar2[-1] = puVar3[-2];
      puVar2[2] = puVar3[1];
      if (puVar7[1] == 0) {
        uVar6 = 0xffffffff;
      }
      else {
        uVar6 = *puVar7;
      }
      *(undefined4 *)((int)puVar7 + iVar8) = puVar7[1];
      *puVar4 = uVar6;
      puVar2 = puVar2 + 8;
      puVar3 = puVar3 + 8;
      puVar7 = puVar7 + 8;
      puVar4 = puVar4 + 8;
      param_1 = (int *)((int)param_1 + -1);
    } while (param_1 != (int *)0x0);
  }
  return;
}


