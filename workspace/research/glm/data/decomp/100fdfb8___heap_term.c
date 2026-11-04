// 100fdfb8 size=127 __heap_term

/* Library Function - Single Match
    __heap_term
   
   Library: Visual Studio 2003 Release */

void __cdecl __heap_term(void)

{
  int iVar1;
  undefined4 *puVar2;
  
  if (DAT_1076ac98 == 3) {
    iVar1 = 0;
    if (0 < DAT_1076ac68) {
      puVar2 = (undefined4 *)((int)DAT_1076ac6c + 0xc);
      do {
        VirtualFree((LPVOID)*puVar2,0x100000,0x4000);
        VirtualFree((LPVOID)*puVar2,0,0x8000);
        HeapFree(DAT_1076ac94,0,(LPVOID)puVar2[1]);
        puVar2 = puVar2 + 5;
        iVar1 = iVar1 + 1;
      } while (iVar1 < DAT_1076ac68);
    }
    HeapFree(DAT_1076ac94,0,DAT_1076ac6c);
  }
  HeapDestroy(DAT_1076ac94);
  return;
}


