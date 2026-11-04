extern int FUN_100827da();
extern int FUN_100827f5();


unsigned int FUN_100834b8(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int *piVar5;
  unsigned char bVar6;
  unsigned long long uVar7;
  
  uVar7 = FUN_100827da(param_1);
  iVar2 = (int)((unsigned long long)uVar7 >> 0x20);
  if ((int)uVar7 != 0) {
    piVar4 = (int *)(iVar2 + 0x10);
    iVar1 = *piVar4;
    if (iVar1 == *(int *)(param_1 + 0x10)) {
      iVar3 = 4;
      bVar6 = true;
      piVar5 = (int *)(param_1 + 0x10);
      do {
        if (iVar3 == 0) break;
        iVar3 = iVar3 + -1;
        bVar6 = *piVar4 == *piVar5;
        piVar4 = piVar4 + 1;
        piVar5 = piVar5 + 1;
      } while (bVar6);
      if ((bVar6) ||
         ((iVar1 == 4 &&
          (iVar2 = FUN_100827f5(*(unsigned int *)(iVar2 + 0x18),*(unsigned int *)(param_1 + 0x18)),
          iVar2 != 0)))) {
        return 1;
      }
    }
  }
  return 0;
}


