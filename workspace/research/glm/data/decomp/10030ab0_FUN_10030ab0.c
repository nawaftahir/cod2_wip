// 10030ab0 size=172 FUN_10030ab0

void FUN_10030ab0(float param_1)

{
  if (DAT_10730558 == 0xe) {
    FUN_1002eaa0();
    DAT_10730558 = 2;
  }
  if ((((*(int *)(DAT_101ce708 + 8) != 2) && (DAT_101d496d != '\0')) &&
      (*(char *)(DAT_101ce71c + 8) != '\0')) && (*(char *)(DAT_101ce6d0 + 8) == '\0')) {
    FUN_100306b0();
    FUN_1003ea30();
    FUN_10030580();
  }
  if ((*(int *)(DAT_101ce708 + 8) != 2) && ((0.0 < *(float *)(DAT_101ce7a4 + 8) || (0.0 < param_1)))
     ) {
    FUN_10030710(SQRT(param_1 * param_1 +
                      *(float *)(DAT_101ce7a4 + 8) * *(float *)(DAT_101ce7a4 + 8)));
  }
  return;
}


