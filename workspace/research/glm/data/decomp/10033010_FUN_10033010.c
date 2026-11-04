// 10033010 size=114 FUN_10033010

void FUN_10033010(LARGE_INTEGER *param_1)

{
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dx.device->EndScene()\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0xa8))(DAT_101d1bf8);
  } while (DAT_1076a830 != 0);
  DAT_101d492d = 0;
  FUN_10032cd0();
  FUN_10032d10();
  FUN_10032cd0();
  QueryPerformanceCounter(param_1);
  return;
}


