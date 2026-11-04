// 100fd65c size=106 __cinit

/* Library Function - Single Match
    __cinit
   
   Library: Visual Studio 2003 Release */

int __cdecl __cinit(int param_1)

{
  int iVar1;
  undefined4 *puVar2;
  
  if (PTR___fpmath_101a461c != (undefined *)0x0) {
    (*(code *)PTR___fpmath_101a461c)(param_1);
  }
  iVar1 = 0;
  puVar2 = &DAT_1019e00c;
  do {
    if (iVar1 != 0) {
      return iVar1;
    }
    if ((code *)*puVar2 != (code *)0x0) {
      iVar1 = (*(code *)*puVar2)();
    }
    puVar2 = puVar2 + 1;
  } while (puVar2 < &DAT_1019e020);
  if (iVar1 == 0) {
    _atexit((_func_4879 *)&LAB_100fdf09);
    puVar2 = &DAT_1019e000;
    do {
      if ((code *)*puVar2 != (code *)0x0) {
        (*(code *)*puVar2)();
      }
      puVar2 = puVar2 + 1;
    } while (puVar2 < &DAT_1019e008);
    iVar1 = 0;
  }
  return iVar1;
}


