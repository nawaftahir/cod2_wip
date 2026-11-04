// 1003e130 size=220 FUN_1003e130

void FUN_1003e130(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_101ce708;
  iVar2 = DAT_10730550 * 0xcd0;
  (&DAT_1072e320)[iVar2] = 1;
  (&DAT_1072e321)[iVar2] = 0;
  (&DAT_1072e322)[iVar2] = 0;
  (&DAT_1072e323)[iVar2] = 0;
  (&DAT_1072e650)[iVar2] = 0;
  (&DAT_1072e651)[iVar2] = 0;
  (&DAT_1072e652)[iVar2] = 0;
  (&DAT_1072e653)[iVar2] = 0;
  (&DAT_1072e760)[iVar2] = 0;
  (&DAT_1072e761)[iVar2] = 0;
  (&DAT_1072e762)[iVar2] = 0;
  (&DAT_1072e763)[iVar2] = 0;
  (&DAT_1072e870)[iVar2] = 0;
  (&DAT_1072e871)[iVar2] = 0;
  (&DAT_1072e872)[iVar2] = 0;
  (&DAT_1072e873)[iVar2] = 0;
  if (*(int *)(iVar1 + 8) == 2) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetTransform( D3DTS_PROJECTION, &activeMatrices->projection.matrix[0] )\n"
                );
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xb0))(DAT_101d1bf8,3,&DAT_1072e220 + iVar2);
    } while (DAT_1076a830 != 0);
  }
  return;
}


