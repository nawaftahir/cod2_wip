
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00403920(void)

{
  int X;
  int in_EAX;
  tagPOINT local_c;
  
  GetCursorPos(&local_c);
  X = *(int *)(in_EAX + 0xdc);
  if ((local_c.x != X) || (local_c.y != *(int *)(in_EAX + 0xe0))) {
    *(float *)(in_EAX + 0x70) = *(float *)(in_EAX + 0x70) - (float)(local_c.x - X) * _DAT_00556b64;
    local_c.y = (LONG)((float)(local_c.y - *(int *)(in_EAX + 0xe0)) * _DAT_00556b64);
    *(float *)(in_EAX + 0x6c) = *(float *)(in_EAX + 0x6c) - (float)local_c.y;
    SetCursorPos(X,*(int *)(in_EAX + 0xe0));
    *(undefined1 *)(in_EAX + 0x128) = 0;
    ShowCursor(0);
    DAT_0123348c = DAT_0123348c | (uint)(*(int *)(DAT_01233b64 + 0x214) != 0) * 4 + 1;
  }
  return;
}

