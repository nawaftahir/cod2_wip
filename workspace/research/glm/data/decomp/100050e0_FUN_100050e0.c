// 100050e0 size=73 FUN_100050e0

void FUN_100050e0(void)

{
  int *unaff_ESI;
  
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","ib->Unlock()\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*unaff_ESI + 0x30))();
  } while (DAT_1076a830 != 0);
  return;
}


