// 1004a500 size=204 FUN_1004a500

uint FUN_1004a500(void)

{
  uint *puVar1;
  uint uVar2;
  int iVar3;
  undefined3 uVar6;
  uint uVar4;
  undefined4 uVar5;
  int unaff_ESI;
  
  iVar3 = *(int *)(unaff_ESI + 0x14);
  if (iVar3 != 0xcc) {
    iVar3 = (*(code *)**(undefined4 **)(unaff_ESI + 0x188))();
    *(undefined4 *)(unaff_ESI + 0x80) = 0;
    *(undefined4 *)(unaff_ESI + 0x14) = 0xcc;
  }
  uVar6 = (undefined3)((uint)iVar3 >> 8);
  if (*(char *)(*(int *)(unaff_ESI + 0x188) + 8) != '\0') {
    puVar1 = (uint *)(unaff_ESI + 0x80);
    do {
      uVar4 = *puVar1;
      if (uVar4 < *(uint *)(unaff_ESI + 0x68)) {
        do {
          if (*(int *)(unaff_ESI + 8) != 0) {
            *(uint *)(*(int *)(unaff_ESI + 8) + 4) = uVar4;
            *(undefined4 *)(*(int *)(unaff_ESI + 8) + 8) = *(undefined4 *)(unaff_ESI + 0x68);
            (*(code *)**(undefined4 **)(unaff_ESI + 8))();
          }
          uVar2 = *puVar1;
          (**(code **)(*(int *)(unaff_ESI + 0x18c) + 4))();
          uVar4 = *puVar1;
          if (uVar4 == uVar2) {
            return uVar4 & 0xffffff00;
          }
        } while (uVar4 < *(uint *)(unaff_ESI + 0x68));
      }
      (**(code **)(*(int *)(unaff_ESI + 0x188) + 4))();
      uVar5 = (*(code *)**(undefined4 **)(unaff_ESI + 0x188))();
      *puVar1 = 0;
      uVar6 = (undefined3)((uint)uVar5 >> 8);
    } while (*(char *)(*(int *)(unaff_ESI + 0x188) + 8) != '\0');
  }
  *(uint *)(unaff_ESI + 0x14) = (*(char *)(unaff_ESI + 0x49) != '\0') + 0xcd;
  return CONCAT31(uVar6,1);
}


