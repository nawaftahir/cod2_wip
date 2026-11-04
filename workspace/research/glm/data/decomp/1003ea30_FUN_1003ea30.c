// 1003ea30 size=480 FUN_1003ea30

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003ea30(void)

{
  int in_EAX;
  undefined4 uVar1;
  
  if (in_EAX != DAT_10766718) {
    if (((*(int *)(DAT_101ce7ec + 8) != 0) &&
        (uVar1 = FUN_10060c70("\n========== RB_SetRenderTarget( %i ) ==========\n\n"),
        *(int *)(DAT_101ce7ec + 8) != 0)) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar1);
      _fflush(DAT_10764584);
    }
    DAT_10766718 = in_EAX;
    if ((&DAT_101d4820)[in_EAX * 5] != 0) {
      FUN_1003dd70();
    }
    if (DAT_10766728 != (&DAT_101d4824)[in_EAX * 5]) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetRenderTarget( 0, dx.renderTargets[newTargetId].colorSurface )\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0x94))(DAT_101d1bf8,0,(&DAT_101d4824)[in_EAX * 5]);
      } while (DAT_1076a830 != 0);
      DAT_10766728 = (&DAT_101d4824)[in_EAX * 5];
      DAT_10766724 = *(undefined4 *)(&DAT_1019087c + DAT_10766718 * 4);
      DAT_10766720 = *(undefined4 *)(&DAT_101d4830 + in_EAX * 0x14);
      DAT_1076671c = *(undefined4 *)(&DAT_101d482c + in_EAX * 0x14);
      DAT_10766730 = 0;
      DAT_10766734 = 0;
      _DAT_10766740 = 0;
      _DAT_10766744 = 0x3f800000;
      DAT_10766738 = DAT_1076671c;
      DAT_1076673c = DAT_10766720;
    }
    if (DAT_1076672c != (&DAT_101d4828)[in_EAX * 5]) {
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s",
                   "dx.device->SetDepthStencilSurface( dx.renderTargets[newTargetId].depthStencilSurface )\n"
                  );
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0x9c))(DAT_101d1bf8,(&DAT_101d4828)[in_EAX * 5]);
      } while (DAT_1076a830 != 0);
      DAT_1076672c = (&DAT_101d4828)[in_EAX * 5];
    }
    FUN_1003e690();
    return;
  }
  return;
}


