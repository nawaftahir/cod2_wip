// 10106cca size=41 setSBCS

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Library Function - Single Match
    _setSBCS
   
   Library: Visual Studio 2003 Release */

void __cdecl setSBCS(void)

{
  int iVar1;
  undefined4 *puVar2;
  
  puVar2 = (undefined4 *)&DAT_1076aa40;
  for (iVar1 = 0x40; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  *(undefined1 *)puVar2 = 0;
  DAT_1076ab44 = 0;
  DAT_1076aa38 = 0;
  DAT_1076aa30 = 0;
  _DAT_1076ab50 = 0;
  DAT_1076ab54 = 0;
  DAT_1076ab58 = 0;
  return;
}


