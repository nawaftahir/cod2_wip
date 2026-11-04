// 1003e4b0 size=347 FUN_1003e4b0

void FUN_1003e4b0(void)

{
  DAT_10730550 = DAT_10730550 + -1;
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetTransform( (D3DTRANSFORMSTATETYPE)(0 + 256), &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].world.matrix[0] )\n"
                );
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,0x100,&DAT_1072def0 + DAT_10730550 * 0xcd0);
    } while (DAT_1076a830 != 0);
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetTransform( D3DTS_VIEW, &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].view.matrix[0] )\n"
                );
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,2,&DAT_1072e110 + DAT_10730550 * 0xcd0);
    } while (DAT_1076a830 != 0);
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetTransform( D3DTS_PROJECTION, &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0] )\n"
                );
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,3,&DAT_1072e220 + DAT_10730550 * 0xcd0);
    } while (DAT_1076a830 != 0);
  }
  return;
}


