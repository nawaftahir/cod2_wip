// 101014ee size=183 ___sbh_alloc_new_region

/* Library Function - Single Match
    ___sbh_alloc_new_region
   
   Library: Visual Studio 2003 Release */

undefined4 * ___sbh_alloc_new_region(void)

{
  undefined4 *puVar1;
  LPVOID pvVar2;
  
  if (DAT_1076ac68 == DAT_1076ac78) {
    pvVar2 = HeapReAlloc(DAT_1076ac94,0,DAT_1076ac6c,(DAT_1076ac78 * 5 + 0x50) * 4);
    if (pvVar2 == (LPVOID)0x0) {
      return (undefined4 *)0x0;
    }
    DAT_1076ac78 = DAT_1076ac78 + 0x10;
    DAT_1076ac6c = pvVar2;
  }
  puVar1 = (undefined4 *)((int)DAT_1076ac6c + DAT_1076ac68 * 0x14);
  pvVar2 = HeapAlloc(DAT_1076ac94,8,0x41c4);
  puVar1[4] = pvVar2;
  if (pvVar2 != (LPVOID)0x0) {
    pvVar2 = VirtualAlloc((LPVOID)0x0,0x100000,0x2000,4);
    puVar1[3] = pvVar2;
    if (pvVar2 != (LPVOID)0x0) {
      puVar1[2] = 0xffffffff;
      *puVar1 = 0;
      puVar1[1] = 0;
      DAT_1076ac68 = DAT_1076ac68 + 1;
      *(undefined4 *)puVar1[4] = 0xffffffff;
      return puVar1;
    }
    HeapFree(DAT_1076ac94,0,(LPVOID)puVar1[4]);
  }
  return (undefined4 *)0x0;
}


