// 1004b940 size=364 FUN_1004b940

void FUN_1004b940(char param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  int iVar3;
  int unaff_EDI;
  undefined4 *puStack_10;
  
  puVar1 = (undefined4 *)(*(code *)**(undefined4 **)(unaff_EDI + 4))();
  *(undefined4 **)(unaff_EDI + 400) = puVar1;
  *puVar1 = &LAB_1004aa30;
  puVar1[2] = &LAB_1004aa90;
  puVar1[0x1c] = 0;
  if (param_1 != '\0') {
    _param_1 = 0;
    if (0 < *(int *)(unaff_EDI + 0x2c)) {
      puStack_10 = puVar1 + 0x12;
      do {
        uVar2 = (**(code **)(*(int *)(unaff_EDI + 4) + 0x14))();
        *puStack_10 = uVar2;
        puStack_10 = puStack_10 + 1;
        _param_1 = _param_1 + 1;
      } while (_param_1 < *(int *)(unaff_EDI + 0x2c));
    }
    puVar1[1] = FUN_1004ada0;
    puVar1[3] = FUN_1004afd0;
    puVar1[4] = puVar1 + 0x12;
    return;
  }
  iVar3 = (**(code **)(*(int *)(unaff_EDI + 4) + 4))();
  puVar1[9] = iVar3 + 0x80;
  puVar1[10] = iVar3 + 0x100;
  puVar1[0xb] = iVar3 + 0x180;
  puVar1[0xc] = iVar3 + 0x200;
  puVar1[0xd] = iVar3 + 0x280;
  puVar1[0xe] = iVar3 + 0x300;
  puVar1[8] = iVar3;
  puVar1[0xf] = iVar3 + 0x380;
  puVar1[0x10] = iVar3 + 0x400;
  puVar1[0x11] = iVar3 + 0x480;
  puVar1[4] = 0;
  puVar1[1] = &LAB_1004ad90;
  puVar1[3] = FUN_1004aae0;
  return;
}


