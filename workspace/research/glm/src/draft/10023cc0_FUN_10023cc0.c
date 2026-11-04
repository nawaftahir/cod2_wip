extern unsigned int DAT_10678510;
extern unsigned int DAT_10678ac4;
extern unsigned int DAT_10678ac8;
extern unsigned int DAT_10678acc;
extern int FUN_10008330();
extern int FUN_10023af0();


int * FUN_10023cc0(int *param_1,unsigned int param_2,unsigned int param_3)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int *piVar4;
  int *piVar5;
  unsigned int *puVar6;
  
  iVar1 = FUN_10023af0();
  if (iVar1 < 0) {
    return (int *)0x0;
  }
  piVar3 = (int *)(iVar1 * 0x74 + DAT_10678510);
  piVar4 = param_1;
  piVar5 = piVar3;
  for (iVar2 = 0x1d; iVar2 != 0; iVar2 = iVar2 + -1) {
    *piVar5 = *piVar4;
    piVar4 = piVar4 + 1;
    piVar5 = piVar5 + 1;
  }
  if ((float)param_1[0xe] == 0.0) {
    piVar3[0xe] = 0x3f800000;
  }
  puVar6 = (unsigned int *)(&DAT_10678ac4 + iVar1 * 0x34);
  for (iVar2 = 0xd; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  (&DAT_10678ac8)[iVar1 * 0xd] = param_2;
  *(unsigned int *)(&DAT_10678acc + iVar1 * 0x34) = param_3;
  if (*param_1 == 1) {
    FUN_10008330();
  }
  return piVar3;
}


