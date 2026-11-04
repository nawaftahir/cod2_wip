// 1000d480 size=47 FUN_1000d480

void FUN_1000d480(void)

{
  undefined4 *puVar1;
  code *unaff_EBX;
  uint uVar2;
  
  uVar2 = 0;
  do {
    puVar1 = *(undefined4 **)((int)&DAT_101cea68 + uVar2);
    if ((puVar1 != (undefined4 *)0x0) &&
       ((puVar1 < &DAT_101ce890 || ((undefined4 *)0x101cea63 < puVar1)))) {
      (*unaff_EBX)(puVar1);
    }
    uVar2 = uVar2 + 4;
  } while (uVar2 < 0x2000);
  return;
}


