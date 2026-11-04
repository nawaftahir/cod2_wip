// 100376c0 size=194 FUN_100376c0

void FUN_100376c0(void)

{
  uint uVar1;
  uint uVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  undefined4 *puStack_44;
  undefined1 auStack_40 [64];
  
  DAT_10764578 = (undefined4 *)0x0;
  DAT_1076457c = 0;
  if ((*(int *)(DAT_101ce6d4 + 8) != 0) &&
     (DAT_10764578 = (undefined4 *)(*(code *)RI_Z_MallocInternal)(0x1800000),
     *(int *)(DAT_101ce6d4 + 8) == 2)) {
    FUN_10037670();
    uVar1 = (*(code *)RI_StatMon_Warning)(auStack_40,&puStack_44);
    if (-1 < (int)uVar1) {
      if (uVar1 % 6 == 0) {
        if (0x1800000 < uVar1) {
          uVar1 = 0x1800000;
        }
        puVar3 = puStack_44;
        puVar4 = DAT_10764578;
        for (uVar2 = uVar1 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
          *puVar4 = *puVar3;
          puVar3 = puVar3 + 1;
          puVar4 = puVar4 + 1;
        }
        for (uVar2 = uVar1 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
          *(undefined1 *)puVar4 = *(undefined1 *)puVar3;
          puVar3 = (undefined4 *)((int)puVar3 + 1);
          puVar4 = (undefined4 *)((int)puVar4 + 1);
        }
        DAT_1076457c = uVar1 / 6;
      }
      (*(code *)RI_FS_ReadFile)(puStack_44);
    }
  }
  return;
}


