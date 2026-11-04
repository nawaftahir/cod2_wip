
void FUN_00459210(void)

{
  int *in_EAX;
  undefined4 *unaff_EDI;
  
  if ((in_EAX[1] != 0) || (*in_EAX != 0)) {
    FUN_0047a760("Brush_AddToList: allready linked");
  }
  if ((int **)unaff_EDI == &DAT_010a44b4) {
    *in_EAX = (int)DAT_010a44b4;
    DAT_010a44b4[1] = (int)in_EAX;
    DAT_010a44b4 = in_EAX;
    in_EAX[1] = (int)&DAT_010a44b4;
    if (in_EAX[8] != 0) {
      *(undefined1 *)(in_EAX[8] + 6) = 1;
    }
    FUN_00477ba0();
    if (DAT_0109fdb4 != 0) {
      FUN_0043dff0();
      FUN_0043cf80(&DAT_01234a38);
    }
    if ((DAT_01233488 != -0x2b8) && (*(int *)(DAT_01233488 + 0x2d4) != 0)) {
      FUN_0043f460();
    }
    if (DAT_01234694 != 0) {
      FUN_00424b10();
      return;
    }
  }
  else {
    in_EAX[1] = unaff_EDI[1];
    *(int **)unaff_EDI[1] = in_EAX;
    unaff_EDI[1] = in_EAX;
    *in_EAX = (int)unaff_EDI;
  }
  return;
}

