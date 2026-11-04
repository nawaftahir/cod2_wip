// 1001f480 size=65 FUN_1001f480

int * FUN_1001f480(void)

{
  int in_EAX;
  int in_ECX;
  int *unaff_EDI;
  
  if (*unaff_EDI != 5) {
    if (*unaff_EDI == 4) {
      FUN_1001ee70(*(short *)(unaff_EDI[1] + 6) + in_EAX,*(undefined4 *)(in_ECX + 0x38));
      return unaff_EDI + 0xe;
    }
    FUN_1001f030();
  }
  return unaff_EDI + 4;
}


