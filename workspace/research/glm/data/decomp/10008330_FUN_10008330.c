// 10008330 size=112 FUN_10008330

void FUN_10008330(void)

{
  int unaff_EBX;
  int *piVar1;
  int iVar2;
  undefined *puVar3;
  
  if (DAT_101ce5ef != '\0') {
    iVar2 = unaff_EBX * 0x34;
    piVar1 = (int *)(unaff_EBX * 0x74 + DAT_10678510);
    puVar3 = &DAT_10678ac4 + iVar2;
    FUN_1001ffc0(puVar3);
    if (*piVar1 == 1) {
      FUN_1001f6f0(puVar3,piVar1,0xffffffff);
      *(undefined4 *)(&DAT_10678ad0 + iVar2) = 5;
      FUN_10024680();
      return;
    }
    FUN_1001fa70(puVar3,piVar1);
    *(undefined4 *)(&DAT_10678ad0 + iVar2) = 5;
    FUN_10024680();
  }
  return;
}


