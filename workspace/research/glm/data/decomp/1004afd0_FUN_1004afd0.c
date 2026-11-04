// 1004afd0 size=409 FUN_1004afd0

int FUN_1004afd0(int param_1,int param_2)

{
  int iVar1;
  code *pcVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined4 *puVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  uint uStack_20;
  int iStack_1c;
  int iStack_18;
  int iStack_14;
  
  iVar1 = *(int *)(param_1 + 0x124);
  iVar4 = *(int *)(param_1 + 400);
  while ((*(int *)(param_1 + 0x84) < *(int *)(param_1 + 0x8c) ||
         ((*(int *)(param_1 + 0x84) == *(int *)(param_1 + 0x8c) &&
          (*(uint *)(param_1 + 0x88) <= *(uint *)(param_1 + 0x90)))))) {
    iVar3 = (*(code *)**(undefined4 **)(param_1 + 0x198))(param_1);
    if (iVar3 == 0) {
      return 0;
    }
  }
  iVar3 = *(int *)(param_1 + 0xcc);
  iStack_14 = 0;
  if (0 < *(int *)(param_1 + 0x2c)) {
    puVar6 = (undefined4 *)(iVar4 + 0x48);
    do {
      if (*(char *)(iVar3 + 0x30) != '\0') {
        iVar4 = (**(code **)(*(int *)(param_1 + 4) + 0x20))
                          (param_1,*puVar6,*(int *)(param_1 + 0x90) * *(int *)(iVar3 + 0xc),
                           *(int *)(iVar3 + 0xc),0);
        if (*(uint *)(param_1 + 0x90) < iVar1 - 1U) {
          uStack_20 = *(uint *)(iVar3 + 0xc);
        }
        else {
          uStack_20 = *(uint *)(iVar3 + 0x20) % *(uint *)(iVar3 + 0xc);
          if (uStack_20 == 0) {
            uStack_20 = *(uint *)(iVar3 + 0xc);
          }
        }
        pcVar2 = *(code **)(*(int *)(param_1 + 0x1a4) + 4 + iStack_14 * 4);
        iStack_1c = *(int *)(param_2 + iStack_14 * 4);
        iStack_18 = 0;
        if (0 < (int)uStack_20) {
          uVar8 = *(uint *)(iVar3 + 0x1c);
          do {
            iVar5 = *(int *)(iVar4 + iStack_18 * 4);
            iVar9 = 0;
            uVar7 = 0;
            if (uVar8 != 0) {
              do {
                (*pcVar2)(param_1,iVar3,iVar5,iStack_1c,iVar9);
                iVar9 = iVar9 + *(int *)(iVar3 + 0x24);
                uVar8 = *(uint *)(iVar3 + 0x1c);
                iVar5 = iVar5 + 0x80;
                uVar7 = uVar7 + 1;
              } while (uVar7 < uVar8);
            }
            iStack_1c = iStack_1c + *(int *)(iVar3 + 0x24) * 4;
            iStack_18 = iStack_18 + 1;
          } while (iStack_18 < (int)uStack_20);
        }
      }
      iStack_14 = iStack_14 + 1;
      puVar6 = puVar6 + 1;
      iVar3 = iVar3 + 0x54;
    } while (iStack_14 < *(int *)(param_1 + 0x2c));
  }
  uVar8 = *(int *)(param_1 + 0x90) + 1;
  *(uint *)(param_1 + 0x90) = uVar8;
  return 4 - (uint)(uVar8 < *(uint *)(param_1 + 0x124));
}


