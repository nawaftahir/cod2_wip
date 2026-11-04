
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00403840(void)

{
  int X;
  int iVar1;
  int in_EAX;
  tagPOINT local_10;
  float local_8;
  
  GetCursorPos(&local_10);
  iVar1 = DAT_01233b64;
  X = *(int *)(in_EAX + 0xdc);
  if ((local_10.x != X) || (local_10.y != *(int *)(in_EAX + 0xe0))) {
    *(float *)(in_EAX + 0x70) =
         *(float *)(in_EAX + 0x70) -
         ((float)*(int *)(DAT_01233b64 + 0x2b8) / _DAT_00556b68) * (float)(local_10.x - X);
    local_8 = ((float)*(int *)(iVar1 + 0x2b8) / _DAT_00556b68) *
              (float)(local_10.y - *(int *)(in_EAX + 0xe0));
    *(float *)(in_EAX + 0x6c) = *(float *)(in_EAX + 0x6c) - local_8;
    SetCursorPos(X,*(int *)(in_EAX + 0xe0));
    *(undefined1 *)(in_EAX + 0x128) = 0;
    ShowCursor(0);
    DAT_0123348c = DAT_0123348c | (uint)(*(int *)(DAT_01233b64 + 0x214) != 0) * 4 + 1;
  }
  return;
}

