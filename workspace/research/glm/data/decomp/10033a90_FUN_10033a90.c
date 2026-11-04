// 10033a90 size=128 FUN_10033a90

void FUN_10033a90(void)

{
  if (DAT_101d4810 == 3) {
    FUN_10032e80();
  }
  else if (DAT_101d4810 == 1) {
    FUN_10032cd0();
    FUN_10032d10();
  }
  DAT_101d492d = 1;
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dx.device->BeginScene()\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0xa4))(DAT_101d1bf8);
  } while (DAT_1076a830 != 0);
  DAT_1072ddb0 = DAT_1072ddb0 + 1;
  return;
}


