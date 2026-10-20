
void FUN_00442200(void)

{
  int unaff_ESI;
  tagPOINT local_c;
  
  GetCursorPos(&local_c);
  DAT_0109fdc0 = local_c.x;
  DAT_0109fdbc = local_c.y;
  if (((unaff_ESI == 1) || (unaff_ESI == 5)) || (unaff_ESI == 9)) {
    FUN_00441f80();
    if (DAT_0109fdb4 != 0) {
      FUN_0043dff0();
      FUN_0043cf80(&DAT_01234a38);
    }
    if ((DAT_01233488 != -0x2b8) && (*(int *)(DAT_01233488 + 0x2d4) != 0)) {
      FUN_0043f460();
    }
    if (DAT_01234694 != 0) {
      FUN_00424b10();
    }
  }
  return;
}

