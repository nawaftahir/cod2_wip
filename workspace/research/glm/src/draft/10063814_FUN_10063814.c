extern unsigned int DAT_1010c228;
extern unsigned char UNK[1];


unsigned int FUN_10063814(unsigned int param_1,unsigned int param_2,unsigned int *param_3)

{
  unsigned int *puVar1;
  char *pcVar2;
  int iVar3;
  
  iVar3 = 0x2c;
  pcVar2 = "vs_3_0";
  while( true ) {
    puVar1 = (unsigned int *)((int)pcVar2 + -0x10);
    pcVar2 = (char *)((int)pcVar2 + -0xc);
    iVar3 = iVar3 + -1;
    if ((*puVar1 == param_1) && ((*(unsigned int *)pcVar2 & param_2) == param_2)) break;
    if (pcVar2 < &UNK_1010c229) {
      return 0x80004005;
    }
  }
  if (param_3 != (unsigned int *)0x0) {
    iVar3 = iVar3 * 0xc;
    *param_3 = *(unsigned int *)(&UNK_1010c220 + iVar3);
    param_3[1] = *(unsigned int *)(&UNK_1010c224 + iVar3);
    param_3[2] = *(unsigned int *)(&DAT_1010c228 + iVar3);
  }
  return 0;
}


