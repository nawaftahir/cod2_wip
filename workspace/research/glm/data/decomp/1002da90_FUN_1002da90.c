// 1002da90 size=186 FUN_1002da90

void FUN_1002da90(void)

{
  undefined4 *puVar1;
  int iVar2;
  int unaff_EDI;
  undefined4 uVar3;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 *puStack_14;
  undefined4 uStack_10;
  
  puVar1 = (undefined4 *)(unaff_EDI + 0x10);
  if (*(int *)(unaff_EDI + 0x10) != 0) {
    return;
  }
  uStack_10 = 0;
  uStack_18 = 0;
  uStack_1c = 0;
  uStack_20 = 8;
  puStack_14 = puVar1;
  iVar2 = (**(code **)(*DAT_101d1bf8 + 0x68))
                    (DAT_101d1bf8,
                     (int)*(short *)(unaff_EDI + 2) *
                     (((*(int *)(DAT_101ce708 + 8) != 2) - 1 & 0xffffffe4) + 0x40));
  if (-1 < iVar2) {
    uVar3 = 0;
    iVar2 = (**(code **)(*(int *)*puVar1 + 0x2c))((int *)*puVar1,0,0,&uStack_20,0);
    if (-1 < iVar2) {
      if (*(int *)(DAT_101ce708 + 8) != 2) {
        FUN_1002d1c0();
        FUN_10005020();
        return;
      }
      FUN_1002d240(uVar3);
      FUN_10005020();
      return;
    }
    (**(code **)(*(int *)*puVar1 + 8))((int *)*puVar1);
  }
  *puVar1 = 0;
  return;
}


