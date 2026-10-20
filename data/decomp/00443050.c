
void __thiscall FUN_00443050(CWnd *param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  int iVar1;
  tagSCROLLINFO local_20;
  
  FUN_004fceb0(param_2,param_3,param_4);
  local_20.nMin = 0;
  local_20.nMax = 0;
  local_20.nPage = 0;
  local_20.nPos = 0;
  local_20.nTrackPos = 0;
  local_20.cbSize = 0x1c;
  local_20.fMask = 0x17;
  CWnd::GetScrollInfo(param_1,1,&local_20,0x17);
  switch(param_2) {
  case 0:
    FUN_00442140();
    return;
  case 1:
    iVar1 = local_20.nPos + 0xf;
    break;
  case 2:
    FUN_00442140();
    return;
  case 3:
    iVar1 = DAT_01128d9c + local_20.nPos;
    break;
  case 4:
  case 5:
  default:
    goto switchD_004430a9_default;
  }
  if (iVar1 < DAT_01128da4) {
    FUN_00442140();
    return;
  }
switchD_004430a9_default:
  FUN_00442140();
  return;
}

