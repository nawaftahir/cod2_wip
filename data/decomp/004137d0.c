
void FUN_004137d0(int param_1,uint param_2)

{
  uint uVar1;
  bool bVar2;
  SHORT SVar3;
  SHORT SVar4;
  uint *puVar5;
  int local_c;
  
  local_c = 0;
  if (DAT_00590860 < 1) {
    return;
  }
  puVar5 = &DAT_0058fbf8;
  do {
    if (puVar5[-1] == param_2) {
      uVar1 = *puVar5;
      bVar2 = true;
      if ((uVar1 & 8) != 0) {
        if ((uVar1 & 0xfffffff7) == 0) {
          SVar3 = GetKeyState(0x12);
          SVar4 = GetKeyState(0x11);
          bVar2 = -1 < SVar4 && -1 < SVar3;
          SVar3 = GetKeyState(0x10);
          if (-1 < SVar3) goto LAB_00413862;
        }
        else {
          if (((uVar1 & 2) != 0) && (SVar3 = GetKeyState(0x12), -1 < SVar3)) {
            bVar2 = false;
          }
          if (((uVar1 & 4) != 0) && (SVar3 = GetKeyState(0x11), -1 < SVar3)) {
            bVar2 = false;
          }
          if (((uVar1 & 1) == 0) || (SVar3 = GetKeyState(0x10), SVar3 < 0)) {
LAB_00413862:
            if (bVar2) {
              SendMessageA(*(HWND *)(param_1 + 0x1c),0x111,(&DAT_0058fbfc)[local_c * 4],0);
              return;
            }
          }
        }
      }
    }
    local_c = local_c + 1;
    puVar5 = puVar5 + 4;
    if (DAT_00590860 <= local_c) {
      return;
    }
  } while( true );
}

