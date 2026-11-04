
void FUN_00464c60(void)

{
  int unaff_ESI;
  
  if (*(int *)(unaff_ESI + 0x34) != 0) {
    (*DAT_0059c490)(*(int *)(unaff_ESI + 0x34));
    *(undefined4 *)(unaff_ESI + 0x34) = 0;
  }
  return;
}

