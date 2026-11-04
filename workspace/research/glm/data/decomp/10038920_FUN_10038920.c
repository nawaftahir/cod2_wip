// 10038920 size=97 FUN_10038920

void FUN_10038920(void)

{
  undefined4 *in_EDX;
  undefined1 *unaff_ESI;
  int unaff_EDI;
  
  if (*(int *)*in_EDX == 3) {
    switch(*(undefined1 *)(unaff_EDI + 5)) {
    case 2:
      FUN_100388f0();
      return;
    case 3:
      if (*(int *)(DAT_101ce7f0 + 8) == 1) {
        *in_EDX = DAT_101d1b10;
        *unaff_ESI = 1;
        return;
      }
      break;
    case 4:
      FUN_100388f0();
      return;
    case 5:
      FUN_1002c910((int *)*in_EDX,*(undefined4 *)(*(int *)(unaff_EDI + 8) + 0x1c));
      *unaff_ESI = 6;
    }
  }
  return;
}


