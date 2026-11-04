
void FUN_004a9f90(void)

{
  int iVar1;
  
  iVar1 = FUN_004a87b0();
  *(short *)(iVar1 + 2) = *(short *)(iVar1 + 2) + -1;
  if (*(short *)(iVar1 + 2) == 0) {
    FUN_004a9ba0();
  }
  return;
}

