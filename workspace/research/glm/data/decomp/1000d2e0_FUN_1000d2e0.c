// 1000d2e0 size=58 FUN_1000d2e0

void FUN_1000d2e0(void)

{
  undefined4 *puVar1;
  uint uVar2;
  
  uVar2 = 0;
  do {
    puVar1 = *(undefined4 **)((int)&DAT_101cea68 + uVar2);
    if ((((puVar1 != (undefined4 *)0x0) && (4 < *(byte *)((int)puVar1 + 0x1e))) && (puVar1[1] == 0))
       && ((puVar1 < &DAT_101ce890 || ((undefined4 *)0x101cea63 < puVar1)))) {
      FUN_1000d0f0();
    }
    uVar2 = uVar2 + 4;
  } while (uVar2 < 0x2000);
  return;
}


