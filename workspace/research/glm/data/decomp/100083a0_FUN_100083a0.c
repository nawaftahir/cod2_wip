// 100083a0 size=288 FUN_100083a0

void FUN_100083a0(void)

{
  int *piVar1;
  char cVar2;
  int in_EAX;
  int *piVar3;
  int iVar4;
  undefined *puVar5;
  
  piVar1 = *(int **)(in_EAX + 0x38);
  do {
    if (piVar1 == (int *)0x0) {
      return;
    }
    iVar4 = *piVar1 * 0x34;
    puVar5 = &DAT_10678ac4 + iVar4;
    if (*(int *)(&DAT_10678ad0 + iVar4) != 5) {
      piVar3 = (int *)(*piVar1 * 0x74 + DAT_10678510);
      if (*piVar3 < 2) {
        if (DAT_101ce5ef != '\0') {
          if (*(int *)(&DAT_10678ad0 + iVar4) < 2) {
            cVar2 = FUN_100063e0();
            if (cVar2 != '\0') goto LAB_100084af;
            (*(code *)RI_DObjCalcAnim)(*(undefined4 *)(&DAT_10678acc + iVar4));
            FUN_1001ffc0(puVar5);
          }
          cVar2 = FUN_100063e0();
          if (cVar2 == '\0') {
            (*(code *)RI_DObjCalcSkel)(*(undefined4 *)(&DAT_10678acc + iVar4));
            if (*piVar3 == 1) {
              FUN_1001f6f0(puVar5,piVar3,0xffffffff);
              *(undefined4 *)(&DAT_10678ad0 + iVar4) = 5;
              FUN_10024680(*piVar1);
            }
            else {
              FUN_1001fa70(puVar5,piVar3);
              *(undefined4 *)(&DAT_10678ad0 + iVar4) = 5;
              FUN_10024680(*piVar1);
            }
          }
        }
      }
      else if (((*piVar3 == 3) && (DAT_101ce5f0 != '\0')) && (cVar2 = FUN_100063e0(), cVar2 == '\0')
              ) {
        FUN_10024610(*piVar1);
      }
    }
LAB_100084af:
    piVar1 = (int *)piVar1[7];
  } while( true );
}


