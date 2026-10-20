
void __thiscall FUN_00409b00(int param_1,CDataExchange *param_2)

{
  DDX_Control(param_2,0x549,(CWnd *)(param_1 + 0x70));
  DDX_Control(param_2,0x513,(CWnd *)(param_1 + 0xc0));
  DDX_Control(param_2,0x548,(CWnd *)(param_1 + 0x110));
  DDX_Text(param_2,0x547,param_1 + 0x160);
  DDX_Text(param_2,0x54a,(float *)(param_1 + 0x164));
  DDX_Check(param_2,0x54e,(int *)(param_1 + 0x168));
  DDX_Text(param_2,0x550,param_1 + 0x16c);
  DDX_Text(param_2,0x54b,param_1 + 0x170);
  DDX_Text(param_2,0x55f,param_1 + 0x174);
  DDX_Radio(param_2,0x55a,(int *)(param_1 + 0x178));
  return;
}

