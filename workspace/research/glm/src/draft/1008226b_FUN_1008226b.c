extern unsigned int DAT_10118028;
extern unsigned int DAT_1017c3c4;


unsigned int FUN_1008226b(int *param_1,int *param_2,unsigned int *param_3)

{
  int iVar1;
  int *piVar2;
  int *piVar3;
  unsigned char bVar4;
  
  iVar1 = 4;
  bVar4 = true;
  piVar2 = param_2;
  piVar3 = &DAT_10118028;
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar4 = *piVar2 == *piVar3;
    piVar2 = piVar2 + 1;
    piVar3 = piVar3 + 1;
  } while (bVar4);
  if (!bVar4) {
    iVar1 = 4;
    bVar4 = true;
    piVar2 = &DAT_1017c3c4;
    do {
      if (iVar1 == 0) break;
      iVar1 = iVar1 + -1;
      bVar4 = *param_2 == *piVar2;
      param_2 = param_2 + 1;
      piVar2 = piVar2 + 1;
    } while (bVar4);
    if (!bVar4) {
      return 0x80004002;
    }
  }
  *param_3 = param_1;
  (**(void **)(*param_1 + 4))(param_1);
  return 0;
}


