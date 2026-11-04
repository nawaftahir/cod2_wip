// 1003ecb0 size=109 FUN_1003ecb0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003ecb0(void)

{
  undefined4 unaff_ESI;
  
  _DAT_1076675c = DAT_1076674c;
  DAT_1076674c = unaff_ESI;
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dx.device->SetIndices( ib )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0x1a0))(DAT_101d1bf8);
  } while (DAT_1076a830 != 0);
  _DAT_1076675c = 0;
  return;
}


