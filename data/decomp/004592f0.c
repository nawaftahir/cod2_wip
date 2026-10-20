
void FUN_004592f0(void)

{
  bool bVar1;
  int *piVar2;
  int *in_EAX;
  
  if ((in_EAX[1] == 0) || (piVar2 = DAT_010a44b8, *in_EAX == 0)) {
    FUN_0047a760("Brush_RemoveFromList: not linked");
    piVar2 = DAT_010a44b8;
  }
  do {
    if (piVar2 == &DAT_010a44b4) {
      bVar1 = false;
LAB_0045932c:
      *(int *)in_EAX[1] = *in_EAX;
      *(int *)(*in_EAX + 4) = in_EAX[1];
      *in_EAX = 0;
      in_EAX[1] = 0;
      if (bVar1) {
        if (in_EAX[8] != 0) {
          *(undefined1 *)(in_EAX[8] + 6) = 0;
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
      return;
    }
    if (piVar2 == in_EAX) {
      bVar1 = true;
      goto LAB_0045932c;
    }
    piVar2 = (int *)piVar2[1];
  } while( true );
}

