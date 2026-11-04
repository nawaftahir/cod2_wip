// 101011ab size=43 ___sbh_find_block

/* Library Function - Single Match
    ___sbh_find_block
   
   Library: Visual Studio 2003 Release */

uint ___sbh_find_block(int param_1)

{
  uint uVar1;
  
  uVar1 = DAT_1076ac6c;
  while( true ) {
    if (DAT_1076ac6c + DAT_1076ac68 * 0x14 <= uVar1) {
      return 0;
    }
    if ((uint)(param_1 - *(int *)(uVar1 + 0xc)) < 0x100000) break;
    uVar1 = uVar1 + 0x14;
  }
  return uVar1;
}


