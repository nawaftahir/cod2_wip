// 10038510 size=108 FUN_10038510

void FUN_10038510(void)

{
  int unaff_ESI;
  
  if (DAT_107667c0 != unaff_ESI) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","dx.device->SetVertexDeclaration( decl )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0x15c))(DAT_101d1bf8);
    } while (DAT_1076a830 != 0);
    DAT_107667c4 = 0;
    DAT_107667c0 = unaff_ESI;
  }
  return;
}


