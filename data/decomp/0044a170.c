
void __thiscall FUN_0044a170(int param_1,uint param_2,int param_3,int param_4)

{
  SHORT SVar1;
  SHORT SVar2;
  SHORT SVar3;
  tagRECT local_14;
  
  *(undefined1 *)(param_1 + 0x84) = 0;
  if ((param_3 == *(int *)(param_1 + 0x118)) && (param_4 == *(int *)(param_1 + 0x11c))) {
    SVar1 = GetKeyState(0x12);
    SVar2 = GetKeyState(0x11);
    SVar3 = GetKeyState(0x10);
    if ((-1 < SVar3) && (-1 < SVar2 && -1 < SVar1)) {
      FUN_0044c280();
    }
  }
  local_14.right = param_3;
  local_14.bottom = param_4;
  GetClientRect(*(HWND *)(param_1 + 0x1c),&local_14);
  FUN_0044cf30();
  if ((param_2 & 0x13) == 0) {
    ReleaseCapture();
  }
  return;
}

