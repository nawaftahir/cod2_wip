extern unsigned int DAT_101ce890;
extern unsigned int DAT_101cea68;
extern int FUN_1000d0f0();


void FUN_1000d2e0(void)

{
  unsigned int *puVar1;
  unsigned int uVar2;
  
  uVar2 = 0;
  do {
    puVar1 = *(unsigned int **)((int)&DAT_101cea68 + uVar2);
    if ((((puVar1 != (unsigned int *)0x0) && (4 < *(byte *)((int)puVar1 + 0x1e))) && (puVar1[1] == 0))
       && ((puVar1 < &DAT_101ce890 || ((unsigned int *)0x101cea63 < puVar1)))) {
      FUN_1000d0f0();
    }
    uVar2 = uVar2 + 4;
  } while (uVar2 < 0x2000);
  return;
}


