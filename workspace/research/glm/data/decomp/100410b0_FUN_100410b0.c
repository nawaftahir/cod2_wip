// 100410b0 size=92 FUN_100410b0

void FUN_100410b0(void)

{
  undefined4 *in_EAX;
  
  switch(*in_EAX) {
  case 4:
    FUN_1003fb50();
    return;
  case 5:
    FUN_10040c00();
    return;
  case 6:
    FUN_10040f30();
    return;
  case 7:
    FUN_1003fba0();
    return;
  case 8:
    FUN_10041030();
    return;
  case 9:
    break;
  default:
    return;
  }
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    FUN_100401a0();
    return;
  }
  FUN_1003fdb0();
  return;
}


