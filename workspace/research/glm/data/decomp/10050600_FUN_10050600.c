// 10050600 size=120 FUN_10050600

void FUN_10050600(void)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  int unaff_EDI;
  
  puVar1 = (undefined4 *)(*(code *)**(undefined4 **)(unaff_EDI + 4))();
  *(undefined4 **)(unaff_EDI + 0x1a8) = puVar1;
  *puVar1 = &LAB_10050150;
  *(undefined1 *)(puVar1 + 2) = 0;
  puVar1[10] = *(int *)(unaff_EDI + 0x6c) * *(int *)(unaff_EDI + 100);
  if (*(int *)(unaff_EDI + 0x11c) == 2) {
    puVar1[1] = &LAB_10050170;
    puVar1[3] = FUN_100503d0;
    uVar2 = (**(code **)(*(int *)(unaff_EDI + 4) + 4))();
    puVar1[8] = uVar2;
    FUN_10050080();
    return;
  }
  puVar1[8] = 0;
  puVar1[1] = &LAB_10050240;
  puVar1[3] = FUN_10050280;
  FUN_10050080();
  return;
}


