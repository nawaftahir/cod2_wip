extern unsigned int DAT_101d7fd4;
extern unsigned int DAT_1076a830;
extern int FUN_10038590();


void FUN_10017470(void)

{
  int iVar1;
  int *piVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  
  FUN_10038590();
  piVar2 = &DAT_101d7fd4;
  iVar3 = 0x20;
  do {
    iVar5 = 4;
    piVar4 = piVar2;
    do {
      iVar1 = *piVar4;
      while (iVar1 != 0) {
        (**(void **)(*(int *)*piVar4 + 8))((int *)*piVar4);
        iVar1 = DAT_1076a830;
        *piVar4 = 0;
      }
      piVar4 = piVar4 + 1;
      iVar5 = iVar5 + -1;
    } while (iVar5 != 0);
    piVar2 = piVar2 + 6;
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  return;
}


