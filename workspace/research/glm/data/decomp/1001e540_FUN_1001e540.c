// 1001e540 size=108 FUN_1001e540

void FUN_1001e540(void)

{
  int *piVar1;
  
  if (DAT_101d49b0 != 0) {
    DAT_101d49b0 = 0;
    piVar1 = *(int **)(*(int *)(DAT_101da9c8 + 0x217c78) + 8);
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","vb->Unlock()\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*piVar1 + 0x30))(piVar1);
    } while (DAT_1076a830 != 0);
  }
  return;
}


