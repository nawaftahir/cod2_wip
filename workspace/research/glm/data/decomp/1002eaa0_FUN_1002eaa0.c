// 1002eaa0 size=186 FUN_1002eaa0

void FUN_1002eaa0(void)

{
  int *piVar1;
  
  piVar1 = (int *)FUN_1000d4b0();
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",
               "dx.device->StretchRect( dxState.renderTargetSurface, 0, imageSurface, 0, D3DTEXF_LINEAR )\n"
              );
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0x88))(DAT_101d1bf8,DAT_10766728,0,piVar1,0,2);
  } while (DAT_1076a830 != 0);
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","imageSurface->Release()\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*piVar1 + 8))(piVar1);
  } while (DAT_1076a830 != 0);
  return;
}


