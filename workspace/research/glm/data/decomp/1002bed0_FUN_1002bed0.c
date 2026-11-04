// 1002bed0 size=115 FUN_1002bed0

uint FUN_1002bed0(void)

{
  undefined1 *puVar1;
  uint uVar2;
  uint uVar3;
  undefined1 *puStack_10;
  undefined1 *puStack_c;
  undefined1 *puStack_8;
  undefined1 *local_4;
  
  puStack_8 = (undefined1 *)0x1002bed8;
  puStack_8 = (undefined1 *)FUN_1002bd20();
  puStack_10 = puStack_8;
  if (puStack_8 == (undefined1 *)0x0) {
    puStack_10 = &LAB_1002bda0;
    puStack_c = (undefined1 *)&local_4;
    local_4 = puStack_8;
    DirectDrawEnumerateExA();
    if ((puStack_10 == (undefined1 *)0x0) &&
       (puStack_10 = (undefined1 *)FUN_1002bdd0(), puStack_10 == (undefined1 *)0x0)) {
      puVar1 = &LAB_1002beb0;
      DirectDrawEnumerateExA(&LAB_1002beb0,&puStack_10,0);
      puStack_10 = puVar1;
      if (puStack_10 == (undefined1 *)0x0) {
        return 0;
      }
    }
  }
  uVar3 = ((uint)(puStack_10 + -1) >> 0x14) + 1;
  uVar2 = 1;
  if (1 < uVar3) {
    do {
      uVar2 = uVar2 << 1;
    } while (uVar2 < uVar3);
  }
  if (0x20 < uVar2 - uVar3) {
    uVar2 = (int)uVar2 >> 1;
  }
  return uVar2;
}


