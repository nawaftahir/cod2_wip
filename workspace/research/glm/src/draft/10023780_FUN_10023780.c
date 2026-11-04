extern unsigned int DAT_101a5a2c;
extern unsigned int DAT_10678510;
extern unsigned int DAT_10678ac4;
extern unsigned int DAT_10678ac8;
extern int FUN_10024380();


void FUN_10023780(int param_1,int *param_2,unsigned int param_3)

{
  int iVar1;
  int *piVar2;
  int *piVar3;
  int *piVar4;
  unsigned int *puVar5;
  
  piVar2 = (int *)(param_1 * 0x74 + DAT_10678510);
  piVar3 = param_2;
  piVar4 = piVar2;
  for (iVar1 = 0x1d; iVar1 != 0; iVar1 = iVar1 + -1) {
    *piVar4 = *piVar3;
    piVar3 = piVar3 + 1;
    piVar4 = piVar4 + 1;
  }
  if ((float)param_2[0xe] == 0.0) {
    piVar2[0xe] = 0x3f800000;
  }
  puVar5 = (unsigned int *)(&DAT_10678ac4 + param_1 * 0x34);
  for (iVar1 = 0xd; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar5 = 0;
    puVar5 = puVar5 + 1;
  }
  if (3 < *param_2) {
    FUN_10024380(&DAT_101a5a2c);
    return;
  }
  (&DAT_10678ac8)[param_1 * 0xd] = param_3;
  return;
}


