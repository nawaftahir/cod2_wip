
void FUN_0047a4a0(LONG *param_1,LONG *param_2)

{
  tagPOINT local_c;
  
  GetCursorPos(&local_c);
  *param_1 = local_c.x;
  *param_2 = local_c.y;
  return;
}

