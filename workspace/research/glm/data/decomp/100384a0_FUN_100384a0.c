// 100384a0 size=98 FUN_100384a0

void FUN_100384a0(void)

{
  int iVar1;
  int unaff_ESI;
  
  iVar1 = DAT_107667bc;
  if (DAT_107667bc != unaff_ESI) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","dx.device->SetVertexShader( shader )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0x170))(DAT_101d1bf8);
      iVar1 = unaff_ESI;
    } while (DAT_1076a830 != 0);
  }
  DAT_107667bc = iVar1;
  return;
}


