// 10012210 size=269 FUN_10012210

void FUN_10012210(void)

{
  undefined4 uVar1;
  int *piVar2;
  int *piVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  int iVar6;
  int iVar7;
  bool bVar8;
  
  iVar6 = 0;
  if (0 < DAT_101d4938) {
    puVar4 = &DAT_101d4940;
    do {
      do {
        (**(code **)(*(int *)*puVar4 + 8))((int *)*puVar4);
        bVar8 = DAT_1076a830 != (int *)0x0;
        *puVar4 = 0;
      } while (bVar8);
      iVar6 = iVar6 + 1;
      puVar4 = puVar4 + 4;
    } while (iVar6 < DAT_101d4938);
  }
  FUN_10023560();
  FUN_1002baf0();
  piVar2 = DAT_101d49b4;
  while (piVar2 != (int *)0x0) {
    (**(code **)(*DAT_101d49b4 + 8))(DAT_101d49b4);
    DAT_101d49b4 = (int *)0x0;
    piVar2 = DAT_1076a830;
  }
  FUN_10011e60();
  piVar2 = DAT_101d49a8;
  if (DAT_101d49a8 != (int *)0x0) {
    do {
      (**(code **)(*piVar2 + 8))(piVar2);
      piVar2 = (int *)0x0;
    } while (DAT_1076a830 != (int *)0x0);
    DAT_101d49a8 = (int *)0x0;
  }
  piVar3 = DAT_101d49ac;
  uVar1 = 0;
  piVar2 = DAT_101d494c;
  if (DAT_101d49ac != (int *)0x0) {
    do {
      (**(code **)(*piVar3 + 8))(piVar3);
      piVar3 = (int *)0x0;
    } while (DAT_1076a830 != (int *)0x0);
    DAT_101d49ac = (int *)0x0;
    DAT_1076a830 = (int *)0x0;
    uVar1 = DAT_101d49ac;
    piVar2 = DAT_101d494c;
  }
  while (DAT_101d49ac = (int *)uVar1, piVar2 != (int *)0x0) {
    (**(code **)(*DAT_101d494c + 8))(DAT_101d494c);
    DAT_101d494c = (int *)0x0;
    uVar1 = DAT_101d49ac;
    piVar2 = DAT_1076a830;
  }
  puVar4 = &DAT_107645b4;
  iVar6 = 4;
  do {
    iVar7 = 2;
    puVar5 = puVar4;
    do {
      piVar2 = (int *)*puVar5;
      while (piVar2 != (int *)0x0) {
        (**(code **)(*(int *)*puVar5 + 8))((int *)*puVar5);
        piVar2 = DAT_1076a830;
        *puVar5 = 0;
      }
      puVar5 = puVar5 + 1;
      iVar7 = iVar7 + -1;
    } while (iVar7 != 0);
    puVar4 = puVar4 + 0xc;
    iVar6 = iVar6 + -1;
  } while (iVar6 != 0);
  return;
}


