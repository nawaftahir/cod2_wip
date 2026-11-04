
void FUN_0042beb0(void)

{
  int iVar1;
  LRESULT LVar2;
  
  iVar1 = FUN_00401d90(&DAT_01233b68);
  if (iVar1 == 5) {
    FUN_00401df0(&DAT_01233b68);
  }
  LVar2 = SendMessageA(DAT_01234004,0xf0,0,0);
  if (LVar2 != 0) {
    FUN_0042bde0(&DAT_010a44dc);
  }
  FUN_0042bde0(&DAT_010a44b4);
  FUN_00444150();
  return;
}

