
void FUN_00408f50(int param_1)

{
  int unaff_ESI;
  int unaff_EDI;
  
  FUN_00496270();
  DAT_01148e24 = 1;
  DAT_01148e28 = FUN_0048f7c0(0,0,0,0);
  if (unaff_ESI != 0) {
    FUN_004910d0("fs_basepath");
  }
  if (unaff_EDI != 0) {
    FUN_004910d0("fs_basegame");
  }
  if (param_1 != 0) {
    FUN_004910d0("fs_game",param_1);
  }
  FUN_004820a0();
  return;
}

