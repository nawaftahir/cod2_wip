// 10032d10 size=87 FUN_10032d10

void FUN_10032d10(void)

{
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dx.flushGpuQuery->Issue( (1 << 0) )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d494c + 0x18))(DAT_101d494c,1);
  } while (DAT_1076a830 != 0);
  DAT_101d4958 = 1;
  return;
}


