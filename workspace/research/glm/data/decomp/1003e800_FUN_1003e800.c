// 1003e800 size=150 FUN_1003e800

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003e800(float param_1,float param_2)

{
  if ((_DAT_10766740 != param_1) || (_DAT_10766744 != param_2)) {
    _DAT_10766740 = param_1;
    _DAT_10766744 = param_2;
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","dx.device->SetViewport( &dxState.viewport )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xbc))(DAT_101d1bf8,&DAT_10766730);
    } while (DAT_1076a830 != 0);
  }
  return;
}


