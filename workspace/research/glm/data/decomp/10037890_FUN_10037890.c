// 10037890 size=87 FUN_10037890

void FUN_10037890(void)

{
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    (*(code *)RI_Dvar_SetBool)(DAT_101ce7ec,*(int *)(DAT_101ce7ec + 8) + -1);
  }
  if (*(int *)(DAT_101ce7ec + 8) == 0) {
    if (DAT_10764584 != (FILE *)0x0) {
      _fclose(DAT_10764584);
      DAT_10764584 = (FILE *)0x0;
    }
    return;
  }
  FUN_10037810();
  return;
}


