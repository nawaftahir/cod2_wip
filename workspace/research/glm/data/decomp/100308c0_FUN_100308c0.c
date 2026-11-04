// 100308c0 size=84 FUN_100308c0

void FUN_100308c0(void)

{
  if (*(int *)(DAT_101ce754 + 8) == 1) {
    FUN_10030190();
    return;
  }
  if (*(int *)(DAT_101ce708 + 8) != 2) {
    if (*(int *)(DAT_101ce754 + 8) == 2) {
      FUN_1002ff80();
      return;
    }
    if (*(char *)(DAT_101ce7b8 + 8) != '\0') {
      FUN_100302b0();
      return;
    }
    if (*(char *)(DAT_101ce790 + 8) != '\0') {
      FUN_100303c0();
    }
  }
  return;
}


