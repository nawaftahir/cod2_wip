// 10011e60 size=160 FUN_10011e60

void FUN_10011e60(void)

{
  int *piVar1;
  int *piVar2;
  undefined4 *puVar3;
  
  piVar1 = DAT_101d4978;
  while (piVar2 = DAT_101d49a0, piVar1 != (int *)0x0) {
    (**(code **)(*DAT_101d4978 + 8))(DAT_101d4978);
    DAT_101d4978 = (int *)0x0;
    piVar1 = DAT_1076a830;
  }
  while (piVar2 != (int *)0x0) {
    (**(code **)(*DAT_101d49a0 + 8))(DAT_101d49a0);
    DAT_101d49a0 = (int *)0x0;
    piVar2 = DAT_1076a830;
  }
  puVar3 = &DAT_101d4988;
  do {
    piVar1 = (int *)*puVar3;
    while (piVar1 != (int *)0x0) {
      (**(code **)(*(int *)*puVar3 + 8))((int *)*puVar3);
      piVar1 = DAT_1076a830;
      *puVar3 = 0;
    }
    puVar3 = puVar3 + 3;
  } while ((int **)puVar3 != &DAT_101d49a0);
  if (DAT_101d49c0 != 0) {
    (*(code *)RI_Z_VirtualFreeInternal)(DAT_101d49c0);
    DAT_101d49c0 = 0;
    DAT_101d49c4 = 0;
  }
  return;
}


