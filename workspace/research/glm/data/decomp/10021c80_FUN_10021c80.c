// 10021c80 size=225 FUN_10021c80

bool FUN_10021c80(void)

{
  bool bVar1;
  bool bVar2;
  bool bVar3;
  bool bVar4;
  bool bVar5;
  bool bVar6;
  
  if (DAT_101d1b9c == 0) {
    return false;
  }
  bVar1 = *(char *)(DAT_101ce73c + 7) != '\0';
  if (bVar1) {
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce73c);
  }
  bVar2 = *(char *)(DAT_101ce5fc + 7) != '\0';
  if (bVar2) {
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce5fc);
  }
  bVar3 = *(char *)(DAT_101ce604 + 7) != '\0';
  if (bVar3) {
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce604);
  }
  bVar4 = *(char *)(DAT_101ce6d8 + 7) != '\0';
  if (bVar4) {
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce6d8);
  }
  bVar5 = *(char *)(DAT_101ce778 + 7) != '\0';
  if (bVar5) {
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce778);
  }
  bVar6 = *(char *)(DAT_101ce768 + 7) != '\0';
  if (bVar6) {
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce768);
  }
  if (*(char *)(DAT_101ce728 + 7) != '\0') {
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce728);
    return true;
  }
  return ((((bVar1 || bVar2) || bVar3) || bVar4) || bVar5) || bVar6;
}


