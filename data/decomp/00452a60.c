
void FUN_00452a60(void)

{
  FUN_00449c90();
  if ((DAT_0109fe34 != &DAT_0109fe30) && (DAT_0109fe0c != &DAT_0109fe08)) {
    FUN_0046fb30();
    FUN_00449ff0(&DAT_0109fe30);
    FUN_00449ff0(&DAT_0109fe08);
    FUN_00449c60();
    FUN_00449c60();
    if (DAT_0109fe5d != '\0') {
      FUN_0044abf0();
      DAT_0109fe5d = 0;
      return;
    }
    FUN_0044abf0();
    DAT_0109fe5d = '\0';
  }
  return;
}

