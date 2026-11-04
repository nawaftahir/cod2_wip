// 1007e441 size=68 FUN_1007e441

void FUN_1007e441(int *param_1,undefined4 param_2,int param_3,uint *param_4,int param_5)

{
  int iVar1;
  int iVar2;
  
  iVar2 = param_5 << 2;
  if (iVar2 != 0) {
    iVar1 = param_3 - (int)param_4;
    do {
      *param_4 = (uint)(*(int *)(iVar1 + (int)param_4) != 0);
      param_4 = param_4 + 1;
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  (**(code **)(*param_1 + 0x180))(param_1,param_2,param_3,param_5);
  return;
}


