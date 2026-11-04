// 10038590 size=115 FUN_10038590

void FUN_10038590(void)

{
  int unaff_ESI;
  
  if ((DAT_107667c0 != 0) || (DAT_107667c4 != unaff_ESI)) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","dx.device->SetFVF( fvf )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0x164))(DAT_101d1bf8);
    } while (DAT_1076a830 != 0);
    DAT_107667c0 = 0;
    DAT_107667c4 = unaff_ESI;
  }
  return;
}


