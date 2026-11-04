// 10024c80 size=261 FUN_10024c80

void FUN_10024c80(void)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  undefined2 *puVar5;
  undefined4 uVar6;
  
  FUN_10021b50(DAT_10678500);
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if (0x30000 - iVar2 < 8) {
    puVar5 = (undefined2 *)0x0;
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
  }
  else {
    puVar5 = (undefined2 *)(iVar2 + DAT_1042e778);
    *(int *)(DAT_1042e778 + 0x30000) = iVar2 + 8;
    piVar1 = (int *)(iVar3 + 0x30004);
    *piVar1 = *piVar1 + 8;
    *(undefined2 **)(iVar3 + 0x30008) = puVar5;
    *puVar5 = 0xe;
    puVar5[1] = 8;
  }
  *(undefined4 *)(puVar5 + 2) = 0;
  if ((((DAT_101d4818 == 0) || (*(int *)(DAT_101ce708 + 8) == 2)) ||
      (*(char *)(DAT_101ce694 + 8) == '\0')) || (uVar6 = 1, DAT_101d489c == 0)) {
    uVar6 = 7;
  }
  uVar4 = FUN_10024920();
  R_BlendSavedScreen(uVar6,uVar4,0x3f800000,0);
  FUN_10021770(0);
  FUN_10021890();
  FUN_10021890();
  FUN_10021920();
  FUN_10021890();
  return;
}


