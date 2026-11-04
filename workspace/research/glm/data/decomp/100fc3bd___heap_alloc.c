// 100fc3bd size=111 __heap_alloc

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    __heap_alloc
   
   Library: Visual Studio 2003 Release */

void * __cdecl __heap_alloc(size_t _Size)

{
  void *pvVar1;
  LPVOID pvVar2;
  
  if ((DAT_1076ac98 == 3) && (_Size <= DAT_1076ac70)) {
    __lock(4);
    pvVar1 = (void *)___sbh_alloc_block(_Size);
    FUN_100fc42f();
    if (pvVar1 != (void *)0x0) {
      return pvVar1;
    }
  }
  if (_Size == 0) {
    _Size = 1;
  }
  if (DAT_1076ac98 != 1) {
    _Size = _Size + 0xf & 0xfffffff0;
  }
  pvVar2 = HeapAlloc(DAT_1076ac94,0,_Size);
  return pvVar2;
}


