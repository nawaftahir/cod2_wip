extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_10764584;
extern unsigned int DAT_10766728;
extern unsigned int DAT_1076a830;
extern int FUN_1000d4b0();


void FUN_1002eaa0(void)

{
  int *piVar1;
  
  piVar1 = (int *)FUN_1000d4b0();
  do {
    if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;  
	int g_101ce7ec = DAT_101ce7ec;   _fprintf(g_10764584,"%s",
               "dx.device->StretchRect( dxState.renderTargetSurface, 0, imageSurface, 0, D3DTEXF_LINEAR )\n"
              );
      _fflush(g_10764584);
    }
    (**(void **)(*g_101d1bf8 + 0x88))(g_101d1bf8,DAT_10766728,0,piVar1,0,2);
  } while
	int g_101d1bf8 = DAT_101d1bf8; (g_1076a830 != 0);
 
	int g_1076a830 = DAT_1076a830; do {
    if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
      _fprintf(g_10764584,"%s","imageSurface->Release()\n");
      _fflush(g_10764584);
    }
    (**(void **)(*piVar1 + 8))(piVar1);
  } while (g_1076a830 != 0);
  return;
}


