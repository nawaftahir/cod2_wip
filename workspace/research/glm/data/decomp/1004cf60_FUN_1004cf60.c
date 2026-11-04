// 1004cf60 size=62 FUN_1004cf60

void FUN_1004cf60(void)

{
  undefined4 *puVar1;
  int unaff_ESI;
  
  puVar1 = (undefined4 *)(*(code *)**(undefined4 **)(unaff_ESI + 4))();
  *(undefined4 **)(unaff_ESI + 0x1a0) = puVar1;
  *puVar1 = &LAB_1004c490;
  puVar1[1] = &LAB_1004cb30;
  puVar1[0xe] = 0;
  puVar1[10] = 0;
  puVar1[0xf] = 0;
  puVar1[0xb] = 0;
  puVar1[0x10] = 0;
  puVar1[0xc] = 0;
  puVar1[0x11] = 0;
  puVar1[0xd] = 0;
  return;
}


