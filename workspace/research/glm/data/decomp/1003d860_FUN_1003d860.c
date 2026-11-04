// 1003d860 size=170 FUN_1003d860

void FUN_1003d860(void)

{
  int iVar1;
  int iVar2;
  
  DAT_101d495c = *(int *)(DAT_101ce6f0 + 8);
  if (DAT_101d4960 < *(int *)(DAT_101ce6f0 + 8)) {
    DAT_101d495c = DAT_101d4960;
  }
  if (DAT_101d495c < 2) {
    DAT_101d495c = 0;
  }
  iVar2 = 1;
  if (1 - DAT_101d495c < 0) {
    iVar2 = DAT_101d495c;
  }
  iVar1 = 0;
  if (0 < DAT_101d4c88) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetSamplerState( samplerIndex, D3DSAMP_MAXANISOTROPY, anisotropy )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0x114))(DAT_101d1bf8,iVar1,10,iVar2);
    } while ((DAT_1076a830 != 0) || (iVar1 = iVar1 + 1, iVar1 < DAT_101d4c88));
  }
  return;
}


