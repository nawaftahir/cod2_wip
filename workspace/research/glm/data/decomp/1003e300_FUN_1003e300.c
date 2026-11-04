// 1003e300 size=364 FUN_1003e300

void FUN_1003e300(void)

{
  int iVar1;
  int unaff_EDI;
  
  FUN_1003e2a0();
  iVar1 = DAT_10730550 * 0xcd0;
  (&DAT_1072e210)[iVar1] = 1;
  (&DAT_1072e211)[iVar1] = 0;
  (&DAT_1072e212)[iVar1] = 0;
  (&DAT_1072e213)[iVar1] = 0;
  (&DAT_1072e320)[iVar1] = 1;
  (&DAT_1072e321)[iVar1] = 0;
  (&DAT_1072e322)[iVar1] = 0;
  (&DAT_1072e323)[iVar1] = 0;
  (&DAT_1072e430)[iVar1] = 0;
  (&DAT_1072e431)[iVar1] = 0;
  (&DAT_1072e432)[iVar1] = 0;
  (&DAT_1072e433)[iVar1] = 0;
  (&DAT_1072e650)[iVar1] = 1;
  (&DAT_1072e651)[iVar1] = 1;
  (&DAT_1072e652)[iVar1] = 0;
  (&DAT_1072e653)[iVar1] = 0;
  (&DAT_1072e760)[iVar1] = 0;
  (&DAT_1072e761)[iVar1] = 0;
  (&DAT_1072e762)[iVar1] = 0;
  (&DAT_1072e763)[iVar1] = 0;
  (&DAT_1072e870)[iVar1] = 0;
  (&DAT_1072e871)[iVar1] = 0;
  (&DAT_1072e872)[iVar1] = 0;
  (&DAT_1072e873)[iVar1] = 0;
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","dx.device->SetTransform( D3DTS_VIEW, &viewParms->viewMatrix )\n"
                );
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,2,unaff_EDI + 0x48);
    } while (DAT_1076a830 != 0);
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetTransform( D3DTS_PROJECTION, &viewParms->projectionMatrix )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,3,unaff_EDI + 0x88);
    } while (DAT_1076a830 != 0);
  }
  return;
}


