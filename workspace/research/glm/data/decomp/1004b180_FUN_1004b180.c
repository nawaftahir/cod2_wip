// 1004b180 size=359 FUN_1004b180

uint FUN_1004b180(void)

{
  undefined4 in_EAX;
  uint uVar1;
  undefined4 uVar2;
  short *psVar3;
  undefined4 *puVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int unaff_EDI;
  undefined1 local_5;
  
  uVar1 = CONCAT31((int3)((uint)in_EAX >> 8),*(char *)(unaff_EDI + 0xd0));
  iVar5 = *(int *)(unaff_EDI + 400);
  local_5 = 0;
  if ((*(char *)(unaff_EDI + 0xd0) == '\0') || (uVar1 = 0, *(int *)(unaff_EDI + 0x94) == 0)) {
    return uVar1 & 0xffffff00;
  }
  if (*(int *)(iVar5 + 0x70) == 0) {
    uVar2 = (*(code *)**(undefined4 **)(unaff_EDI + 4))();
    *(undefined4 *)(iVar5 + 0x70) = uVar2;
  }
  iVar5 = *(int *)(iVar5 + 0x70);
  puVar4 = *(undefined4 **)(unaff_EDI + 0xcc);
  iVar7 = 0;
  if (0 < *(int *)(unaff_EDI + 0x2c)) {
    iVar6 = 0;
    puVar4 = puVar4 + 0x13;
    do {
      psVar3 = (short *)*puVar4;
      if (((((psVar3 == (short *)0x0) || (*psVar3 == 0)) || (psVar3[1] == 0)) ||
          ((psVar3[8] == 0 || (psVar3[0x10] == 0)))) ||
         ((psVar3[9] == 0 ||
          ((psVar3[2] == 0 ||
           (psVar3 = (short *)(*(int *)(unaff_EDI + 0x94) + iVar6),
           *(int *)(*(int *)(unaff_EDI + 0x94) + iVar6) < 0)))))) {
        return (uint)psVar3 & 0xffffff00;
      }
      *(undefined4 *)(iVar5 + 4) = *(undefined4 *)(psVar3 + 2);
      if (*(int *)(psVar3 + 2) != 0) {
        local_5 = 1;
      }
      *(undefined4 *)(iVar5 + 8) = *(undefined4 *)(psVar3 + 4);
      if (*(int *)(psVar3 + 4) != 0) {
        local_5 = 1;
      }
      *(undefined4 *)(iVar5 + 0xc) = *(undefined4 *)(psVar3 + 6);
      if (*(int *)(psVar3 + 6) != 0) {
        local_5 = 1;
      }
      *(undefined4 *)(iVar5 + 0x10) = *(undefined4 *)(psVar3 + 8);
      if (*(int *)(psVar3 + 8) != 0) {
        local_5 = 1;
      }
      *(undefined4 *)(iVar5 + 0x14) = *(undefined4 *)(psVar3 + 10);
      if (*(int *)(psVar3 + 10) != 0) {
        local_5 = 1;
      }
      iVar5 = iVar5 + 0x18;
      iVar7 = iVar7 + 1;
      puVar4 = puVar4 + 0x15;
      iVar6 = iVar6 + 0x100;
    } while (iVar7 < *(int *)(unaff_EDI + 0x2c));
  }
  return CONCAT31((int3)((uint)puVar4 >> 8),local_5);
}


