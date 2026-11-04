// 10101163 size=72 ___sbh_heap_init

/* Library Function - Single Match
    ___sbh_heap_init
   
   Library: Visual Studio 2003 Release */

undefined4 ___sbh_heap_init(undefined4 param_1)

{
  DAT_1076ac6c = HeapAlloc(DAT_1076ac94,0,0x140);
  if (DAT_1076ac6c == (LPVOID)0x0) {
    return 0;
  }
  DAT_1076ac64 = 0;
  DAT_1076ac68 = 0;
  DAT_1076ac74 = DAT_1076ac6c;
  DAT_1076ac70 = param_1;
  DAT_1076ac78 = 0x10;
  return 1;
}


