extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_10764584;
extern unsigned int DAT_10766730;
extern unsigned int DAT_1076a830;


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003e800(float param_1,float param_2)

{
  if ((_DAT_10766740 != param_1) || (_DAT_10766744 != param_2)) {
    _DAT_10766740 = param_1;
    _DAT_10766744 = param_2;
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;       _fprintf(g_10764584,"%s","dx.device->SetViewport( &dxState.viewport )\n");
        _fflush(g_10764584);
      }
      (**(void **)(*g_101d1bf8 + 0xbc))(g_101d1bf8,&DAT_10766730);
    } whi
	int g_101d1bf8 = DAT_101d1bf8;le (DAT_1076a830 != 0);
  }
  return;
}


