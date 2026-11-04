
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00441ce0(void)

{
  DWORD DVar1;
  uint uVar2;
  uint uVar3;
  BOOL BVar4;
  tagMSG local_24;
  float local_8;
  
  DVar1 = GetTickCount();
  local_8 = (float)(int)DVar1;
  if ((int)DVar1 < 0) {
    local_8 = local_8 + _DAT_00556a84;
  }
  uVar2 = FUN_004df760();
  uVar3 = GetTickCount();
  while (uVar3 < uVar2) {
    BVar4 = PeekMessageA(&local_24,(HWND)0x0,0,0,1);
    if (BVar4 != 0) {
      TranslateMessage(&local_24);
      DispatchMessageA(&local_24);
    }
    uVar3 = GetTickCount();
  }
  return;
}

