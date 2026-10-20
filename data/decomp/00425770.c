
undefined4 * FUN_00425770(void)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined1 *puVar3;
  int iVar4;
  int iVar5;
  undefined4 *puVar6;
  
  puVar1 = (undefined4 *)FUN_004ff450(0x3838);
  *puVar1 = 0;
  puVar1[1] = 0;
  puVar1[2] = 0;
  puVar1[4] = 0;
  puVar1[0xe0d] = 0;
  puVar1[5] = 8;
  uVar2 = FUN_00440840();
  puVar1[6] = uVar2;
  uVar2 = FUN_00440840();
  puVar1[7] = uVar2;
  puVar6 = puVar1 + 9;
  for (iVar4 = 0xe00; iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  puVar3 = (undefined1 *)((int)puVar1 + 0x4d);
  iVar4 = 0x10;
  do {
    iVar5 = 0x10;
    do {
      puVar3[1] = 0xff;
      *puVar3 = 0xff;
      puVar3[-1] = 0xff;
      puVar3[2] = 0xff;
      puVar3 = puVar3 + 0x38;
      iVar5 = iVar5 + -1;
    } while (iVar5 != 0);
    iVar4 = iVar4 + -1;
  } while (iVar4 != 0);
  puVar1[0xe09] = 0;
  puVar1[0xe0a] = 0;
  *(undefined2 *)(puVar1 + 0xe0b) = 0;
  *(undefined1 *)((int)puVar1 + 0x382e) = 0;
  return puVar1;
}

