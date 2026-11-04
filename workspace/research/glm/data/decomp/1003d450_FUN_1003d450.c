// 1003d450 size=100 FUN_1003d450

void FUN_1003d450(void)

{
  int iVar1;
  int unaff_ESI;
  
  iVar1 = unaff_ESI;
  if (DAT_107667cc != unaff_ESI) {
    do {
      DAT_107667cc = iVar1;
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","dx.device->SetRenderState( D3DRS_TEXTUREFACTOR, color )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x3c);
      iVar1 = DAT_107667cc;
    } while (DAT_1076a830 != 0);
  }
  return;
}


