
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_004039e0(void)

{
  float fVar1;
  int iVar2;
  int unaff_ESI;
  tagPOINT local_10;
  float local_8;
  
  GetCursorPos(&local_10);
  iVar2 = DAT_01233b64;
  if ((local_10.x != *(int *)(unaff_ESI + 0xdc)) || (local_10.y != *(int *)(unaff_ESI + 0xe0))) {
    fVar1 = ((float)*(int *)(DAT_01233b64 + 0x2b8) / _DAT_00556b60) *
            (float)(local_10.x - *(int *)(unaff_ESI + 0xdc));
    *(float *)(unaff_ESI + 0x60) =
         fVar1 * *(float *)(unaff_ESI + 0xc4) + *(float *)(unaff_ESI + 0x60);
    *(float *)(unaff_ESI + 100) = fVar1 * *(float *)(unaff_ESI + 200) + *(float *)(unaff_ESI + 100);
    *(float *)(unaff_ESI + 0x68) =
         fVar1 * *(float *)(unaff_ESI + 0xcc) + *(float *)(unaff_ESI + 0x68);
    local_8 = ((float)*(int *)(iVar2 + 0x2b8) / _DAT_00556b60) *
              (float)(local_10.y - *(int *)(unaff_ESI + 0xe0));
    *(float *)(unaff_ESI + 0x68) = *(float *)(unaff_ESI + 0x68) - local_8;
    SetCursorPos(*(int *)(unaff_ESI + 0xdc),*(int *)(unaff_ESI + 0xe0));
    *(undefined1 *)(unaff_ESI + 0x128) = 0;
    ShowCursor(0);
    DAT_0123348c = DAT_0123348c | (uint)(*(int *)(DAT_01233b64 + 0x214) != 0) * 4 + 1;
  }
  return;
}

