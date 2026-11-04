
void FUN_004422a0(byte param_1)

{
  tagPOINT local_c;
  
  if (((param_1 & 2) != 0) && (GetCursorPos(&local_c), local_c.y != DAT_0109fdbc)) {
    FUN_00442140();
    SetCursorPos(DAT_0109fdc0,DAT_0109fdbc);
  }
  return;
}

