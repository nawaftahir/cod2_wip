// 1004dc50 size=164 FUN_1004dc50

undefined4 FUN_1004dc50(void)

{
  undefined1 *puVar1;
  int iVar2;
  int *unaff_ESI;
  
  *(undefined4 *)(*unaff_ESI + 0x14) = 0x66;
  (**(code **)(*unaff_ESI + 4))();
  if (*(char *)(unaff_ESI[0x67] + 0xc) != '\0') {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x3d;
    (**(code **)*unaff_ESI)();
  }
  puVar1 = (undefined1 *)((int)unaff_ESI + 0xe2);
  iVar2 = 0x10;
  do {
    puVar1[-0x10] = 0;
    *puVar1 = 1;
    puVar1[0x10] = 5;
    puVar1 = puVar1 + 1;
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  unaff_ESI[0x41] = 0;
  unaff_ESI[0xc] = 0;
  *(undefined1 *)((int)unaff_ESI + 0x112) = 0;
  *(undefined1 *)(unaff_ESI + 0x42) = 0;
  *(undefined1 *)((int)unaff_ESI + 0x10b) = 0;
  *(undefined1 *)(unaff_ESI + 0x44) = 0;
  *(undefined1 *)((int)unaff_ESI + 0x111) = 0;
  *(undefined1 *)((int)unaff_ESI + 0x109) = 1;
  *(undefined1 *)((int)unaff_ESI + 0x10a) = 1;
  *(undefined2 *)(unaff_ESI + 0x43) = 1;
  *(undefined2 *)((int)unaff_ESI + 0x10e) = 1;
  *(undefined1 *)(unaff_ESI[0x67] + 0xc) = 1;
  return CONCAT31((int3)((uint)puVar1 >> 8),1);
}


