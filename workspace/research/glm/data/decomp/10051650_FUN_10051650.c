// 10051650 size=131 FUN_10051650

void FUN_10051650(char param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  int unaff_ESI;
  
  puVar1 = (undefined4 *)(*(code *)**(undefined4 **)(unaff_ESI + 4))();
  *(undefined4 **)(unaff_ESI + 0x194) = puVar1;
  *puVar1 = &LAB_10051390;
  puVar1[2] = 0;
  puVar1[3] = 0;
  if (*(char *)(unaff_ESI + 0x52) != '\0') {
    puVar1[4] = *(undefined4 *)(unaff_ESI + 0x11c);
    if (param_1 != '\0') {
      uVar2 = (**(code **)(*(int *)(unaff_ESI + 4) + 0x10))();
      puVar1[2] = uVar2;
      return;
    }
    uVar2 = (**(code **)(*(int *)(unaff_ESI + 4) + 8))();
    puVar1[3] = uVar2;
  }
  return;
}


