// 10063814 size=79 FUN_10063814

undefined4 FUN_10063814(uint param_1,uint param_2,undefined4 *param_3)

{
  uint *puVar1;
  char *pcVar2;
  int iVar3;
  
  iVar3 = 0x2c;
  pcVar2 = "vs_3_0";
  while( true ) {
    puVar1 = (uint *)((int)pcVar2 + -0x10);
    pcVar2 = (char *)((int)pcVar2 + -0xc);
    iVar3 = iVar3 + -1;
    if ((*puVar1 == param_1) && ((*(uint *)pcVar2 & param_2) == param_2)) break;
    if (pcVar2 < &UNK_1010c229) {
      return 0x80004005;
    }
  }
  if (param_3 != (undefined4 *)0x0) {
    iVar3 = iVar3 * 0xc;
    *param_3 = *(undefined4 *)(&UNK_1010c220 + iVar3);
    param_3[1] = *(undefined4 *)(&UNK_1010c224 + iVar3);
    param_3[2] = *(undefined4 *)(&DAT_1010c228 + iVar3);
  }
  return 0;
}


