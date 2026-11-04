
void __thiscall FUN_00410fe0(int param_1,CDataExchange *param_2)

{
  DDX_Text(param_2,0x599,param_1 + 0x70);
  DDX_Text(param_2,0x598,param_1 + 0x74);
  DDX_Check(param_2,0x59a,(int *)(param_1 + 0x78));
  DDX_Check(param_2,0x59b,(int *)(param_1 + 0x7c));
  return;
}

