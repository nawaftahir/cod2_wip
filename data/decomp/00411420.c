
void __fastcall FUN_00411420(CFrameWnd *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  puStack_c = &LAB_00524dcb;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  *(undefined ***)param_1 = &PTR_LAB_005413dc;
  local_8 = 7;
  _eh_vector_destructor_iterator_(param_1 + 0x7a4,4,0xf,FUN_00402750);
  local_8._0_1_ = 6;
  CSplitterWnd::~CSplitterWnd((CSplitterWnd *)(param_1 + 0x6b0));
  local_8._0_1_ = 5;
  CSplitterWnd::~CSplitterWnd((CSplitterWnd *)(param_1 + 0x5d8));
  local_8._0_1_ = 4;
  CSplitterWnd::~CSplitterWnd((CSplitterWnd *)(param_1 + 0x500));
  local_8._0_1_ = 3;
  FUN_00411390(param_1 + 0x2b8);
  local_8._0_1_ = 2;
  CDialogBar::~CDialogBar((CDialogBar *)(param_1 + 0x218));
  local_8._0_1_ = 1;
  *(undefined ***)(param_1 + 0x164) = &PTR_LAB_00541134;
  CToolBar::~CToolBar((CToolBar *)(param_1 + 0x164));
  local_8 = (uint)local_8._1_3_ << 8;
  CStatusBar::~CStatusBar((CStatusBar *)(param_1 + 0xd0));
  local_8 = 0xffffffff;
  CFrameWnd::~CFrameWnd(param_1);
  ExceptionList = local_10;
  return;
}

