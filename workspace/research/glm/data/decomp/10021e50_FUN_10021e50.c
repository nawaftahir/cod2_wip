// 10021e50 size=378 FUN_10021e50

void FUN_10021e50(void)

{
  char cVar1;
  int iVar2;
  undefined4 unaff_ESI;
  bool bVar3;
  bool bVar4;
  undefined4 uVar5;
  
  cVar1 = FUN_10021c80();
  if (cVar1 != '\0') {
    FUN_100013d0();
  }
  if ((((*(char *)(DAT_101ce694 + 7) != '\0') &&
       ((*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce694), *(int *)(DAT_101ce708 + 8) != 2)) &&
      (*(char *)(DAT_101ce694 + 8) != '\0')) && (DAT_101d489c == 0)) {
    (*(code *)RI_Printf)
              (0,
               "Because r_zFeather was 0 during renderer initialization,\nyou must do a vid_restart with r_zFeather set to 1 to see it.\n"
              );
  }
  if ((*(char *)(DAT_101ce7c0 + 8) != '\0') && (DAT_101d1b9c != 0)) {
    FUN_10028cd0();
  }
  bVar3 = *(char *)(DAT_101ce6c8 + 7) != '\0';
  if (bVar3) {
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce6c8);
  }
  bVar4 = *(char *)(DAT_101ce6b0 + 7) != '\0';
  if (bVar4) {
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce6b0);
  }
  iVar2 = DAT_101ce6b0;
  if (bVar4 || bVar3) {
    if (*(char *)(DAT_101ce6b0 + 8) == '\0') {
      iVar2 = *(int *)(DAT_101ce6c8 + 8);
      DAT_101d4810 = iVar2;
    }
    else {
      DAT_101d4810 = 0;
    }
  }
  if (*(int *)(DAT_101ce7e8 + 8) == *(int *)(DAT_101ce7e8 + 0x10)) {
    (*(code *)RI_XModelGetNumLods)(0,*(undefined4 *)(DAT_101ce7e4 + 8),iVar2);
    (*(code *)RI_XModelGetNumLods)(1,*(undefined4 *)(DAT_101ce724 + 8));
    (*(code *)RI_XModelGetNumLods)(2,*(undefined4 *)(DAT_101ce69c + 8));
    (*(code *)RI_XModelGetNumLods)(3,*(undefined4 *)(DAT_101ce630 + 8));
    return;
  }
  iVar2 = 0;
  do {
    uVar5 = 0;
    if (iVar2 != *(int *)(DAT_101ce7e8 + 8)) {
      uVar5 = 0x3a83126f;
    }
    (*(code *)RI_XModelGetNumLods)(iVar2,uVar5,unaff_ESI);
    iVar2 = iVar2 + 1;
  } while (iVar2 < 4);
  return;
}


