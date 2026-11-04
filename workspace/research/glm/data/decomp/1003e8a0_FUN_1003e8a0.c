// 1003e8a0 size=262 FUN_1003e8a0

void FUN_1003e8a0(void)

{
  undefined4 uVar1;
  int *unaff_ESI;
  
  if (((*(int *)(DAT_101ce7ec + 8) != 0) &&
      (uVar1 = FUN_10060c70("Viewport at (%i, %i) with size %i x %i\n",*unaff_ESI,unaff_ESI[1],
                            unaff_ESI[2],unaff_ESI[3]), *(int *)(DAT_101ce7ec + 8) != 0)) &&
     (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",uVar1);
    _fflush(DAT_10764584);
  }
  if (((*unaff_ESI != DAT_10766730) || (unaff_ESI[1] != DAT_10766734)) ||
     ((unaff_ESI[2] != DAT_10766738 || (unaff_ESI[3] != DAT_1076673c)))) {
    DAT_10766734 = unaff_ESI[1];
    DAT_10766738 = unaff_ESI[2];
    DAT_1076673c = unaff_ESI[3];
    DAT_10766730 = *unaff_ESI;
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


