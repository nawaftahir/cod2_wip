
void __thiscall FUN_00413900(CWnd *param_1,uint param_2,int param_3,int param_4)

{
  SHORT SVar1;
  uint uVar2;
  int iVar3;
  uint *local_8;
  
  if (param_2 != 0) {
    iVar3 = 0;
    if (0 < DAT_00590860) {
      local_8 = &DAT_0058fbf8;
      do {
        if (local_8[-1] == param_2) {
          uVar2 = 0;
          SVar1 = GetKeyState(0x12);
          if (SVar1 < 0) {
            uVar2 = 2;
          }
          SVar1 = GetKeyState(0x11);
          if (SVar1 < 0) {
            uVar2 = uVar2 | 4;
          }
          SVar1 = GetKeyState(0x10);
          if (SVar1 < 0) {
            uVar2 = uVar2 | 1;
          }
          if ((*local_8 & 7) == uVar2) {
            SendMessageA(*(HWND *)(param_1 + 0x1c),0x111,(&DAT_0058fbfc)[iVar3 * 4],0);
            if (param_3 != 0) {
              return;
            }
            if (param_4 != 0) {
              return;
            }
            SendMessageA(*(HWND *)(param_1 + 0x1c),0x111,(&DAT_0058fbfc)[iVar3 * 4],0);
            return;
          }
        }
        iVar3 = iVar3 + 1;
        local_8 = local_8 + 4;
      } while (iVar3 < DAT_00590860);
    }
    CWnd::Default(param_1);
  }
  return;
}

