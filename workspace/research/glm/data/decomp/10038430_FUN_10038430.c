// 10038430 size=98 FUN_10038430

void FUN_10038430(void)

{
  int iVar1;
  int unaff_ESI;
  
  iVar1 = DAT_107667b8;
  if (DAT_107667b8 != unaff_ESI) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","dx.device->SetPixelShader( shader )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0x1ac))(DAT_101d1bf8);
      iVar1 = unaff_ESI;
    } while (DAT_1076a830 != 0);
  }
  DAT_107667b8 = iVar1;
  return;
}


