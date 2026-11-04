// 10017640 size=195 FUN_10017640

void FUN_10017640(int param_1)

{
  ushort uVar1;
  undefined4 *puVar2;
  int *piVar3;
  char cVar4;
  undefined4 *puVar5;
  uint uVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  
  uVar1 = *(ushort *)(param_1 + 0x34);
  puVar8 = (undefined4 *)0x0;
  while( true ) {
    puVar7 = (undefined4 *)0x0;
    if (uVar1 != 0) {
      puVar5 = (undefined4 *)(*(int *)(param_1 + 0x3c) + 8);
      uVar6 = (uint)uVar1;
      do {
        if (((*(char *)((int)puVar5 + -3) != '\x05') &&
            (puVar2 = (undefined4 *)*puVar5, puVar7 < puVar2)) &&
           ((puVar8 == (undefined4 *)0x0 || (puVar2 < puVar8)))) {
          puVar7 = puVar2;
        }
        puVar5 = puVar5 + 3;
        uVar6 = uVar6 - 1;
      } while (uVar6 != 0);
    }
    if (puVar7 == (undefined4 *)0x0) break;
    if ((1 < *(byte *)(puVar7 + 3)) && (*(byte *)(puVar7 + 3) != 4)) {
      DAT_101d0a74 = DAT_101d0a74 - puVar7[4];
      DAT_101d0a78 = DAT_101d0a78 - puVar7[5];
    }
    piVar3 = (int *)puVar7[1];
    if (piVar3 != (int *)0x0) {
      (**(code **)(*piVar3 + 8))(piVar3);
      puVar7[1] = 0;
      puVar7[4] = 0;
      puVar7[5] = 0;
    }
    *puVar7 = 0;
    cVar4 = FUN_1000fa40();
    puVar8 = puVar7;
    if (cVar4 == '\0') {
      FUN_100138c0(1,"failed to load image \'%s\'",puVar7[8]);
    }
  }
  return;
}


